From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 11:23:36 +0200
Message-ID: <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
 <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
 <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
 <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
 <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
 <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1624872218; bh=g8QU8AOSy2JT6aU+4RyhXtBBAumInHlbkFE+ykHJQZc=;
        l=6319; h=To:References:From:Date:In-Reply-To;
        b=BbvM/OvR/EgHDwf3QMrVQkVgBSjyAtSwDLoKLP2sASlFQ23q3axAI91ALVb5A7cCq
         FHXtuz9LsFIW+QU3bP7ZIewYqJNs8UGTlj0y2YGUo2hMxnUOdFe5CM4GlZ6OLVXiIs
         iSGElqPwGMoqbIyVQbiRVxOlCDhcqdCaSRLIZH/Hoaa9Sk638mKjJwmtXPeTz
From: Alessandro Vesely <vesely@tana.it>
In-Reply-To: <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

On Mon 28/Jun/2021 09:46:50 +0200 Reindl Harald wrote:
> Am 28.06.21 um 09:32 schrieb Alessandro Vesely:
>> On Sat 26/Jun/2021 12:43:45 +0200 Reindl Harald wrote:
>>>>>
>>>>> /usr/sbin/ipset -file /etc/sysconfig/ipset restore
>>>>> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
>>>>> /usr/sbin/sysctl -q --load=3D/etc/sysctl*.conf
>>>>>
>>>>> that way first all rules are loaded atomic and *then* "ip_forward" an=
d=20
>>>>> friends are set to avoid a leak at boot
>>>>
>>>> it may be good for you pro administrators with complex configurations.=
..I=20
>>>> have all in one file and do not need to bother about 1ms lost during r=
eload=20
>>>> nor seeking 10 different config files for simple tasks and wasting hou=
rs by=20
>>>> config. I like easy life.
>>>
>>> mixing things together which don't belong together like iptables and sy=
sctl=20
>>> is the opposite of simple as well as running a ton of commands at boot =
where=20
>>> it should be a oneliner is also the opposite
>>
>>
>> I'm with David here.=C2=A0 Besides sysctl and ipset, there are lots of i=
p=20
>> commands, modprobe's, vconfig, and a couple of home-brewed daemons (ipqb=
db). =20
>> A soundly commented script captures the logic of the network and can be =

>> maintained with more coherence than raw commands accumulated along the w=
ay. =20
>> The only drawback is that most changes, for example punching a hole in t=
he=20
>> firewall, have to be applied twice, in the boot script as well as direct=
ly in=20
>> a terminal.
> and what does this different at boot besides that it's faster and atomic =

> compared to a complex and error prone script?
>=20
> /usr/sbin/ipset -file /etc/sysconfig/ipset restore
> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
> /usr/sbin/sysctl -q --load=3D/etc/sysctl*.conf


A complex script doesn't have to be error prone.

Speed is not a concern, given that boot only happens once every few months.

Setting iptables atomically is not needed because ip link set $interface up=
 commands are issued after iptables -A ones.


> guess what - i maintain network configs with a single systemd-unit but th=
at=20
> don't justify not using "restore" commands when they exist and are approp=
riate=20
> for the task
>=20
> -------------
>=20
> [root@testserver:~]$ cat /etc/systemd/system/network-up.service


That's similar to what I do, except for restoring iptables.  As I don't use=
 systemd, my main script is a shell script in /etc/init.d/.  I paste a few =
snippets from it.


> # Firewall-Regeln laden
> ExecStart=3D/usr/sbin/ipset -file /etc/sysconfig/ipset restore
> ExecStart=3D/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
> ExecStart=3D/usr/sbin/ip6tables-nft-restore /etc/sysconfig/ip6tables
>=20
> # LAN-Interface konfiguieren
> ExecStart=3D-/usr/sbin/ip addr add 192.168.196.12/255.255.255.0 broadcast=
 192.168.196.255 dev lan
> ExecStart=3D-/usr/sbin/ip link set dev lan up


Similar at mine, except as noted.  My script starts by setting numbers, lik=
e so:

