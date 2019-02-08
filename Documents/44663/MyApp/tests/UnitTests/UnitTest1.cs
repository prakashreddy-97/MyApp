using System;
using Xunit;

namespace UnitTests
{
    public class UnitTest1
    {
        [Fact]


        public void Test1()
        {
            int x = 10;
            int y = 20;
            int expected = 30;
            int actual = add(x, y);
            Assert.Equal(expected, actual);
        }
        [Theory]
        [InlineData(15,7,8)]
        [InlineData(20,15,5)]
        [InlineData(100,50,50)]
        int add(int a, int b)
        {
            return a + b;
        }
    }
}
   

