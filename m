From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: local DNAT with bind,postfix,and iptables
Date: Thu, 16 Oct 2003 08:23:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E1296039@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter list <netfilter@lists.netfilter.org>

Actually, I was referring to the 1-server setup needing 'voodoo' to get =
it working in a similar fashion to the current 2-server setup. ;)

I don't judge. Everyone can decide for themselves what's the best =
solution for their case! :D

(From a security point of view, I've always taken the stance that as =
little as possible should be running on the firewall. Especially nothing =
like Bind or a mail-server. It's only my opinion, though.)

Gaby Schilders
IBFD network admin

-----Original Message-----
From: George Vieira [mailto:georgev@citadelcomputer.com.au]
Sent: donderdag 16 oktober 2003 8:17
To: Gaby Schilders; Carlo Florendo
Cc: netfilter list
Subject: RE: local DNAT with bind,postfix,and iptables


> 1) Postfix trick mentioned by George (and obviously having=20
> only one postfix box instead of two with a voodoo like setup=20
> to compensate... ;-)
>=20

hey, that ain't voodoo man.. ;P I use this method to stop people going =
straight to my internal Microstop Exchange box and forced to go through =
my postfix box which as a transport file to relay internal but the =
machine itself.. This enables me to control the mail as well as setup =
RBL and free antivirus setup using linux...

Otherwise just put a smart host entry on your sendmail/postfix/firewall =
box to use the internal server for relaying out.. but I prefer my =
transport idea... that's what it was made for... ;P he he

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

> -----Original Message-----
> From: Gaby Schilders [mailto:G.Schilders@ibfd.org]
> Sent: Thursday, 16 October 2003 4:08 PM
> To: Carlo Florendo
> Cc: netfilter list
> Subject: RE: local DNAT with bind,postfix,and iptables
>=20
>=20
> Perhaps I'm out of line here, but there are several ways=20
> leading to Rome, as they say here.
>=20

