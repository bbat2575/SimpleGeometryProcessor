# Compile searcher exectuable
make > /dev/null

# Indicates whether a test has passed based on diff exit value
status () {
    if [ $(echo $?) -eq 0 ]; then
        echo "Test $count: Test Passed!"
    else
        echo "Test $count: Test Failed..."
    fi

    count=$((count+=1))
}

#---------------------
# GENERATOR TEST CASES
#---------------------
echo '--------------------\nGenerator Test Cases\n--------------------'
count=1
# Test 1: Regular arguments (Positive test case)
python3 gen_points.py $(cat tests/generator/test$count.in) | diff - tests/generator/test$count.expected
status
# Test 2: N equals 0 (Positive test case)
python3 gen_points.py $(cat tests/generator/test$count.in) | diff - tests/generator/test$count.expected
status
# Test 3: Mindist equals 0 (Positive test case)
python3 gen_points.py $(cat tests/generator/test$count.in) | diff - tests/generator/test$count.expected
status
# Test 4: Very large N (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 5: Negative value N (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 6: Very large mindist (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 7: Negative value mindist (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 8: Missing arguments (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 9: Missing N & mindist arguments (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 10: Missing N argument (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 11: Missing mindist argument (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 12: Missing -N= value (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 13: Missing -mindist= value (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 14: Missing -rseed= value (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status
# Test 15: Arguments in reverse order (Positive test case)
python3 gen_points.py $(cat tests/generator/test$count.in) | diff - tests/generator/test$count.expected
status
# Test 16: Mispelled agruments (Negative test case)
python3 gen_points.py $(cat tests/generator/test$count.in) 2>&1 | diff - tests/generator/test$count.expected
status

#--------------------
# SEARCHER TEST CASES
#--------------------
echo '--------------------\nSearcher Test Cases\n--------------------'
count=1
# Test 1: Regular integer inputs (Positive test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 2: Regular float inputs (Positive test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 3: Duplicate inputs (Positive test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 4: No inputs (Positive test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 5: Plus symbol inputs (Positive test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 6: Leading 0's (Positive test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 7: Valid inputs of zero (Positive test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 8: More than 2 decimal places (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 9: Trailing zeros (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 10: Inputs exceed range [-50, 50] (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 11: Non-numeric inputs (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 12: Single values - w/ & w/out commas (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 13: Triple values - w/ & w/out commas (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 14: Missing digits before and after comma (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 15: No space after comma (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 16: No comma (Negative test case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 17: Multiple commas (Edge case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 18: Multiple decimal points (Edge case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 19: Plus and minus signs in the wrong place (Edge case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 20: Multiple plus and minus signs (Edge case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 21: Whitespace in wrong places - before & after x, before & after y, and between values (Edge case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status
# Test 22: Messy input - combination of Edge & Negative cases (Corner case)
./smallest_triangle < tests/searcher/test$count.in | diff - tests/searcher/test$count.expected
status

#--------------------------------
# GENERATOR + SEARCHER TEST CASES
#--------------------------------
echo '-------------------------------\nGenerator + Searcher Test Cases\n-------------------------------'
count=1

# Test 1: Regular arguments (Positive test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 2: N equals 0 (Positive test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 3: Mindist equals 0 (Positive test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 4: Very large N (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 5: Negative value N (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 6: Very large mindist (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 7: Negative value mindist (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 8: Missing arguments (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 9: Missing N & mindist arguments (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 10: Missing N argument (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 11: Missing mindist argument (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 12: Missing -N= value (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 13: Missing -mindist= value (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 14: Missing -rseed= value (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 15: Arguments in reverse order (Positive test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status
# Test 16: Mispelled agruments (Negative test case)
python3 gen_points.py $(cat tests/generator+searcher/test$count.in) 2>/dev/null | ./smallest_triangle | diff - tests/generator+searcher/test$count.expected
status

make clean > /dev/null