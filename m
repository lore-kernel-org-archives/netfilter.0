From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT overlaps with ports
Date: Wed, 23 Sep 2009 15:45:57 +0200
Message-ID: <4ABA2695.3030804@plouf.fr.eu.org>
References: <4AB9EF8F.4020307@edu.physics.uoc.gr> <4AB9FC72.9000906@plouf.fr.eu.org> <4ABA0329.70102@edu.physics.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ABA0329.70102@edu.physics.uoc.gr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Kapetanakis Giannis a =E9crit :
>=20
> What I'm worried of is than a random connection could be created whic=
h uses
> the mapping of port 8080 of 192.168.1.1 and then the internal server=20
> would not be available.
> But I guess this is not a problem since a connection has 4 parameters=
=20
> src/dst ip/port.

Indeed, if some random outgoing connection to a remote host is mapped o=
n
source port 8080 it is very unlikely to disrupt access to the internal
server, and it would only affect access from that remote host during a
short delay after the connection has been terminated (until the mapping
is deleted).
