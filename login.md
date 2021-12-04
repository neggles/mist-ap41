# linux login challenge

when you try to log in, you get hit with a challenge like this one ( from an attempt to log in as root):

`BQXxkNC0yMC1iMC0wMC0yNi1hMnxyb290fF7RqUxej83jpoB9KKq7lVmQWpCbaEE2OQjMu5f9AyZG`

it changes depending on the username you pass, e.g.:

`username admin = BQXxkNC0yMC1iMC0wMC0yNi1hMnxhZG1pbnwlfC3729IMTK8yGWJEV6KKV66TCJppbk+chugMJRkkPQ==`
`username admim = BQXxkNC0yMC1iMC0wMC0yNi1hMnxhZG1pbXybLFFdZSIuyUfzp3ErV8weA4mOI9cmHJfH2cNgVFY8Ug==`

single character in the non-fixed segment changed here.

seems to be base64 encoded data, but it's not characters, probably encrypted in some way. 
decoding the `root` login challenges complains about there being an extra character

it gets longer with a longer username, so the username is encoded in there somewhere. adding one character to the username adds one character to the output.

they all share one common segment, `BQXxkNC0yMC1iMC0wMC0yNi1hMnx` - decoded:

`05 05 f1 90 d0 b4 c8 c0 b5 88 c0 b4 c0 c0 b4 c8 d8 b5 84 c9 f1`

all of them then have a block that's the same for the username, so that's clearly the username:

| username      | len   | encoded str          | len |
|---------------|-------|----------------------|-----|
| root          | 4     | `yb290f`             | 6   |
| mist          | 4     | `taXN0f`             | 6   |
| admin         | 5     | `hZG1pbn`            | 7   |
| admi**m**     | 5     | `hZG1pbX`            | 7   |
| admini        | 6     | `hZG1pbml8`          | 9   |
| adminis       | 7     | `hZG1pbmlzf`         | 10  |
| administrator | 13    | `hZG1pbmlzdHJhdG9yf`  | 18  |

see (challenges.md)[./challenges.md] for more examples and some more analysis

idfk what this is doing tbh. maybe someone smarter than me can work it out...
