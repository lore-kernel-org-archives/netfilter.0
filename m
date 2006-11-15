From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: how to change ip source address of incoming packets
Date: Wed, 15 Nov 2006 10:31:44 +0100
Message-ID: <455ADE80.8080003@freemail.hu>
References: <20768C3A-7F88-4816-8B52-2DE7A6910C64@borea.si>
	<455ACC13.2070801@freemail.hu>
	<30B51F1D-F230-4F45-BDB6-050DBB82AC3E@borea.si>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <30B51F1D-F230-4F45-BDB6-050DBB82AC3E@borea.si>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Matevz Langus <matevz.langus@borea.si>
Cc: netfilter@lists.netfilter.org

Matevz Langus =EDrta:
> To easy to be true. Tried this one already. I get this:
>
> iptables v1.3.5: Can't use -i with POSTROUTING
>
:-D Right :-D
Okay, then try this:

iptables -t mangle -A PREROUTING -j CONNMARK -i eth0.10 -s 192.168.1.1=20
-d $firewal_virtual_ip_on_10 --set-mark 1
iptables -t mangle -A PREROUTING -j CONNMARK -i eth0.11 -s 192.168.1.1=20
-d $firewal_virtual_ip_on_11 --set-mark 2
=2E..
iptables -t nat -A PREROUTING -j DNAT -m connmark --mark 1=20
--to-destination $firewal_real_ip_on_10
iptables -t nat -A PREROUTING -j DNAT -m connmark --mark 2=20
--to-destination $firewal_real_ip_on_11
=2E..


iptables -t mangle -A OUTPUT -j CONNMARK -d 192.168.10.1 --set-mark 1
iptables -t mangle -A OUTPUT -j CONNMARK -d 192.168.11.1 --set-mark 2
=2E..

iptables -t nat -A OUTPUT -j DNAT -m mark ! --mark 0 --to-destination=20
192.168.1.1

iptables -t mangle -A POSTROUTING -j ROUTE -m mark --mark 1 --oif  eth0.1=
0
iptables -t mangle -A POSTROUTING -j ROUTE -m mark --mark 2 --oif  eth0.1=
1
=2E..
iptables -t nat -A POSTROUTING -j SNAT -m mark --mark 1 --to-source=20
$firewal_virtual_ip_on_10
iptables -t nat -A POSTROUTING -j SNAT -m mark --mark 2 --to-source=20
$firewal_virtual_ip_on_12
=2E..

With this scenario the devices on the VLANs can only talk to the firewall=
=2E..

> Matevz
>
> On Nov 15, 2006, at 9:13 AM, G=E1sp=E1r Lajos wrote:
>
>> iptables -t nat -A POSTROUTING -j SNAT -i eth0.10 -s 192.168.1.1=20
>> --to-source 192.168.10.1
>
>