# Network setup.
# Using this is more direct and precise than ifup/ifdown, since
# all IPs are static. (However, still missing a failover strategy)
#
# interfaces names, eth{0,1,2,3,4}r are defined in /etc/udev/rules.d/70-per=
sistent-net.rules

fastweb_base=3D192.168.4
fastweb_if=3Deth0r
fastweb_bits=3D24
fastweb_ip=3D$fastweb_base.1
fastweb_cidr=3D$fastweb_ip/$fastweb_bits
fastweb_peer=3D$fastweb_base.254
fastweb_net=3D$fastweb_base.0/$fastweb_bits

# set fastweb_tracehost
fastweb_tracehost=3D"93.63.100.61"

eutelia_base=3D62.94.243
eutelia_bits=3D28
#eutelia_bits=3D30
eutelia_ip=3D$eutelia_base.226
eutelia_cidr=3D$eutelia_ip/$eutelia_bits
# Sun 04 Nov 2018: 225 =3D Destination Host Unreachable
# eutelia_peer=3D$eutelia_base.225
eutelia_peer=3D62.94.107.161
eutelia_net=3D$eutelia_base.224/$eutelia_bits

# setting eutelia=3Deth3r (leftmost), interna =3D eth2r (rightmost)
# vlan
eutelia_if_raw=3Deth3r
eutelia_if=3D${eutelia_if_raw}.2


I left old values commented out, rather than deleting them.  I try and use =
the same names for shell variables, names in rt_tables and iptables.  Devic=
e names differ.  I annotate these cross referencing in comments.

That way, I can then use shell variables in iptables commands as in the nex=
t snippet below.  How do you handle renumbering otherwise?


#########################
# for policy checking, matrix subdivision is used to gather
# packets into four chains: external and internal _in, and the
# two forwarding directions (interna2externa, externa2interna)

# first matrix subdivision
iptables -A INPUT -i $interna_if -j interna_in
iptables -A INPUT -i $eutelia_if -j eutelia_in
iptables -A INPUT -i $fastweb_if -j fastweb_in
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i tun0 -j externa_in

iptables -A FORWARD -i $interna_if -o $fastweb_if -j interna2externa
iptables -A FORWARD -i $interna_if -o $eutelia_if -j interna2externa
iptables -A FORWARD -i $eutelia_if -o $interna_if -j eutelia2interna
iptables -A FORWARD -i $fastweb_if -o $interna_if -j fastweb2interna


And eventually:


# interfaces
ip addr add $fastweb_cidr dev $fastweb_if broadcast + scope global
ip link set $fastweb_if up

# Sun 04 Nov 2018: Setting up the raw device as well...
ip addr add $eutelia_cidr dev $eutelia_if broadcast + scope global
ip link set $eutelia_if_raw up
ip link set $eutelia_if up


> # NIC-Konfiguration
> ExecStart=3D-/usr/sbin/ethtool -G lan rx 512 tx 256
> ExecStart=3D-/usr/sbin/ethtool -K lan lro off
> ExecStart=3D-/usr/sbin/ethtool -G wan rx 512 tx 256
> ExecStart=3D-/usr/sbin/ethtool -K wan lro off


I hadn't had to do that, yet (been lucky with autoconf?)


> # Routing von VPN/Host-Netzwerken
> ExecStart=3D-/usr/sbin/ip route add 10.0.0.0/24 via 192.168.196.2 dev lan
> ExecStart=3D-/usr/sbin/ip route add 172.17.0.0/24 via 192.168.196.2 dev l=
an
> ExecStart=3D-/usr/sbin/ip route add 192.168.11.0/24 via 192.168.196.2 dev=
 lan
>=20
> # Sicherstellen dass 'sysctl' angewendet wird
> ExecStart=3D-/usr/sbin/sysctl -q --load=3D/etc/sysctl*.conf


Shouldn't this be automatic?


> [root@testserver:~]$ cat /etc/systemd/system/network-wan-dhcp.service
> [Unit]
> Description=3DInternet DHCP-Client


I set up DHCP independently of the network.  It only listens to the interna=
l interface, so it's somewhat easier.  I consider it a separate issue.


Best
Ale
--=20





























