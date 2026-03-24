def expandedForm(n: Long): String =
  n.toString
    .zipWithIndex
    .map { case (ch, idx) =>
      val digit = ch.asDigit
      val zeros = n.toString.length - idx - 1
      if (digit == 0) "" else digit.toString + ("0" * zeros)
      
      
    }
    .filter(_.nonEmpty)
    .mkString(" + ")

/*
import org.scalatest.flatspec.AnyFlatSpec

class ExpandedFormSpec extends AnyFlatSpec {
  "expandedForm" should "pass basic tests" in {
    assertResult("2", "\nInput\n  n = 2") (expandedForm(2))
    assertResult("10 + 2", "\nInput\n  n = 12") (expandedForm(12))
    assertResult("40 + 2", "\nInput\n  n = 42") (expandedForm(42))
    assertResult("4000000 + 900000 + 80000 + 2000 + 300 + 40 + 2", "\nInput\n  n = 4982342") (expandedForm(4982342))
  }
  
  it should "pass edge case tests (zeroes)" in {
    assertResult("400000000 + 20000000 + 300000 + 70000 + 20 + 2", "\nInput\n  n = 4982342") (expandedForm(420370022))
    assertResult("70000 + 300 + 4", "\nInput\n  n = 70304") (expandedForm(70304))
    assertResult("9000000", "\nInput\n  n = 9000000") (expandedForm(9000000))
  }
  
  it should "pass large tests" in {
    assertResult("90000000000000 + 2000000000000 + 90000000000 + 3000000000 + 400000000 + 3000000 + 30000 + 4000 + 500 + 70 + 3", "\nInput\n  n = 92093403034573") (expandedForm(92093403034573L))
    assertResult("2000000000000 + 90000000000 + 6000000000 + 30000000 + 9000000 + 400000 + 80000 + 5000 + 200 + 90 + 3", "\nInput\n  n = 2096039485293") (expandedForm(2096039485293L))
  }
}
*/
