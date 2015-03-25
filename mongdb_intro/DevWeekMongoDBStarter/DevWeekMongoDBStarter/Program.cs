using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DevWeekMongoDBStarter.Data;
using MongoDB;
using MongoDB.Kennedy;

namespace DevWeekMongoDBStarter
{
	class Program
	{
		static void Main(string[] args)
		{
			//CreateSomeData();
			FindSomeData();


		}

		private static void FindSomeData()
		{
			var ctx = new MongoDbContext();

			var books =
				from b in ctx.Books
				where b.PageCount >= 200 //&& b.PrimaryAuthors.Any(a => a.Name == "Ted")
				orderby b.PageCount descending
				select b;

			Console.WriteLine("Query is: " + books.ToMongoQuery());

			foreach (var b in books)
			{
				Console.WriteLine("{0} with {1} pages", b.Title, b.PageCount);
			}
		}

		private static void CreateSomeData()
		{
			var ctx = new MongoDbContext();


			var book = new Book()
			{
				PageCount = 250,
				Title = "Getting started with MongoDB II",
				PublishedDate = DateTime.Now
			};

			//book.PrimaryAuthors.Add(new Author() {Name="Bill"});
			//book.PrimaryAuthors.Add(new Author() {Name="Ted"});
			//book.PrimaryAuthors.Add(new Author() {Name="Jeff"});

			ctx.Save(book);
		}
	}
}
