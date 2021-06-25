From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Sat, 26 Jun 2021 01:52:35 +0200
Message-ID: <7169bb01-7037-d011-19a3-f3040befa776@thelounge.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: slow_speed@att.net, netfilter@vger.kernel.org



Am 26.06.21 um 01:47 schrieb slow_speed@att.net:
> Yes, that was exactly my initial question.=C2=A0 I couldn't agree more.
>=20
> The issue was knowing the correct command to use force the reload. I=20
> remain unclear on that if my files are in either /etc/iptables.up.rules=20
> or /etc/iptables/rules.v4.

god or your distribution knows

* mine are generate dby a script
* that script writes to /etc/sysconfig/iptables
* my homegrown "network-up.service" loads them at boot

no need for any shiny network-config files and what not. just pure=20
"iptables" and "ip" commands in a "oneshot" systemd unit with a dozen of=20
ExecStart (the same as a shell script but with better debugging)

burn everything from the distribution with fire


[root@srv-rhsoft:~]$ cat /etc/systemd/system/network-up.service
##############################################################
#  Device-Naming: /etc/udev/rules.d/70-persistent-net.rules  #
##############################################################

[Unit]
DefaultDependencies=3Dno
RefuseManualStop=3Dyes
Description=3DNetwork
PartOf=3Dbasic.target
PartOf=3Dnetwork-online.target
Before=3Dcrond.service timers.target vnstat.service

After=3Dsys-subsystem-net-devices-wan.device
Wants=3Dsys-subsystem-net-devices-wan.device

After=3Dsys-subsystem-net-devices-lan\x2dguest.device
Wants=3Dsys-subsystem-net-devices-lan\x2dguest.device
After=3Dsys-subsystem-net-devices-lan\x2dspare1.device
Wants=3Dsys-subsystem-net-devices-lan\x2dspare1.device
After=3Dsys-subsystem-net-devices-lan\x2dspare2.device
Wants=3Dsys-subsystem-net-devices-lan\x2dspare2.device
After=3Dsys-subsystem-net-devices-lan\x2dtv.device
Wants=3Dsys-subsystem-net-devices-lan\x2dtv.device
After=3Dsys-subsystem-net-devices-poe\x2dphone.device
Wants=3Dsys-subsystem-net-devices-poe\x2dphone.device
After=3Dsys-subsystem-net-devices-poe\x2dspare.device
Wants=3Dsys-subsystem-net-devices-poe\x2dspare.device

[Service]
Type=3Doneshot
RemainAfterExit=3Dyes
SuccessExitStatus=3D80
TimeoutStartSec=3D60

ExecStart=3D/usr/sbin/ipset -file /etc/sysconfig/ipset restore
ExecStart=3D/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables

ExecStart=3D-/usr/sbin/ip link add name br-wan type bridge
ExecStart=3D-/usr/sbin/ip link set dev wan master br-wan multicast off=20
allmulticast off up
ExecStart=3D-/usr/sbin/ip link set dev vmnet1 master br-wan multicast off=20
allmulticast off up
ExecStart=3D-/usr/sbin/ip addr flush vmnet1

ExecStart=3D-/usr/bin/systemctl start vpn.service

ExecStart=3D-/usr/sbin/ip link add name br-lan type bridge
ExecStart=3D-/usr/sbin/ip link set dev br-lan up
ExecStart=3D-/usr/sbin/ip a add 192.168.2.2/255.255.255.0 broadcast=20
192.168.2.255 dev br-lan
ExecStart=3D-/usr/sbin/ip link set dev lan-spare1 master br-lan up
ExecStart=3D-/usr/sbin/ip link set dev lan-spare2 master br-lan up
ExecStart=3D-/usr/sbin/ip link set dev lan-tv master br-lan up
ExecStart=3D-/usr/sbin/ip link set dev poe-spare master br-lan up
ExecStart=3D-/usr/sbin/ip link set dev poe-phone master br-lan multicast=20
off allmulticast off up

ExecStart=3D-/usr/sbin/ip link add name br-guest type bridge
ExecStart=3D-/usr/sbin/ip link set dev br-guest multicast off allmulticast =

off up
ExecStart=3D-/usr/sbin/ip a add 192.168.10.1/255.255.255.0 broadcast=20
192.168.10.255 dev br-guest
ExecStart=3D-/usr/sbin/ip link set dev lan-guest master br-guest multicast =

off allmulticast off up

ExecStart=3D-/usr/sbin/ip route add 172.17.0.0/24 via 192.168.196.5 dev vmn=
et8

ExecStart=3D-/usr/bin/systemctl start network-wan-dhcp.service

ExecStart=3D-/usr/sbin/sysctl -q --load=3D/etc/sysctl*.conf

ExecStart=3D-/usr/sbin/tc qdisc add dev wan root handle 1 hfsc default 1
ExecStart=3D-/usr/sbin/tc class add dev wan parent 1: classid 1:1 hfsc sc=20
rate 54Mbit ul rate 54Mbit
ExecStart=3D-/usr/sbin/tc qdisc add dev wan parent 1:1 handle 11: fq_codel

[Install]
WantedBy=3Dbasic.target
[root@srv-rhsoft:~]$

> On 6/25/21 7:43 PM, Reindl Harald wrote:
>>
>>
>> Am 25.06.21 um 23:30 schrieb slow_speed@att.net:
>>> I do not believe it is something one would use a script for. Rather,=20
>>> there should be a way to reload the information into memory without=20
>>> having to reboot.
>>
>> why would you ever reboot a linux system for something trivial than=20
>> exchange, reset or realod iptables?
>>
>> * you have your ruleset
>> * you have saved it
>> * just load it
>>
>> "/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables" or=20
>> "iptables-restore" or "iptables-legacy-restore"
>>
>> there is no difference doing that at boot or any moment in time
>>
>>> On 6/25/21 4:51 PM, David Hajes wrote:
>>>> on Debian I flushed all tables including custom tables and used to=20
>>>> run iptables bash script before I moved to nftables. OpenBSD same=20
>>>> strategy - flush and reload pf.conf
>>>>
>>>> if that is what you mean by reload.
>>>>
>>>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>>>> What is the preferred command to reload the current rules for=20
>>>>> iptables? (Please include Debian environment, if distro-specific.)
