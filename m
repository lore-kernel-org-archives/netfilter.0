From: =?iso-8859-1?q?Alberto=20D=EDez?= <albertowhiterabbit@yahoo.es>
Subject: (unknown)
Date: Fri, 7 Mar 2008 09:06:54 +0100 (CET)
Message-ID: <223031.68565.qm@web26501.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

hi!
=20
 I am trying to make use of a large number of rules
 with iptables.=20
=20
 I have seen there are some optimizations referenced
 like nf-HiPAC (www.hipac.org) , iptables with
 classifiers (www.geocities.com/hamidreza_jm) which
 appearently can deal with thousands of rules (thats
 what i need).
=20
 I want per flow (orig addr,dst addr, orig port, dst
 port, proto) filtering thats why i don=B4t think i can
 use ipsets (or can i?)
 I also would like to have the nice iptables features
 like  mangle table and counters ..
=20
 I dont really understand what the conntrack does, or
 if it can somehow helpme (where is the nice
 documentation about this??)
=20
 What is the netfilter preferred way to have a large
 set of rules and still do packet filtering?  are
 HiPAC, iptables with classifiers or any other
 solution
 actual?
=20
 is there a howto,manual,some kind of
 documentation, all that I find about this are quite
 old (3 years?) material in the mailing list ... Is
 this problem already solved? what was the solution
 taken?
=20
=20
 well if you could answer any of this questions i
 would
 be very thankful
=20
 Alberto Diez
=20
=20
     =20


      ______________________________________________=20
Enviado desde Correo Yahoo!
Disfruta de una bandeja de entrada m=E1s inteligente. http://es.docs.ya=
hoo.com/mail/overview/index.html
