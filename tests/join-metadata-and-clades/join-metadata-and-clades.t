Join pathogen metadata pulled from an external database with nextclade clade calls into one final metadata file.

Create metadata file for testing.

  $ cat > metadata_raw.tsv <<~~
  > strain	date
  > id_1	2023-01-01
  > id_2	2023-02-02
  > ~~

Create nextclade file for testing.

  $ cat > nextclade.tsv <<~~
  > seqName	clade	outbreak	lineage	coverage	totalMissing	totalSubstitutions	totalNonACGTNs	qc.missingData.status	qc.mixedSites.status	qc.privateMutations.status	qc.frameShifts.status	qc.stopCodons.status	frameShifts	isReverseComplement
  > id_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1	val_1
  > id_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2	val_2
  > ~~

Check whether join-metadata-clades script produces an output metadata file, but do not assess the accuracy or validity of that output file.

  $ python $TESTDIR/../../join-metadata-and-clades.py \
  >  --id-field strain \
  >  --metadata metadata_raw.tsv \
  >  --nextclade nextclade.tsv \
  >  -o test_metadata.tsv