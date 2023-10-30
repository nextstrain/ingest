Test that general rules (using *) work.

  $ cat >rules.tsv <<~~
  > r_raw/c_raw/*/*	r_annotated/c_annotated/*/*
  > r_raw/c_raw/d_raw/*	r_annotated/c_annotated/d_annotated/l_annotated
  > ~~

  $ echo '{"region": "r_raw", "country": "c_raw", "division": "another_d_raw", "location": "l_raw"}' \
  >   | $TESTDIR/../../apply-geolocation-rules \
  >       --geolocation-rules rules.tsv
  {"region":"r_annotated","country":"c_annotated","division":"another_d_raw","location":"l_raw"}

  $ echo '{"region": "r_raw", "country": "c_raw", "division": "d_raw", "location": "l_raw"}' \
  >   | $TESTDIR/../../apply-geolocation-rules \
  >       --geolocation-rules rules.tsv
  {"region":"r_annotated","country":"c_annotated","division":"d_annotated","location":"l_annotated"}
