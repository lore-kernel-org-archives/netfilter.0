From: Roman Fiedler <roman.fiedler@ait.ac.at>
Subject: Re: Diskless and Firewall
Date: Thu, 1 Apr 2010 16:20:14 +0200
Message-ID: <4BB4AB9E.3080208@ait.ac.at>
References: <1270117547.3335.15.camel@khaled-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1270117547.3335.15.camel@khaled-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Khaled Hussein <khaled@bisan.com>
Cc: netfilter <netfilter@vger.kernel.org>

Khaled Hussein wrote:
> Dear All,
>=20
> I am running a machine with diskless boot, it is running CentOS, i ha=
ve problem with iptables, when i restart iptables i lost connection wit=
h NFS server so i lost my hard disks and machine become unreachable, th=
is happened when i use DROP as default policy on INPUT and OUTPUT and F=
ORWARD chains, i tried to use mangle table with default ACCEPT on these=
 chains but the same, if i changed default policy to ACCEPT on above ch=
ains, so is there any way to avoid this problem

I had same problem with autosetup thingy recently. I think that the fol=
lowing fixed the problem for me (and not something else, that I overloo=
ked while tuning the configs):

* Set conntrack liberal globally (via proc)

* Load minimal iptables set with accept on all chains (which is as secu=
re as having no rules, like before, so nothing lost)

* Make sure to have traffic on all connections your want to keep alive,=
 netfilter seems to create conntracks for them (you might use the connt=
rack tools for the same work also). In your case you might open a file,=
 you haven't read yet to force NFS traffic.

* Switch to your final ruleset, that has a --state ESTABLISHED -j ACCEP=
T at the beginning of each chain (I loaded with iptables-restore to avo=
id glitches that might kill a connection)

* Disable conntrack liberal

The final rules were strict, with output filtering and stateful connect=
ion tracking.

Hope this is helpful,

--=20
Roman Fiedler
Safety & Security Department
Information Management & eHealth

AIT Austrian Institute of Technology GmbH
Reininghausstra=C3=9Fe 13/1  |  8020 Graz  |  Austria
T +43(0) 316 586570-63  |  M +43(0) 664 8251194  |  F +43(0) 316 586570=
-12
roman.fiedler@ait.ac.at <mailto:roman.fiedler@ait.ac.at> | http://www.a=
it.ac.at <http://www.ait.ac.at/>
http://www.ait.ac.at/eHealth/ <http://www.ait.ac.at/eHealth/>

=46N: 115980 i HG Wien  |  UID: ATU14703506
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
