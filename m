From: Sergey Alexanov <freak@volia.net>
Subject: Re: ip_conntrack hashsize problem
Date: Tue, 06 Feb 2007 19:37:12 +0200
Message-ID: <45C8BCC8.3090808@volia.net>
References: <45C89FD5.4020508@volia.net>
	<Pine.LNX.4.61.0702061810530.30216@yvahk01.tjqt.qr>
Reply-To: freak@volia.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0702061810530.30216@yvahk01.tjqt.qr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"; format="flowed"
Cc: netfilter@lists.netfilter.org

Jan Engelhardt =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Feb 6 2007 17:33, Sergey Alexanov wrote:
>=20
>>can anybody suggest me in the following issue:
>>
>># grep ip_conntrack /etc/modprobe.conf
>>options ip_conntrack hashsize=3D2097152
>>
>>#  modprobe ip_conntrack
>>#  lsmod | grep ip_conntrack
>>ip_conntrack           53924  0
>>
>># cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
>>16777216
>># cat /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets
>>2097152
>>
>>looking fine..
>>
>>but if i try to insert above 16000 rules with connection tracking i get=
ting an
>>error:
>=20
>=20
> "number of rules" is completely different to "ip_conntrack_max".
>=20
>=20
>=20
> Jan

Jan, im not completely understand what you mean...

i try to aplly large set of rules without connection tracking,
# wc -l ./firewall2.sav
32771 ./firewall2.sav

#less ./firewall2.sav
*mangle
-A PREROUTING -p tcp -d xx.yy.240.0 --dport 80 -j MARK --set-mark 80
-A PREROUTING -p tcp -s xx.yy.240.0 --sport 80 -j MARK --set-mark 80
[..skipped..]
-A PREROUTING -p tcp -d xx.yy.255.255 --dport 82 -j MARK --set-mark 82
-A PREROUTING -p tcp -s xx.yy.255.255 --sport 82 -j MARK --set-mark 82
COMMIT

and whooalah:
# iptables-restore < ./firewall2.sav

without errors and warnings

# iptables -t mangle -L -n | wc -l
32782


in addition to connection tracking issues,
in messages log file arised following warning all time when i try to=20
apply ruleset with connection tracking:

kernel: allocation failed: out of vmalloc space - use vmalloc=3D<size> to=
=20
increase size.

unfortunately i dont have strong knowledge about tuning memory=20
allocation and kernel hacking.. :(


--=20
Sergey Alexanov
SA1215-RIPE
freak@volia.net


