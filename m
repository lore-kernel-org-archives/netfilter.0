From: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Subject: Iptables segfault on ubuntu
Date: Fri, 13 May 2011 14:34:26 +0200
Message-ID: <9F69795E29C890408AC2DAF646C89BB3799EBB3860@MAILBOX.arc.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello list,

Please could someone with a trunk iptables installation test the follow=
ing command.

iptables -A OUTPUT --source "" -j ACCEPT

This segfaults on natty iptables v1.4.10 and I do not want to compile i=
ptables from trunk for crosscheck.

DI Roman Fiedler
Safety & Security Department
Information Management & eHealth

AIT Austrian Institute of Technology GmbH
Reininghausstrae 13/1=A0 |=A0 8020 Graz=A0 |=A0 Austria
T +43(0) 316 586570-63=A0 |=A0 M +43(0) 664 8561599=A0 |=A0 F +43(0) 31=
6 586570-12
roman.fiedler@ait.ac.at <mailto:roman.fiedler@ait.ac.at> | http://www.a=
it.ac.at <http://www.ait.ac.at/>
http://www.ait.ac.at/eHealth/ <http://www.ait.ac.at/eHealth/>

Kennen Sie die www.eHealth2011.at?

=46N: 115980 i HG Wien=A0 |=A0 UID: ATU14703506
This email and any attachments thereto, is intended only for use by the=
 addressee(s) named herein and may contain legally privileged and/or co=
nfidential information. If you are not the intended recipient, please n=
otify the sender by return e-mail or by telephone and delete this messa=
ge from your system and any printout thereof. Any unauthorized use, rep=
roduction, or dissemination of this message is strictly prohibited. Ple=
ase note that e-mails are susceptible to change. AIT Austrian Institute=
 of Technology GmbH shall not be liable for the improper or incomplete =
transmission of the information contained in this communication, nor sh=
all it be liable for any delay in its receipt.

