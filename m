From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE:  /sbin/iptables -vnxL OUTPUT
Date: Tue, 2 Mar 2004 09:54:16 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F01@alderaan.smgtec.com>
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
To: Mario Ohnewald <mario.Ohnewald@gmx.de>, netfilter@lists.netfilter.org

The best way to get accurate interface stats IMHO:

iptables -t mangle -A PREROUTING  -i ${IF_WHATEVER}
iptables -t mangle -A POSTROUTING  -o ${IF_WHATEVER}

They get executed and get executed before anything else (I am assuming
you don't have the raw table). They don't have a jump rule so you can
still place mangle rules in pre/post without having a jump before
getting to them.


Null jumps are giving me "iptables: Too many levels of symbolic links"
for some reason, so I just used IPV4OPTSTRIP instead. I should really be
using no jump, but I never got around to investigating.

#iptables -t mangle -nvxL
Chain PREROUTING (policy ACCEPT 3766257820 packets, 3341214673464 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0        0 IPV4OPTSSTRIP  all  --  eth0   *       0.0.0.0/0
0.0.0.0/0          =20
  714986 677460576 IPV4OPTSSTRIP  all  --  eth1   *       0.0.0.0/0
0.0.0.0/0          =20
  784926 141884330 IPV4OPTSSTRIP  all  --  eth2   *       0.0.0.0/0
0.0.0.0/0          =20
    6536  1035116 IPV4OPTSSTRIP  all  --  eth3   *       0.0.0.0/0
0.0.0.0/0          =20
  662036 177634497 IPV4OPTSSTRIP  all  --  eth4   *       0.0.0.0/0
0.0.0.0/0          =20
   87013 21842334 IPV4OPTSSTRIP  all  --  eth5   *       0.0.0.0/0
0.0.0.0/0          =20
    6633   529006 IPV4OPTSSTRIP  all  --  eth6   *       0.0.0.0/0
0.0.0.0/0          =20
       0        0 IPV4OPTSSTRIP  all  --  eth7   *       0.0.0.0/0
0.0.0.0/0          =20
       0        0 IPV4OPTSSTRIP  all  --  eth8   *       0.0.0.0/0
0.0.0.0/0          =20
     262    26042 IPV4OPTSSTRIP  all  --  lo     *       0.0.0.0/0
0.0.0.0/0=20
<snip...>
Chain POSTROUTING (policy ACCEPT 3694111642 packets, 3354474129645
bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0        0 IPV4OPTSSTRIP  all  --  *      eth0    0.0.0.0/0
0.0.0.0/0          =20
  595104 72600985 IPV4OPTSSTRIP  all  --  *      eth1    0.0.0.0/0
0.0.0.0/0          =20
  867817 486577519 IPV4OPTSSTRIP  all  --  *      eth2    0.0.0.0/0
0.0.0.0/0          =20
    7101  1269216 IPV4OPTSSTRIP  all  --  *      eth3    0.0.0.0/0
0.0.0.0/0          =20
  770445 450764605 IPV4OPTSSTRIP  all  --  *      eth4    0.0.0.0/0
0.0.0.0/0          =20
    7304  5864346 IPV4OPTSSTRIP  all  --  *      eth5    0.0.0.0/0
0.0.0.0/0          =20
   10036   781826 IPV4OPTSSTRIP  all  --  *      eth6    0.0.0.0/0
0.0.0.0/0          =20
       0        0 IPV4OPTSSTRIP  all  --  *      eth7    0.0.0.0/0
0.0.0.0/0          =20
       0        0 IPV4OPTSSTRIP  all  --  *      eth7    0.0.0.0/0
0.0.0.0/0          =20
     262    26042 IPV4OPTSSTRIP  all  --  *      lo      0.0.0.0/0
0.0.0.0/0
<snip...>

Then to scrape them, you would:

# Inbound interface ${ifname}
/sbin/iptables -nxvL -t mangle | grep  "\*\ *${ifname}" | awk '{ print
$2 }'
# Outbound interface ${ifname}
/sbin/iptables -nxvL -t mangle | grep  "${ifname}\ *\*" | awk '{ print
$2 }'

If you have a lot more fine grained rules, I would use regex throughout
the entire thing. It might be tricky, so try spicing up the input, like
"-m mark ! --mark 0x10000" and search on !0x10000 since I doubt it would
be used elsewhere. Just remember through, if you have a large enough
ruleset, this can eventually impact your bandwidth utilization if the
bandwith kills your CPU trying to match these rules :-)

> How come it wont count up the Accepted packaged and Bytes?
> If you need any more infos, please tell me!

