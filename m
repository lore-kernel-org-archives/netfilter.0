From: David Binderman <dcb314@hotmail.com>
Subject: ebtables-2.0.10: 2 * bad if statements
Date: Mon, 24 Jun 2013 19:15:11 +0000
Message-ID: <DUB118-W344B0826EA66ED19D5BD439C8A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello there,

I just ran the static analysis checker "cppcheck" over the
source code of ebtables-2.0.10. It said

1.

[extensions/ebt_ip.c:58]: (warning) Logical disjunction always evaluate=
s to true: port>=3D 0 || port <=3D 65535.

Source code is

=A0=A0=A0 else if (port>=3D 0 || port <=3D 0xFFFF) {
=A0=A0=A0=A0=A0=A0=A0 return port;
=A0=A0=A0 }

Some thing like

=A0=A0=A0 else if (port>=3D 0 && port <=3D 0xFFFF) {
=A0=A0=A0=A0=A0=A0=A0 return port;
=A0=A0=A0 }

might be better.

2.

[extensions/ebt_ip6.c:111]: (warning) Logical disjunction always evalua=
tes to true: port>=3D 0 || port <=3D 65535.

Duplicate

Regards

David Binderman 		 	   		  