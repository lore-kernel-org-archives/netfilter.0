From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Measuring traffic
Date: Fri, 13 Sep 2002 10:05:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c25b47$b8007ac0$6b01a8c0@s3ac>
References: <00bb01c25afc$80e56190$37d2a8c0@nikodimov>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <00bb01c25afc$80e56190$37d2a8c0@nikodimov>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: 'dizma' <nick@riskeng.bg>, netfilter@lists.netfilter.org



Hi,

Thanks for the recommendation, Since you suggested I figured I would
ask. D you have a sampl ipac.conf file. The source file and compile
didn=92t' create one and I'm having a hard time understanding the  =
exaple
. See insert.

INSTALLATION / CONFIG FILE.

The ipac.conf file is '/etc/ipac-ng/ipac.conf'. ipac.conf controls what
data
is collected. Each line which begins with a '#' is ignored. All the
other lines have the format

  Name of rule|direction|interface|protocol|source|destination

  where
  Name of rule          Any string to identify this rule
  direction             'in' or 'out'
  interface             ip number or interface name or empty
  protocol              'tcp' or 'udp' or 'icmp' or 'all'
  source                \
  destination           both as described in ipfwadm(8), or empty
=20
In the summaries, the 'Name of rule' string identifies the counter.
Both the source and destination must be in ipfwadm/ipchains syntax -
consult the man page.

The interface can be named (for example, eth0) or its IP number can be
given.
Linux IP accounting always counts at one interface or at any interface.
The
direction means in or out of this interface.

* You must run the fetchipac -S after changing the=20
* ipac.conf file every time for the changes to take effect!

An example ipac.conf file comes with the distribution.

Cant' find it anywhere in the source

> try ipac-ng packet
>=20
> http://sourceforge.net/projects/ipac-ng/
>=20


