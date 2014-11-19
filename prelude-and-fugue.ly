\version "2.18.2"

\header {
  title = "Prelude and Fugue in C Major"
  composer = "J.S. Bach"
}

trebVoiceOne = 
#(define-music-function
   (parser location a b c)
   (ly:pitch? ly:pitch? ly:pitch?)
#{
\relative c' { r8 $a 16 $b $c }
\relative c' { $a 16 $b $c }
\relative c' { r8 $a 16 $b $c }
\relative c' { $a 16 $b $c }
#})

trebVoiceTwo = 
#(define-music-function
   (parser location note)
   (ly:pitch?)
#{
\relative c' { r16 $note 8.~ $note 4 }
\relative c' { r16 $note 8.~ $note 4 }
#})

trebTwoVoice =
#(define-music-function
   (parser location a b c d)
   (ly:pitch? ly:pitch? ly:pitch? ly:pitch?)
#{
<< \trebVoiceOne #b #c #d \\ \trebVoiceTwo #a >>
#})

bassTwoVoice =
#(define-music-function
  (parser location a b)
  (ly:pitch? ly:pitch?)
#{
<< { r16 $b 8.~ $b 4 r16 $b 8.~ $b 4 } \\ { $a 2 $a } >>
#})

\new PianoStaff <<
  \new Staff {
    % 1
    \trebTwoVoice e g' c e | \trebTwoVoice d a' d f |
    \trebTwoVoice d g' d' f | \trebTwoVoice e g' c e |

    % 5
    \trebTwoVoice e a' e' a | \trebTwoVoice d fis a d |
    \trebTwoVoice d g' d' f | \trebVoiceOne e g c |
  }
  \new Staff { \clef "bass"
    \relative c' {
      % 1
      c2 c | c c | b b | c c |

      % 5
      c c | c c | b b | \bassTwoVoice b c |
    }
  }
>>
