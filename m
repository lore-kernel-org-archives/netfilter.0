From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: local DNAT with bind,postfix,and iptables
Date: Thu, 16 Oct 2003 16:16:50 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C4FE@wardrive.citadelcomputer.com.au>
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
To: Gaby Schilders <G.Schilders@ibfd.org>, Carlo Florendo <carlo@hq.astra.ph>
Cc: netfilter list <netfilter@lists.netfilter.org>

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

