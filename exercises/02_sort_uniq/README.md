# Exercise 02 · sort + uniq

*Order, de-duplicate and count*

**Where this shows up in DV:** Ranking which error IDs or failing tests appear most often across a regression.

## Input

```bash
cat > fruits.txt << EOF
apple
banana
apple
orange
banana
apple
grape
EOF
```

## Tasks

### 1. Sort the file.

```console
$ sort fruits.txt
apple
apple
apple
banana
banana
grape
orange
```

### 2. Show unique fruit names.

```console
$ sort -u fruits.txt
apple
banana
grape
orange
```

> **Note:** Equivalent to `sort fruits.txt | uniq`.

### 3. Count occurrences of each fruit.

```console
$ sort fruits.txt | uniq -c
      3 apple
      2 banana
      1 grape
      1 orange
```

### 4. Show the most repeated fruit.

```console
$ sort fruits.txt | uniq -c | sort -nr | awk 'NR==1 {max=$1} $1==max'
      3 apple
```

> **Note:** `NR==1 {max=$1}` stores the top count; `$1==max` then prints every line with that count, so a tie is never hidden (`head -n 1` would show only one).

## Debug notes: what went wrong first

- `uniq fruits.txt` on its own left duplicates in place: `uniq` only removes *adjacent* repeats, so sort first.
- `grep -ic apple banana grape orange fruits.txt` gave “No such file”: grep treats every word after the pattern as a file name. To search several words: `grep -E "apple|banana" fruits.txt`.
- In my first input file apple and banana were tied at 2. `head -n 1` showed only one of them; the awk filter printed both.
- `awk '... 1==$max'` printed nothing: `$max` means “the field numbered max”. The variable is plain `max`, and the field is `$1`.

## Run it

```bash
../../run_regression.sh 02     # setup + solution, compared with golden.log
```
