From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Asking again: string match fails to find anything
Date: Wed, 21 Jul 2004 03:30:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511D3@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: gypsy <gypsy@iswest.com>, netfilter <netfilter@lists.netfilter.org>

This isn't an actual answer to your question--but I think your problem =
*may* be a userland/kernel/version/compile problem (which I have no =
business answering) vs. a configuration syntax problem.

What I can tell you--I hopped on a test machine (a suse 9.0 machine):

# uname -a
Linux test-fw 2.4.21-199-default #1 Fri Mar 12 08:27:41 UTC 2004 i686 =
i686 i386 GNU/Linux

# iptables -V
iptables v1.2.8

# iptables -I FORWARD -m string --string testing -j LOG --log-prefix "FW =
STRING: "

I then hit http://my.site.behind.this.firewall/testing/ from an external =
machine...

And these showed up in the logs:

Jul 21 03:01:23 test-fw kernel: FW STRING: IN=3Deth1 OUT=3Deth0 =
SRC=3Dclientip DST=3Dserverip LEN=3D543 TOS=3D0x00 PREC=3D0x00 TTL=3D39 =
ID=3D39276 DF PROTO=3DTCP SPT=3D40746 DPT=3D80 WINDOW=3D5840 RES=3D0x00 =
ACK PSH URGP=3D0

Jul 21 03:01:23 test-fw kernel: FW STRING: IN=3Deth0 OUT=3Deth1 =
SRC=3Dserverip DST=3Dclientip LEN=3D889 TOS=3D0x00 PREC=3D0x00 TTL=3D63 =
ID=3D32019 DF PROTO=3DTCP SPT=3D80 DPT=3D40746 WINDOW=3D6432 RES=3D0x00 =
ACK PSH URGP=3D0

So, the theory works--it matched in both a request and a reply.  And the =
rule syntax you posted appears to be valid...

Like I said--not an answer, but maybe someone else on the list can shed =
some light on your specific kernel/iptables/pom version and maybe a =
possible issue with string matching?

-j

-----Original Message-----
From: gypsy [mailto:gypsy@iswest.com]=20
Sent: Wednesday, July 21, 2004 2:08 AM
To: Jason Opperisano; netfilter
Subject: Re: Asking again: string match fails to find anything


Jason Opperisano wrote:
>=20
> is it possible that a rule above your "-m string --string $STRING" is =
matching the data packets of the connection; i.e, a "-m state --state =
ESTABLISHED -j ACCEPT" rule?
>=20
> -j
            |
No.  That   V "I" down there says not.
> iptables -I INPUT -m string --string $STRING -j LOG
            ^
            |
Gypsy

