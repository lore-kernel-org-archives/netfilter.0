From: bossk <bossk@tyntec.biz>
Subject: Re: simple netfilter machine redirection
Date: Sun, 16 Mar 2008 23:45:32 +0100
Message-ID: <200803162345.33028.bossk@tyntec.biz>
References: <200803162323.m2GNNXe3013255@dell2.home>
Reply-To: bossk@tyntec.biz
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803162323.m2GNNXe3013255@dell2.home>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marty Leisner <leisner@rochester.rr.com>
Cc: netfilter@vger.kernel.org

On Monday 17 March 2008 00:23:33 Marty Leisner wrote:
> I want to accomplish something simple with iptables..
> (I've used IPtables successfully without really understanding how to =
do
> something from scratch -- I just followed "recipes")
>=20
> I want machine A to redirect port 80 to machine B.
>=20
> What's a way to do it?  (seems simple enough).
>=20
> I've tried a number of ways, and nothing seems to work...
>=20
> (the machine isn't a firewall)

iptables -t nat -A PREROUTING -p TCP --dport 80 -j DNAT --to <IP of mac=
hine B>:<Port of machine B>

HTH,
bossk

--=20
bossk
System Administration
TynTec

Tel:    +49 231 47 790-469
Mob:    +49 172 83 68 751
=46ax:    +49 231 10 87 992
Email:  bossk@tyntec.biz
http:   www.tyntec.biz
=20
=20
UK-Douglas:          |UK-London:           |Germany-Munich:   |Germany-=
Dortmund:
11 Hope Street       |                     |                  |
Douglas              |20 Eastcastle Street |Klenzestrasse 57b |Wittekin=
dstrasse 105
IM1 1AQ              |London W1W 8DB       |80469 Muenchen    |44139 Do=
rtmund
Isle of Man /UK      |UK                   |Germany           |Germany


=46or TynTec GmbH: TynTec GmbH, Dortmund, Gesch=E4ftsf=FChrer: Michael =
Kowalzik,
Thorsten Trapp, HRB Nr. 16438, Registergericht Dortmund

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This electronic mail transmission and any accompanying attachments
contain confidential information intended only for the use of the
individual or entity named above. Any dissemination, distribution,
copying or action taken in reliance on the contents of this
communication by anyone other than the intended recipient is strictly=20
prohibited. If you have received this communication in error please  =20
immediately delete the E-mail and either notify the sender at
the above E-mail address. Thank you.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
