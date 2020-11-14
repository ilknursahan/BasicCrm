using BasicCrm.Entities.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace BasicCrm.DAL.Concrete.EntityFramework
{
   public class BasicCrmContext:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB; initial catalog=BasicCrm; integrated security=true");

            

        }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<User> Users { get; set; }

        public DbSet<CustomerDetail> CustomerDetails { get; set; }


    }
}
