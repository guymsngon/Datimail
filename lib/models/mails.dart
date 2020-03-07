import 'package:flutter/material.dart';

class JoinType {
  final String name;
  final String type;
  JoinType({this.name, this.type});
}

class Mail {
  final int id;
  final String title;
  final String date;
  final Color color;
  final String image;
  final String subtitle;
  final String content;
  final int numberOfMail;
  final List<JoinType> joinPieces;

  Mail({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.joinPieces,
    this.numberOfMail,
    this.date,
    this.color,
    this.content,
  });
}

List<Mail> mails = [
  Mail(
      id: 0,
      title: 'WordPress',
      subtitle: '[teegro...] Demande de moderation pour " Contactez-nous! "',
      content:
          'Un nouveau commentaire sur l\'article " Contactez-nous! " attends votre approbation http://ouiasso.org/ entreprise de livraison a domicile',
      date: '2020-02-26',
      color: Colors.green),
  Mail(
      id: 1,
      title: 'Google',
      subtitle: 'Alerte de securite',
      content:
          'Connexion sur un nouvel appareil bayigha37@datigmail.com. Un utilisateur vient de se connecter a votre compte datimail. Une demande de verification vous est donc envoyee',
      date: '2020-02-24',
      numberOfMail: 3,
      color: Colors.red),
  Mail(
      id: 2,
      title: 'JOBS IN CANADA',
      content:
          'Desormais grace a emigration efficace travailler au Canada et obtenez la nationalite en seulement 2 ans. Pour plus d\'informations veuillez consulter +237 655 38 72 45 M. Daniel SJokua Directeur Generale Sous centre cameroun',
      date: '2020-02-24',
      numberOfMail: 2,
      color: Colors.cyan),
  Mail(
      id: 3,
      title: 'WordPress',
      subtitle: '[teegro...] Demande de moderation pour " Contactez-nous! "',
      content:
          'Un nouveau commentaire sur l\'article " Contactez-nous! " attends votre approbation http://ouiasso.org/ entreprise de livraison a domicile',
      date: '2020-02-26',
      color: Colors.orange,
      image: 'image1.jpg'),
  Mail(
    id: 4,
    title: 'Google',
    subtitle: 'Alerte de securite',
    content:
        'Connexion sur un nouvel appareil bayigha37@datigmail.com. Un utilisateur vient de se connecter a votre compte datimail. Une demande de verification vous est donc envoyee',
    date: '2020-02-24',
    numberOfMail: 8,
    color: Colors.yellow,
    joinPieces: [JoinType(name: 'Protocole pour imac pop3', type: 'file')],
  ),
  Mail(
    id: 5,
    title: 'JOBS IN CANADA',
    content:
        'Desormais grace a emigration efficace travailler au Canada et obtenez la nationalite en seulement 2 ans. Pour plus d\'informations veuillez consulter +237 655 38 72 45 M. Daniel SJokua Directeur Generale Sous centre cameroun',
    date: '2020-02-24',
    color: Colors.limeAccent,
  ),
  Mail(
    id: 6,
    title: 'WordPress',
    subtitle: '[teegro...] Demande de moderation pour " Contactez-nous! "',
    content:
        'Un nouveau commentaire sur l\'article " Contactez-nous! " attends votre approbation http://ouiasso.org/ entreprise de livraison a domicile',
    date: '2020-02-26',
    image: 'image2.jpg',
    color: Colors.green,
  ),
];
