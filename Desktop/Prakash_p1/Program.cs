using System;

namespace p1
{
    class Program
    {
        static void Main(string[] args)
        {
            var hasFunds = true;
            var count = 0;
            var age = 0;
            var name = "";
            var money = 0.0m;
            var chr = 'y';
            var gun = 0;
            var totalCost = 0.0m;
            var MIN_AGE = 16;
            var cart = "";
            //Printing name of the user
            while (name == "")
            {
                Console.WriteLine("Enter your name");
                name = Console.ReadLine();
            }
            Console.WriteLine($"Hello {name}.\n");

            //Taking the age of the user
            while (age == 0)
            {
                Console.WriteLine("Enter your age: ");
                var ans = Console.ReadLine();
                age = Convert.ToInt32(ans);
            }

            //Validating the age
            if (age < MIN_AGE)
            {
                Console.WriteLine($"Sorry you must be above {MIN_AGE} to buy a gun.");
            }
            else
            {
                //Taking the budget of the user
                Console.WriteLine("Enter your budget for today's shopping: \n");
                var ans1 = Console.ReadLine();
                money = Convert.ToDecimal(ans1);
                if (money >= 190)
                {
                    while (hasFunds)
                    {

                        while (chr != 'n')
                        {
                            Console.WriteLine("\nEnter the gun that you want to buy: ");
                            Console.WriteLine("\n1. AKM\t\t$200\n2. M416\t\t$250\n3. Kar98K\t$350\n4. Scar-L\t$190");
                            var v = Console.ReadLine();
                            gun = Convert.ToInt32(v);

                            switch (gun)
                            {
                                case 1:
                                if (money >= 200)
                                    {
                                        Console.WriteLine("Enter number of AKM's you want: ");
                                        var a = Console.ReadLine();
                                        count = Convert.ToInt32(a);
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");
                                    if (money >= 200 * count)
                                    {

                                        totalCost += count * 200;
                                        money -= count * 200;
                                        cart = String.Concat(cart, $"\n\tAKM x {count}");
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");

                                    break;

                                case 2:
                                    if (money >= 250)
                                    {
                                        Console.WriteLine("Enter number of M416's you want: ");
                                        var a = Console.ReadLine();
                                        count = Convert.ToInt32(a);
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");
                                    if (money >= 250 * count)
                                    {

                                        totalCost += count * 250;
                                        money -= count * 250;
                                        cart = String.Concat(cart, $"\n\tM416 x {count}");
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");

                                    break;

                                case 3:
                                    if (money >= 350)
                                    {
                                        Console.WriteLine("Enter number of Kar98K's you want: ");
                                        var a = Console.ReadLine();
                                        count = Convert.ToInt32(a);
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");
                                    if (money >= 350 * count)
                                    {

                                        totalCost += count * 350;
                                        money -= count * 350;
                                        cart = String.Concat(cart, $"\n\tKar98K x {count}");
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");

                                    break;

                                case 4:
                                    if (money >= 190)
                                    {
                                        Console.WriteLine("Enter number of Scar-L's you want: ");
                                        var a = Console.ReadLine();
                                        count = Convert.ToInt32(a);
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");
                                    if (money >= 190 * count)
                                    {

                                        totalCost += count * 190;
                                        money -= count * 190;
                                        cart = String.Concat(cart, $"\n\tScar-L x {count}");
                                    }
                                    else
                                        Console.WriteLine("You do not have enough funds");

                                    break;

                            }
                            if (money >= 190)
                            {
                                hasFunds = true;
                            }
                            else
                            {
                                hasFunds = false;
                            }
                            //printing the items that the user bought and the remaining balance
                            Console.WriteLine($"Your cart: {cart}");
                            Console.WriteLine($"Your cart total: {totalCost}");
                            Console.WriteLine($"Available balance: {money}");
                            Console.WriteLine("Do your want to continue? y or n");
                            var ans2 = Console.ReadLine();
                            chr = Convert.ToChar(ans2);
                        }

                    }
                }
                else
                {
                    Console.WriteLine("You do not have enough funds");
                }
            }
        }
    }
}
