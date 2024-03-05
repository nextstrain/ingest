Test an exact rule with no generalization.

  $ cat >rules.tsv <<~~
  > r_raw/c_raw/d_raw/l_raw	r_annotated/c_annotated/d_annotated/l_annotated
  > ~~

It applies only when all fields are matched.

  $ echo '{"region": "r_raw", "country": "c_raw", "division": "d_raw", "location": "l_raw"}' \
  >   | $TESTDIR/../../apply-geolocation-rules \
  >       --geolocation-rules rules.tsv
  {"region":"r_annotated","country":"c_annotated","division":"d_annotated","location":"l_annotated"}

Any mismatch results in the rule not being applied.

  $ echo '{"region": "r_raw", "country": "c_raw", "division": "d_raw", "location": "another_l_raw"}' \
  >   | $TESTDIR/../../apply-geolocation-rules \
  >       --geolocation-rules rules.tsv
  {"region":"r_raw","country":"c_raw","division":"d_raw","location":"another_l_raw"}
