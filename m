From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Not quite understanding DNAT
Date: Thu, 24 Jul 2003 10:14:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E08@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: "Coutts, Ashe (Testing Account)" <ATest@sbsdk12.org>, netfilter@lists.netfilter.org

This behavior is to be expected, if not counter-intuitive to what you
could imagine, yes. ifconfig is b0rked in that way.

'ip addr' gives a more realistic appearance as to what is going on
internally if you use it instead of ifconfig or the like. I have had
issues with Redhat 9 and aliases, so I basically rewrote their aliasing
code to use 'ip addr' instead of ifconfig. It works a lot better than
eth:x even though I do create the aliases, I just use the ip addresses
for the real filtering.

Example:

I have 2 Interfaces

Internal: 192.168.1.0/27
External: 10.1.1.0/27

'ip addr' would look like this to me:

1: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
inet 192.168.1.1/27 brd 192.168.1.31 scope global eth0
inet 192.168.1.2/27 brd 192.168.1.31 scope global secondary eth0:0
inet 192.168.1.3/27 brd 192.168.1.31 scope global secondary eth0:1
inet 192.168.1.4/27 brd 192.168.1.31 scope global secondary eth0:2
...
inet 192.168.1.30/27 brd 192.168.1.31 scope global secondary eth0:30

2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
inet 10.1.1.1/27 brd 10.1.1.31 scope global eth1
inet 10.1.1.2/27 brd 10.1.1.31 scope global secondary eth1:0
inet 10.1.1.3/27 brd 10.1.1.31 scope global secondary eth1:1
inet 10.1.1.4/27 brd 10.1.1.31 scope global secondary eth1:2
...
inet 10.1.1.30/27 brd 10.1.1.31 scope global secondary eth1:30


Now when you want to use 192.168.1.4, or eth0:2 for ssh for instance,
you would just define it as:

iptables -A INPUT --destination 192.168.1.4 -p tcp --dport 22 -j ACCEPT

Some people might get anal and include the -i eth0 but that is pretty
redundant unless you are worried about spoofers and have rp_filter
/source route disabled, (bridging) etc..

That meets your requirements. All it means is that iptables needs to use
destination addresses instead of interface addresses to use
multiple-ip-per-if filtering.=20

-----Original Message-----
From: Aldo S. Lagana [mailto:alagana@discmail.com]=20
Sent: Thursday, July 24, 2003 9:44 AM
To: 'Coutts, Ashe (Testing Account)'; netfilter@lists.netfilter.org
Subject: RE: Not quite understanding DNAT

Ethernet aliases - are just aliases - that means they are a different
name
for the same thing.  So your eth0:x interface is actually eth0 to many
services that run on linux.  Netfilter (iptables) works perfectly well
with
aliases and you can specify rules with aliases.

It is the end server applications that are not very
alias-friendly...FreeS/WAN is one of them - and like you said - SHH is
one
too.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Coutts, Ashe
(Testing Account)
Sent: Thursday, July 24, 2003 12:23 PM
To: netfilter@lists.netfilter.org

I have set up a very basic firewall for our system.=20
We have 126 addresses to be used to/from the outside world
(204.48.178.0/25)

and are using 10.x numbers on the inside.

It is working almost as I expected except for the following. The DNAT=20
connections come into the system fine but are seen as originating from
the=20
eth0 interface rather than their eth0:x interface. So, when attaching to
a
linux=20
cpu with ssh I am needing to place the ip# for the eth0 interface in the

hosts.allow file rather than the much more restrictive eth0:x ip#. Can
it be
set=20
up so the connection is between the external eth0:x ip# and its linked
internal=20
ip#?


