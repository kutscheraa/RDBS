import sqlalchemy, tabulate
from sqlalchemy import create_engine, Column, Integer, String, Numeric, ForeignKey
from sqlalchemy.orm import sessionmaker, relationship, declarative_base


Base = sqlalchemy.orm.declarative_base()

class Book(Base):
    __tablename__ = 'books'
    book_id = Column(Integer, primary_key=True)
    title = Column(String)
    price = Column(Numeric)
    discount = relationship("ProductDiscount", uselist=False, back_populates="book")

class ProductDiscount(Base):
    __tablename__ = 'product_discounts'
    discount_id = Column(Integer, primary_key=True)
    book_id = Column(Integer, ForeignKey('books.book_id'), unique=True)
    discount_amount = Column(Numeric)
    book = relationship("Book", back_populates="discount")

engine = create_engine('mysql://user:pw:url:25060/defaultdb')
Session = sessionmaker(bind=engine)
session = Session()

query = session.query(
    Book.title,
    Book.price.label('original_price'),
    ProductDiscount.discount_amount.label('discount_amount'),
    (Book.price - ProductDiscount.discount_amount).label('discounted_price')
).join(
    ProductDiscount, ProductDiscount.book_id == Book.book_id
)

results = query.all()

headers = ['Title', 'Original Price', 'Discount Amount', 'Discounted Price']
table = [[title, original_price, discount_amount, discounted_price] for title, original_price, discount_amount, discounted_price in results]

print(tabulate.tabulate(table, headers, tablefmt='fancy_grid'))

session.close()