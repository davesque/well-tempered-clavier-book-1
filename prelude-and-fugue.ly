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
<< \absolute { r16 $b 8.~ $b 4 r16 $b 8.~ $b 4 } \\ \absolute { $a 2 $a } >>
#})

{
  \new PianoStaff <<
    \new Staff {
      % 1
      \trebTwoVoice e g' c e | \trebTwoVoice d a' d f |
      \trebTwoVoice d g' d' f | \trebTwoVoice e g' c e |

      % 5
      \trebTwoVoice e a' e' a | \trebTwoVoice d fis a d |
      \trebTwoVoice d g' d' g | \trebVoiceOne e g c |

      % 9
      \trebVoiceOne e g c | \trebVoiceOne d fis c' |
      \trebVoiceOne d g b | \trebVoiceOne e g cis |

      % 13
      \trebVoiceOne d a' d | \trebVoiceOne d f b |
      \trebVoiceOne c g' c | \trebVoiceOne a c f |

      % 17
      \trebVoiceOne a c f | \trebVoiceOne g b f' |
      \trebVoiceOne g c e | \trebVoiceOne bes c e |

      % 21
      \trebVoiceOne a c e | \trebVoiceOne a c ees |
      \trebVoiceOne b c ees | \trebVoiceOne b c d |

      % 25
      \trebVoiceOne g b d | \trebVoiceOne g c e |
      \trebVoiceOne g c f | \trebVoiceOne g b f' |

      % 29
      \trebVoiceOne a c fis | \trebVoiceOne g c g' |
      \trebVoiceOne g c f | \trebVoiceOne g b f' |

      % 33
      \trebVoiceOne g bes e |
      \relative c' { r8 s8 c16 f c a s2 } |
      \relative c'' { r8 g16 b d f d b d b g b d, f e d } |
      \relative c' { <e g c>1 } \bar "|."
    }

    \new Staff { \clef "bass"
      \relative c' {
        % 1
        c2 c | c c | b b | c c |

        % 5
        c c | c c | b b | \bassTwoVoice b c' |

        % 9
        \bassTwoVoice a c' | \bassTwoVoice d a |
        \bassTwoVoice g b | \bassTwoVoice g bes |

        % 13
        \bassTwoVoice f a | \bassTwoVoice f aes |
        \bassTwoVoice e g | \bassTwoVoice e f |

        % 17
        \bassTwoVoice d f | \bassTwoVoice g, d |
        \bassTwoVoice c e | \bassTwoVoice c g |

        % 21
        \bassTwoVoice f, f | \bassTwoVoice fis, c |
        \bassTwoVoice g, ees | \bassTwoVoice aes, f |

        % 25
        \bassTwoVoice g, f | \bassTwoVoice g, e |
        \bassTwoVoice g, d | \bassTwoVoice g, d |

        % 29
        \bassTwoVoice g, ees | \bassTwoVoice g, e |
        \bassTwoVoice g, d | \bassTwoVoice g, d |

        % 33
        \bassTwoVoice c, c |

        <<
          \relative c { r16 c8._~ c4_~ c2 } \\
          \relative c, { c2~ c } \\
          \relative c { s8 f16 a s4 c16 a f a f d f d }
        >> |

        <<
          \relative c { r16 b8._~ b4_~ b2 } \\
          \relative c, { c2~ c }
        >> |

        \absolute { <c, c>1 } \bar "|."
      }
    }
  >>
}
