From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: LOG natted packet.
Date: Wed, 15 May 2013 01:48:13 +0200
Message-ID: <5192CD3D.5090500@plouf.fr.eu.org>
References: <0c9a093fffc283dd8d4ea216e32a6763@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0c9a093fffc283dd8d4ea216e32a6763@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "federico.disante" <federico.disante@duet.it>
Cc: netfilter@vger.kernel.org

Hello,

federico.disante a =E9crit :
>=20
> My question is: why I do not get the log from the nat table in the
> PREROUTING chain?

Quote from iptables' manpage :

=3D=3D=3D=3D=3D=3D=3D=3D
nat:
     This table is consulted when a packet  that  creates  a  new
     connection  is encountered.
=3D=3D=3D=3D=3D=3D=3D=3D

Obviously, a reply packet does not create a new connection.
