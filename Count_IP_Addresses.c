#include <inttypes.h>

uint32_t ips_between (const char *start, const char *end)
{
  uint32_t a1, b1, c1, d1;
  uint32_t a2, b2, c2, d2;
  
  sscanf(start, "%u.%u.%u.%u", &a1, &b1, &c1, &d1);
  sscanf(end, "%u.%u.%u.%u", &a2, &b2, &c2, &d2);
  
  uint32_t ip1 = (a1 << 24) | (b1 << 16) | (c1 << 8) | d1;
  uint32_t ip2 = (a2 << 24) | (b2 << 16) | (c2 << 8) | d2;
  
  return ip2 - ip1;
}


/* #include <inttypes.h>
#include <criterion/criterion.h>

extern uint32_t ips_between (const char *start, const char *end);
static void do_test (const char *start, const char *end, uint32_t expected);

Test(tests_suite, sample_tests)
{
  do_test("10.0.0.0", "10.0.0.50", 50);
  do_test("20.0.0.10", "20.0.1.0", 246);
  do_test("0.0.0.0", "255.255.255.255", UINT32_MAX);
}

static void do_test (const char *start, const char *end, uint32_t expected)
{
  uint32_t actual = ips_between(start, end);
  cr_assert_eq(actual, expected,
    "for (start = %s ; end = %s)\nexpected %"PRIu32" but got %"PRIu32,
      start, end, expected, actual
  );
} */
