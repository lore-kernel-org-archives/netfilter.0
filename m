From: Stefan Berghofer <stefan.berghofer@secunet.com>
Subject: nftables: Example involving payload_raw_expr
Date: Mon, 30 Nov 2015 14:28:38 +0100
Message-ID: <565C4F06.5030102@secunet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hi all,

I just tried out the example file tests/payload-ll distributed with nft=
ables,
which makes use of payload raw expressions of the form "@..,..,..". Whi=
le the first
two declarations in the file, i.e.

  nft add table ip filter
  nft add chain ip filter input \{ type filter hook input priority 0\; =
\}

work as expected, the third declaration

  nft add rule ip filter input @ll,48,48 00:15:e9:f0:10:f8 counter

is rejected with the error message

  Error: protocol specification is invalid for this family

(the expression "@ll,48,48" is underlined in the output). Does the exam=
ple use
an outdated syntax, or have I done something wrong?

Is there any documentation on how to use payload raw expressions? I cou=
ldn't find
any mention of it in the wiki or the manpage of nftables.

I am using Linux Kernel 4.2.4, together with the latest repository vers=
ion of
libnftnl and nftables.

Greetings,
Stefan

--=20
Dr. Stefan Berghofer
Senior Consultant, Network & Client Security
Public Authorities
secunet Security Networks AG

Phone: +49 201 54 54-3606, Fax: +49 201 54 54-1323
E-Mail: stefan.berghofer@secunet.com
Ammonstra=DFe 74, 01067 Dresden, Germany
www.secunet.com

______________________________________________________________________

Registered at: Kronprinzenstra=DFe 30, 45128 Essen, Deutschland
Amtsgericht Essen HRB 13615
Management Board: Dr Rainer Baumgart (CEO), Thomas Pleines
Chairman of Supervisory Board: Dr Peter Zattler
______________________________________________________________________
