From: Robert Rebstock <rebstock@scienceworks.com>
Subject: guest MAC-address isolation
Date: Sun, 25 Jan 2009 01:39:49 +0100 (CET)
Message-ID: <1982707.41631232843989233.JavaMail.root@mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.

I am having network issues that I suspect are related to kvm's
user mode networking; in particular:

I have a server setup with virtualized kvm clients started with
"user mode" networking and RDP port redirection as follows:

 7719 ?        Sl   454:05  \_ kvm -m 2048 -redir tcp:3394::3389 ...
 7731 ?        Sl    97:58  \_ kvm -m 2048 -redir tcp:3393::3389 ...
 7768 ?        Sl   109:23  \_ kvm -m 2048 -redir tcp:3392::3389 ...
 7801 ?        Sl    43:46  \_ kvm -m 2048 -redir tcp:3391::3389 ...
 7823 ?        Sl    16:19  \_ kvm -m 2048 -redir tcp:3398::3389 ...
 7834 ?        Sl    59:38  \_ kvm -m 2048 -redir tcp:3395::3389 ...

which are being accessed by linux rdesktop clients.

Although server and clients are on the same LAN, RDP-traffic is only updated
in correlation to user input, leaving me looking for a way to circumvent this,
so that the users don't have to frantically thrash their mouse to and fro, to
get data on their usb-sticks or watch YouTube. ;-)

All kvm's are using (and must use) the same MAC-address; this shouldn't be a
problem with "-net user", right?

Aside from my specific setup, what I'm really looking for is the best way to
achieve "guest MAC-address isolation".

Is slirpvde worth trying, or maybe tcp-bridge (I suspect that the performance
is not acceptable)?

Any ideas on whether there is a way to achieve "guest MAC address isolation"
with ebtables? I can get "MAC NAT" (sort of) working with:

ebtables -t nat -A PREROUTING  -d 00:11:11:11:11:11 -j dnat --to-dest 00:01:23:45:67:89 --dnat-target ACCEPT
ebtables -t nat -A POSTROUTING -s 00:01:23:45:67:89 -j snat --to-src 00:11:11:11:11:11 --snat-arp --snat-target ACCEPT

but I have no idea on how I might be able to achieve "guest MAC address isolation"
with multiple guests needing the same MAC.

My current non "user mode" networking setup looks as such (a little debian specific):

/etc/network/interfaces:
auto lo

iface lo inet loopback



auto br0

iface br0 inet static

        bridge_ports eth0

        bridge_maxwait 0

        address 192.168.2.200

        netmask 255.255.255.0

        gateway 192.168.2.1

        pre-up modprobe ip_conntrack_tftp

        pre-up modprobe ip_conntrack_ftp

        pre-up modprobe ip_nat_tftp

        pre-up modprobe ip_nat_ftp



auto natbr0

iface natbr0 inet static

        bridge_ports dummy

        bridge_maxwait 0

        address 192.168.99.1

        netmask 255.255.255.0

        up /usr/sbin/dnsmasq --interface=natbr0  --except-interface=lo --bind-interfaces --user=nobody \

         --dhcp-range=natbr0,192.168.99.50,192.168.99.100,255.255.255.0,192.168.99.255,72h \

         --domain=example.net --pid-file=/var/run/natbr0_dnsmasq.pid --conf-file

        post-up echo 1 > /proc/sys/net/ipv4/ip_forward

        post-up iptables -t nat -A POSTROUTING -o br0 -j MASQUERADE

        post-up iptables -A FORWARD -s 192.168.99.0/24 -j ACCEPT

        post-up iptables -A FORWARD -d 192.168.99.0/24 -j ACCEPT



/etc/kvm/kvm-ifup-br:
#!/bin/sh

BRIDGE=br0

/sbin/ifconfig $1 0.0.0.0 up

/usr/sbin/brctl addif $BRIDGE $1



/etc/kvm/kvm-ifup-natbr:
#!/bin/sh

BRIDGE=natbr0

/sbin/ifconfig $1 0.0.0.0 up

/usr/sbin/brctl addif $BRIDGE $1


I would be most interested in an (guest agnostic) ebtables solution. Any help or insight is much appreciated.

Thank you in advance,
best regards,

Robert

PS. Please BCC me, as I am not on the list.
