From: azteca <azteca@liwest.at>
Subject: failure to set up a "simple" rule-set to get an ssh connection through
 to a KVM/qemu guest
Date: Sat, 01 Aug 2015 10:23:56 +0200
Message-ID: <55BC821C.3030006@liwest.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=liwest.at; s=20140502;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=2YM8MGZWiHGscoSTCEJkAorGIu6VL7CdoXVrMK4Y+mw=;
	b=mktIu+6pBMbsk66viXfN0sFEICOUo2O80V5wZLVUOHTSGE/N0vnFkmof69Xei2YKWWDWos9+IIPwXyDjw90Kg89np11WpkdyAGclbvKviA/caIPk4E3ioTYygYPXuPNJiHv/ehP0Mxu5jJIuIrGRbraubq5uoLFiTKTJkb80/Z1GoKcw+mLxVS52qys+yhoQUAVzZvCiaPbSnN57iMfzH/MJALOBypNNlS2zQMBt7v/HAOuCacP5iNJ4bpqABPK9zJ6yVZ1m0nNt9DFxiNXcia34+q8k1c6FlYzPM4Pgiip2UelWeD+xX4N2LEuqaqHvpHVY2ujLzskrZhEYONEpMg==;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Good day, Ladies and Gentlemen!

If I might politely ask you, to assist an utter noob to the subject of
iptables  with the following issue:

Currently, I am in the process of setting up a KVM host with several
virtual machines, each of them has an own public IP.
That means, that four different IP-addresses are being routed to the
host's eth0.

What I am trying to achieve, is to let the host have one IP, under whic=
h
it is reachable, and to forward each of the remaining three addresses,
each with an own DNS record, to one of three according KVM guests via N=
AT.

What I have accomplished so far, is the following:
=2E) The KVM host is reachable per ssh through an enabled net-filter,
whose INPUT and FORWARD policy are otherwise set to DROP. That the
net-filter does work properly, is verifiable through /var/log/messages.
=2E) The KVM host is able to connect to a DNS Server properly.
=2E) The KVM host can send mails via nullmailer.
=2E) Also could I set up a KVM guest with Debian 8.1 Linux per
net-install, meaning, the installation inside the virtual machine was
able to reach the source mirrors from a minimal start-up CD-image, and
to download the missing installation packets from there.

What I am failing with, is, to connect to the single first setup KVM
guest in which ever way.
=2E) not only can't I connect to the virtual machine via a serial conso=
le
from virsh (but that I seem to have isolated to be a systemd related
problem; the Debian installation just doesn't provide a ttyS0 per
default, and due to the lack of /etc/inittab, I cannot seem to figure
out, how to implement one during installation).
=2E) but also can't I connect via ssh, and that is neither from the KVM
host, nor from my remote computer at home. Thus, I can't even verify,
whether the ssh daemon is actually running on the guest.=20
    Which it basically should be, as I have checked the according
install option during Debian's setup, but I do unfortunately at this
point not know with certainty, whether it is so.

So far, I have plaid around with quite a few options, after all,
assembling the rule-sets somewhat appears like playing Lego, right?
You just have to assemble them in the right order, in order to make the
right sense, and bring the right order into your otherwise senseless
disorder of a network, right?... :D
  =20
Currently, I am stuck at a point, where I get a "no route to host" erro=
r
on each connect attempt, no matter from where.
There is other evidence to support, that there is something off with th=
e
route: I don't see any dropped packages in /var/log/messages, yet still
I cannot seem to get through...
So the packets have to go lost either somewhere, before, or after they
are mangled by iptables, and my educated guess is, it is unlikely, that
it is before iptables... *g*
Of course, except if I am constantly overlooking something, as we know,
PURBCAK, the problem usually resides between chair and keyboard, so
ryfm, right?
I did.
Sorry to bother, but I am stuck at this point...
I really can't figure, what keeps sending my ssh packets into nirvana..=
=2E

So here is my config, and please forgive me for obfuscating the public
IPs, but  my head is on the line here, and I search and replaced them,
in order to avoid any typos.

The virtual machine is actually running, according to  KVM's controls:

root@RoX0R /home/aztec # virsh list
 Id    Name                           State
----------------------------------------------------
 23    HTCW                         running


The virtual network is up and running:

root@RoX0R /home/aztec # virsh net-list
 Name                 State      Autostart     Persistent
----------------------------------------------------------
 default              active     yes           yes



the network has a bridge 'virbr0':

root@RoX0R /home/aztec # virsh net-info default
Name:           default
UUID:           6f9fd67e-56e6-4067-9b74-b47eafde7428
Active:         yes
Persistent:     yes
Autostart:      yes
Bridge:         virbr0

the bridge has an IP-address; 192.168.122.1:

