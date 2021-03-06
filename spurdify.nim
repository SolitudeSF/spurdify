import strutils, unicode, nre, random

type
  Replacement = tuple[pattern: string, replacement: string]
  ReplacementSequence = seq[Replacement]

const spurdification: ReplacementSequence = @[
  ("kek", "geg"),
  ("epic", "ebin"),
  ("right", "rite"),
  ("your", "ur"),
  ("god", "dog"),
  ("linux", "linugs"),
  ("fucking", "fuggin"),
  ("are", "r"),
  ("you", "u"),
  ("wh", "w"),
  ("th", "d"),
  ("af", "ab"),
  ("ap", "ab"),
  ("ca", "ga"),
  ("ck", "gg"),
  ("co", "go"),
  ("ev", "eb"),
  ("ex", "egz"),
  ("et", "ed"),
  ("iv", "ib"),
  ("it", "id"),
  ("ke", "ge"),
  ("nt", "nd"),
  ("op", "ob"),
  ("ot", "od"),
  ("po", "bo"),
  ("pe", "be"),
  ("pi", "bi"),
  ("up", "ub"),
  ("va", "ba"),
  ("ck", "gg"),
  ("cr", "gr"),
  ("kn", "gn"),
  ("lt", "ld"),
  ("mm", "m"),
  ("nt", "dn"),
  ("pr", "br"),
  ("ts", "dz"),
  ("tr", "dr"),
  ("bs", "bz"),
  ("ds", "dz"),
  ("es", "es"),
  ("fs", "fz"),
  ("gs", "gz"),
  ("is", "iz"),
  ("as", "az"),
  ("ls", "lz"),
  ("ms", "mz"),
  ("ns", "nz"),
  ("rs", "rz"),
  ("ss", "sz"),
  ("ts", "tz"),
  ("us", "uz"),
  ("ws", "wz"),
  ("ys", "yz"),
  ("alk", "olk"),
  ("ing", "ign"),
  ("ic", "ig"),
  ("ng", "nk"),
  ("p", "b")
]

randomize()

proc bigEmote(match: string) : string =
  var
    leader : string
    mouth : string = "D"
  case match
  of ".": leader = ":"
  of ",": leader = "x"
  of ";":
    leader = ":"
    mouth = "O"
  else:
    return match
  var number_of_chars: int = rand(4) + 1
  return " $1$2" % [leader, repeat(mouth, number_of_chars)]

proc processText*(text : string): string =
  result = text.toLower.multiReplace(spurdification)
  result = nre.replace(result, re"[.,;]", bigEmote)
