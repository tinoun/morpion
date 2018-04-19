class BoardCase
 #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
 attr_accessor :valeur, :numero
 
 def initialize(valeur,numero)
  #TO DO doit régler sa valeur, ainsi que son numéro de case
  @valeur = valeur
  @numero = numero
  
 end
 
 def to_s
  #TO DO : doit renvoyer la valeur au format string
  @valeur.to_s
 end
end
class Board < BoardCase
 include Enumerable
 #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
 attr_accessor :array_boardcase
 def initialize
  #TO DO :
  #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
  #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
  
   @@array_boardcase = [@@case1 = BoardCase.new(" ", 1) , 
            @@case2 = BoardCase.new(" ", 2),
            @@case3 = BoardCase.new(" ", 3),
            @@case4 = BoardCase.new(" ", 4),
            @@case5 = BoardCase.new(" ", 5),
            @@case6 = BoardCase.new(" ", 6),
            @@case7 = BoardCase.new(" ", 7),
            @@case8 = BoardCase.new(" ", 8),
            @@case9 = BoardCase.new(" ", 9)  ]
            
         
 end
 def to_s
 #TO DO : afficher le plateau
 puts "Visualisation du plateau de jeu"
 puts "  1  2  3"
 puts "A #{@@case1} | #{@@case2} | #{@@case3} " 
 puts " ---|---|---"
 puts "B #{@@case4} | #{@@case5} | #{@@case6} "
 puts " ---|---|---"
 puts "C #{@@case7} | #{@@case8} | #{@@case9} "
 puts
 end
 def play(choix)
  #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
  puts "je joue"
  puts choix
  puts @@joueur1
 
  case
  when choix == "case1"
   p @@case1.valeur
   p self.valeur
   p @@case1.valeur = self.valeur
  end
  puts to_s
 end
 # def victory?
  #TO DO : qui gagne ?
 #end
end
class Player < Board
 #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
 attr_accessor :nom, :valeur
 attr_writer :win
 
 def initialize(nom, valeur)
  #TO DO : doit régler son nom, sa valeur, son état de victoire
  @nom = nom
  @valeur = valeur
  @win = false
 end
end
class Game < Player
 def initialize
  #TO DO : créé 2 joueurs, créé un board
  @@joueur1 = Player.new("Leon", "X")
  puts "Joueur1 crée #{@@joueur1.nom} qui a pour pion le #{@@joueur1.valeur}"
  @@joueur2 = Player.new("Mathilda", "O")
  puts "Joueur2 crée #{@@joueur2.nom} qui a pour pion le #{@@joueur2.valeur}"
  plateau = Board.new
 end
 def go
  # TO DO : lance la partie
  puts "Que veux tu faire?"
  turn
 end
 def turn
  #TO DO : affiche le plateau, demande au joueur il joue quoi, 
  #vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
 puts " je suis dans turn"
 #afficher le plateau
 to_s
 #demande au joueur ce qu'il joue
 puts "Ou veux tu placer ton pion?"
 choix = gets.chomp
 i = 1
  if i.odd? == true
   @@joueur1.play(choix)
  else 
   @@joueur2.play(choix)
  end
 end
end
Game.new.go