root@RoX0R /home/aztec # ifconfig
eth0      Link encap:Ethernet  HWaddr 50:46:5d:9f:fd:c9=20
          inet addr:1.2.3.43  Bcast:1.2.3.63  Mask:255.255.255.224
          inet6 addr: xxxx::xxxx:5dff:fe9f:fdc9/64 Scope:Link
          inet6 addr: xxxx:xxx:xxx:832a::2/64 Scope:Global
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:765196 errors:0 dropped:2890 overruns:0 frame:0
          TX packets:146591 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1034075344 (986.1 MiB)  TX bytes:30127002 (28.7 MiB)

lo        Link encap:Local Loopback=20
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:54 errors:0 dropped:0 overruns:0 frame:0
          TX packets:54 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:5655 (5.5 KiB)  TX bytes:5655 (5.5 KiB)

virbr0    Link encap:Ethernet  HWaddr fe:54:00:9e:2b:6d=20
          inet addr:192.168.122.1  Bcast:192.168.122.255  Mask:255.255.=
255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:40612 errors:0 dropped:0 overruns:0 frame:0
          TX packets:406059 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:2521321 (2.4 MiB)  TX bytes:604503575 (576.4 MiB)

vnet0     Link encap:Ethernet  HWaddr fe:54:00:9e:2b:6d=20
          inet6 addr: fe80::fc54:ff:fe9e:2b6d/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:142 errors:0 dropped:0 overruns:0 frame:0
          TX packets:26922 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500
          RX bytes:17676 (17.2 KiB)  TX bytes:1397248 (1.3 MiB)


So, the above output from ifconfig reveals, that there have been large
numbers of packets transmitted through that bridge virbr0; received
packets: 40612 and transmittet packets 406059, in sum 576.4 MiB, zero
errors, .
Same goes for virtual network vnet0; received 142, transmitted 26922,
again zero errors, not that much, but also 1.3 MiB.

And here, finally are the routes, that the KVM host OS currently provid=
es:

root@RoX0R /home/aztec # route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
default         static.33.3.2. 0.0.0.0         UG    0      0        0 =
eth0
1.2.3.32     static.33.3.2. 255.255.255.224 UG    0      0        0 eth=
0
1.2.3.32     *               255.255.255.224 U     0      0        0 et=
h0
192.168.122.0   *               255.255.255.0   U     0      0        0
virbr0


so, this is my (hopefully sufficiently) commented iptables startup scri=
pt:

#!/bin/bash

#reset all tables
iptables -F -t filter
iptables -F -t nat
iptables -F -t mangle
iptables -F -t raw
iptables -F -t security

iptables -X -t filter
iptables -X -t nat
iptables -X -t mangle
iptables -X -t raw
iptables -X -t security

iptables -Z

#port range for variable highport
phigh=3D1024:65535

#set policy for  FORWARD and INPUT to DROP
iptables -P FORWARD DROP
iptables -P INPUT DROP


##################
#####EXCEPTIONS#####
##################

#open ssh  port  at  7777, also for incoming connections
iptables -A INPUT -i eth0 -p tcp --dport 7777 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
#set dns port to 53 as sourceport and highport as destination port, new
not required, as only answers to outgoing queries are allowed
iptables -A INPUT -p udp --sport 53 --dport $phigh  -m state --state
ESTABLISHED,RELATED -j ACCEPT
#response port for nullmailer, in order to be able to answer with START=
TLS
iptables -A INPUT -p tcp --sport 587 --dport $phigh  -m state --state
ESTABLISHED,RELATED -j ACCEPT


#block brute force attacks after three unsuccessful attempts in  60 sec
iptables -I INPUT  -i eth0 -m state --state NEW -m recent --set
iptables -I INPUT  -i eth0 -m state --state NEW -m recent  --update
--seconds 300 --hitcount 4 -j DROP

#no limitations for outgoing traffic
#it is very interesting, that I have to set this, although OUTPUT polic=
y
is set to ACCEPT ...?
iptables -I OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

#no limitations for the loopback interface
iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -i lo -j ACCEPT

#forward packages from and to virtual machine HTCW
iptables -A PREROUTING -t nat -i eth0 -d 1.2.3.56 -j DNAT --to 192.168.=
122.2
iptables -A POSTROUTING -t nat -o eth0 -s 192.168.122.0/24 -j SNAT --to
1.2.3.56
iptables -I FORWARD -i eth0 -m state -d 192.168.122.0/24 --state
NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -I FORWARD -o eth0 -m state -s 192.168.122.0/24 --state
NEW,RELATED,ESTABLISHED -j ACCEPT

iptables -I FORWARD -i virbr0 -j ACCEPT
iptables -I INPUT -i virbr0  -j ACCEPT


