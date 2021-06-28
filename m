From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 09:46:50 +0200
Message-ID: <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Alessandro Vesely <vesely@tana.it>, netfilter@vger.kernel.org



Am 28.06.21 um 09:32 schrieb Alessandro Vesely:
> On Sat 26/Jun/2021 12:43:45 +0200 Reindl Harald wrote:
>>>>
>>>> /usr/sbin/ipset -file /etc/sysconfig/ipset restore
>>>> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
>>>> /usr/sbin/sysctl -q --load=/etc/sysctl*.conf
>>>>
>>>> that way first all rules are loaded atomic and *then* "ip_forward" 
>>>> and friends are set to avoid a leak at boot
>>>
>>> it may be good for you pro administrators with complex 
>>> configurations...I have all in one file and do not need to bother 
>>> about 1ms lost during reload nor seeking 10 different config files 
>>> for simple tasks and wasting hours by config. I like easy life.
>>
>> mixing things together which don't belong together like iptables and 
>> sysctl is the opposite of simple as well as running a ton of commands 
>> at boot where it should be a oneliner is also the opposite
> 
> 
> I'm with David here.  Besides sysctl and ipset, there are lots of ip 
> commands, modprobe's, vconfig, and a couple of home-brewed daemons 
> (ipqbdb).  A soundly commented script captures the logic of the network 
> and can be maintained with more coherence than raw commands accumulated 
> along the way.  The only drawback is that most changes, for example 
> punching a hole in the firewall, have to be applied twice, in the boot 
> script as well as directly in a terminal.
and what does this different at boot besides that it's faster and atomic 
compared to a complex and error prone script?

/usr/sbin/ipset -file /etc/sysconfig/ipset restore
/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
/usr/sbin/sysctl -q --load=/etc/sysctl*.conf

-------------

guess what - i maintain network configs with a single systemd-unit but 
that don't justify not using "restore" commands when they exist and are 
appropriate for the task

-------------

[root@testserver:~]$ cat /etc/systemd/system/network-up.service
[Unit]
DefaultDependencies=no
RefuseManualStop=yes
Description=Network
PartOf=basic.target
PartOf=network-online.target
Before=crond.service timers.target vnstat.service vmtoolsd.service

# Sicherstellen dass Netzwerk-Devices von 'udev' umbenannt wurden
After=sys-subsystem-net-devices-lan.device 
sys-subsystem-net-devices-wan.device
Wants=sys-subsystem-net-devices-lan.device 
sys-subsystem-net-devices-wan.device

[Service]
Type=oneshot
RemainAfterExit=yes
SuccessExitStatus=80
TimeoutStartSec=60

# Firewall-Regeln laden
ExecStart=/usr/sbin/ipset -file /etc/sysconfig/ipset restore
ExecStart=/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
ExecStart=/usr/sbin/ip6tables-nft-restore /etc/sysconfig/ip6tables

# LAN-Interface konfiguieren
ExecStart=-/usr/sbin/ip addr add 192.168.196.12/255.255.255.0 broadcast 
192.168.196.255 dev lan
ExecStart=-/usr/sbin/ip link set dev lan up

# WAN konfigurieren
ExecStart=-/usr/bin/systemctl start network-wan-dhcp.service

# NIC-Konfiguration
ExecStart=-/usr/sbin/ethtool -G lan rx 512 tx 256
ExecStart=-/usr/sbin/ethtool -K lan lro off
ExecStart=-/usr/sbin/ethtool -G wan rx 512 tx 256
ExecStart=-/usr/sbin/ethtool -K wan lro off

# Routing von VPN/Host-Netzwerken
ExecStart=-/usr/sbin/ip route add 10.0.0.0/24 via 192.168.196.2 dev lan
ExecStart=-/usr/sbin/ip route add 172.17.0.0/24 via 192.168.196.2 dev lan
ExecStart=-/usr/sbin/ip route add 192.168.11.0/24 via 192.168.196.2 dev lan

# Sicherstellen dass 'sysctl' angewendet wird
ExecStart=-/usr/sbin/sysctl -q --load=/etc/sysctl*.conf

[Install]
WantedBy=basic.target

-------------

[root@testserver:~]$ cat /etc/systemd/system/network-wan-dhcp.service
[Unit]
Description=Internet DHCP-Client

[Service]
ExecStartPre=-/usr/sbin/ip link set dev wan multicast off allmulticast 
off up
ExecStart=/usr/sbin/dhclient -4 -q --no-pid --request-options 
subnet-mask,broadcast-address,routers wan

Type=forking
PermissionsStartOnly=yes
SuccessExitStatus=80

Restart=always
RestartSec=5

ProtectSystem=strict
ProtectHome=yes
ReadWritePaths=-/var/lib/dhclient

PrivateTmp=yes
NoNewPrivileges=yes
ProtectKernelTunables=yes
ProtectKernelModules=yes
ProtectControlGroups=yes
MemoryDenyWriteExecute=yes
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE 
CAP_NET_BROADCAST CAP_NET_RAW

LockPersonality=yes
PrivateDevices=yes
ProtectHostname=yes
RestrictNamespaces=yes
RestrictRealtime=yes
RestrictSUIDSGID=yes

UMask=077
SystemCallArchitectures=native
SystemCallFilter=@system-service @network-io @privileged
SystemCallFilter=~@aio @chown @clock @cpu-emulation @debug @keyring 
@module @mount @obsolete @raw-io @reboot @resources @swap

InaccessiblePaths=-/boot
InaccessiblePaths=-/efi
InaccessiblePaths=-/root
