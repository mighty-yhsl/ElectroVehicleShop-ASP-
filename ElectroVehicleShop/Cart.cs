using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;  // CollectionBase
using System.IO;

namespace ElectroVehicleShop
{
    [Serializable]
    // Використовується (успадковується) базова колекція CollectionBase
    public class Cart : CollectionBase
    {
        // Метод для додавання до колекції Cart об'єкта класу CartUnit
        public void Add(CartUnit newCartUnit)
        {
            List.Add(newCartUnit);
        }
        // Метод видалення з колекції Cart об'єкта класу CartUnit
        public void Remove(CartUnit newCartUnit)
        {
            List.Remove(newCartUnit);
        }
        /** Метод для отримання індексу об'єкта класу CartUnit у колекції Cart */
        public int IndexCartUnit(CartUnit newCartUnit)
        {
            return List.IndexOf(newCartUnit);
        }
        /** Метод для отримання загальної кількості об'єктів класу CartUnit у колекції Cart */
        public int CountCartUnit()
        {
            return List.Count;
        }
        /** Метод видалення всіх об'єктів CartUnit з колекції Cart */
        public void DeleteAll()
        {
            List.Clear();
        }
        /** Метод, що визначає ітератор колекції Cart для використання в циклі forech */
        public CartUnit this[int Index]
        {
            get
            {
                return (CartUnit)List[Index];
            }
            set
            {
                List[Index] = value;
            }
        }
    }
}