#log dropped packages to syslog and drop rest
iptables -A INPUT   -j LOG --log-prefix "DROP (input) "
iptables -A INPUT   -j DROP
iptables -A FORWARD -j LOG --log-prefix "DROP (forward) "
iptables -A FORWARD -j DROP
iptables -A OUTPUT  -j LOG --log-prefix "DROP (output) "
#iptables -A OUTPUT  -j DROP



=46=C3=BCrther, i have tried these combinations of settings, unfortunat=
ely also
to no avail:

iptables -I FORWARD -o eth0 -j ACCEPT
iptables -I FORWARD -o virbr0 -j ACCEPT

and:

iptables -A PREROUTING -t nat -p tcp -d 1.2.3.56 --dport 777 -j DNAT
--to 192.168.1.2:22
iptables -A FORWARD -m state -p tcp -d 192.168.122.2 --dport 22 --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A POSTROUTING -t nat -p tcp  -s 192.168.122.2 --sport 22 -j
SNAT --to 1.2.3.56:777
iptables -A FORWARD -m state -s 192.168.122.2 --state
NEW,RELATED,ESTABLISHED -j ACCEPT


The result perpetually remains the same:

"ssh  -vT -p 777 aztec@1.2.3.56
OpenSSH_6.0p1 Debian-4+deb7u2, OpenSSL 1.0.1e 11 Feb 2013
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: Applying options for *
debug1: Connecting to 1.2.3.56 [1.2.3.56] port 777.
debug1: connect to address 1.2.3.56 port 777: No route to host
ssh: connect to host 1.2.3.56 port 777: No route to host

Once more, as this mailing list is public,  the 1.2.3 IP address is of
course a $IP1, and not the real IP, thanks for your understanding.

Here one last output:

root@RoX0R /home/aztec # iptables-save -c
# Generated by iptables-save v1.4.21 on Sat Aug  1 10:00:36 2015
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
[0:0] -A INPUT -i virbr0 -j ACCEPT
[0:0] -A INPUT -i eth0 -m state --state NEW -m recent --update --second=
s
300 --hitcount 4 --name DEFAULT --mask 255.255.255.255 --rsource -j DRO=
P
[0:0] -A INPUT -i eth0 -m state --state NEW -m recent --set --name
DEFAULT --mask 255.255.255.255 --rsource
[9:676] -A INPUT -i eth0 -p tcp -m tcp --dport 7777 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT
[0:0] -A INPUT -p udp -m udp --sport 53 --dport 1024:65535 -m state
--state RELATED,ESTABLISHED -j ACCEPT
[0:0] -A INPUT -p tcp -m tcp --sport 587 --dport 1024:65535 -m state
--state RELATED,ESTABLISHED -j ACCEPT
[0:0] -A INPUT -i lo -j ACCEPT
[0:0] -A INPUT -j LOG --log-prefix "DROP (input) "
[0:0] -A INPUT -j DROP
[0:0] -A FORWARD -i virbr0 -j ACCEPT
[0:0] -A FORWARD -s 192.168.122.0/24 -o eth0 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT
[0:0] -A FORWARD -d 192.168.122.0/24 -i eth0 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT
[0:0] -A FORWARD -i lo -j ACCEPT
[0:0] -A FORWARD -j LOG --log-prefix "DROP (forward) "
[0:0] -A FORWARD -j DROP
[5:856] -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
[0:0] -A OUTPUT -j LOG --log-prefix "DROP (output) "
[0:0] -A OUTPUT -j DROP
COMMIT
# Completed on Sat Aug  1 10:00:36 2015
# Generated by iptables-save v1.4.21 on Sat Aug  1 10:00:36 2015
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
[0:0] -A PREROUTING -d 1.2.3.56/32 -i eth0 -j DNAT --to-destination
192.168.122.2
[0:0] -A POSTROUTING -s 192.168.122.0/24 -o eth0 -j SNAT --to-source
1.2.3.56
COMMIT
# Completed on Sat Aug  1 10:00:36 2015
# Generated by iptables-save v1.4.21 on Sat Aug  1 10:00:36 2015
*mangle
:PREROUTING ACCEPT [9:676]
:INPUT ACCEPT [9:676]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [9:4080]
:POSTROUTING ACCEPT [9:4080]
COMMIT
# Completed on Sat Aug  1 10:00:36 2015
# Generated by iptables-save v1.4.21 on Sat Aug  1 10:00:36 2015
*raw
:PREROUTING ACCEPT [9:676]
:OUTPUT ACCEPT [9:4080]
COMMIT
# Completed on Sat Aug  1 10:00:36 2015
# Generated by iptables-save v1.4.21 on Sat Aug  1 10:00:36 2015
*security
:INPUT ACCEPT [9:676]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [9:4080]
COMMIT
# Completed on Sat Aug  1 10:00:36 2015



Any help really appreciated!

Thanks in advance, and yours, aztec








