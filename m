From: Robert Allmeroth <robert.allmeroth@epygi.de>
Subject: Re: Conntrack helper problems (patch-o-matic-20030107)
Date: Thu, 27 Feb 2003 23:38:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302272238.h1RMcGT9002611@ally.epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

rehi :)

> On Thu, 2003-02-27 at 17:16, Robert Allmeroth wrote:
>>
>> here is what i have / see:
>>
>> FTP conntrack problem:
>> bash-2.05# cat /proc/net/ip_conntrack
>> tcp      6 431573 ESTABLISHED src=3D172.30.255.1 dst=3D10.20.0.17 sport=
=3D1572 dport=3D21 src=3D10.20.0.17 dst=3D10.20.10.197 sport=3D21
>> dport=3D1572 [ASSURED] use=3D1
>> EXPECTING: - use=3D1 proto=3D6 src=3D10.20.0.17 dst=3D10.20.10.197 spor=
t=3D0 dport=3D1573
>>
>> The sport=3D0 seems wrong to me..
>>
> Hi Robert,

> It's not necessarily wrong. Basically a conntrack helper
> will tell connection tracking what connection to expect
> based on IP/TCP header and packet payload info from the
> "master" connection.

> Often, it will get both IP addresses, plus one port
> (destination port is the obvious candidate). With this
> info, the expectation will be set up. The other port
> is "random" (ie. picked by the client) and can't
> really be predicted.

> When a conntrack helper sets up an expecation, it
> fills in the necessary values and also uses a mask
> to point out the relevant info.

> The sport=3D0 here basically means "any port" and is
> probably the result of the mask being set to 0 for
> the sport of the expectation.

ok.. got it.. :-)

> About your problem, are all relevant conntrack + nat
> modules loaded (check with lsmod) ?

here it is.. everything not listed in the modules dir is
compiled into the kernel..

bash-2.05# lsmod
Module                  Size  Used by
ip_nat_h323             3872   0  (unused)
ip_conntrack_h323       3632   1  [ip_nat_h323]
ip_nat_irc              3792   0  (unused)
ip_conntrack_irc        4336   1  [ip_nat_irc]
ip_nat_ftp              4896   0  (unused)
ip_conntrack_ftp        5472   1  [ip_nat_ftp]

bash-2.05# ls -al /lib/modules/2.4.18/kernel/net/ipv4/netfilter/=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
-rw-------    1 0        0          184508 Jan  1  1970 ip_conntrack_egg.o
-rw-------    1 0        0          190900 Jan  1  1970 ip_conntrack_ftp.o
-rw-------    1 0        0          187412 Jan  1  1970 ip_conntrack_h323.=
o
-rw-------    1 0        0          187672 Jan  1  1970 ip_conntrack_irc.o
-rw-------    1 0        0          188176 Jan  1  1970 ip_conntrack_mms.o
-rw-------    1 0        0          187912 Jan  1  1970 ip_conntrack_pptp.=
o
-rw-------    1 0        0          147400 Jan  1  1970 ip_conntrack_proto=
_gre.o
-rw-------    1 0        0          138068 Jan  1  1970 ip_conntrack_quake=
3.o
-rw-------    1 0        0          191184 Jan  1  1970 ip_nat_ftp.o
-rw-------    1 0        0          191496 Jan  1  1970 ip_nat_h323.o
-rw-------    1 0        0          188216 Jan  1  1970 ip_nat_irc.o
-rw-------    1 0        0          189364 Jan  1  1970 ip_nat_mms.o
-rw-------    1 0        0          188972 Jan  1  1970 ip_nat_pptp.o
-rw-------    1 0        0          139188 Jan  1  1970 ip_nat_proto_gre.o
-rw-------    1 0        0          139372 Jan  1  1970 ip_nat_quake3.o

--------

i also checked again an old software version with 2.4.18 and iptables-1.2.=
5 with
everything compiled into the kernel.. in that version everything worked fi=
ne.
except h323 and pptp ;-) these two modules are the reason why i do all tha=
t :)

we cannot simply go to a kernel version > 2.4.18. Its an embedded system (=
PPC) with
many self programmed addons.. *sigh*..=20

regards
  Robert



