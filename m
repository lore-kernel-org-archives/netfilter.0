From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Not quite understanding DNAT
Date: Thu, 24 Jul 2003 12:43:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307241643.h6OGhqjX012459@discmail.com>
References: <3F1FA56E.28480.E59161E@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F1FA56E.28480.E59161E@localhost>
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
To: "'Coutts, Ashe (Testing Account)'" <ATest@sbsdk12.org>, netfilter@lists.netfilter.org

Ethernet aliases - are just aliases - that means they are a different =
name
for the same thing.  So your eth0:x interface is actually eth0 to many
services that run on linux.  Netfilter (iptables) works perfectly well =
with
aliases and you can specify rules with aliases.

It is the end server applications that are not very
alias-friendly...FreeS/WAN is one of them - and like you said - SHH is =
one
too.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Coutts, Ashe
(Testing Account)
Sent: Thursday, July 24, 2003 12:23 PM
To: netfilter@lists.netfilter.org

I have set up a very basic firewall for our system.=20
We have 126 addresses to be used to/from the outside world =
(204.48.178.0/25)

and are using 10.x numbers on the inside.

It is working almost as I expected except for the following. The DNAT=20
connections come into the system fine but are seen as originating from =
the=20
eth0 interface rather than their eth0:x interface. So, when attaching to =
a
linux=20
cpu with ssh I am needing to place the ip# for the eth0 interface in the =

hosts.allow file rather than the much more restrictive eth0:x ip#. Can =
it be
set=20
up so the connection is between the external eth0:x ip# and its linked
internal=20
ip#?

Any help or suggestions would be greatly appreciated.

Thanks

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  Start iptables script =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#!/bin/sh
/root/bin/NatReset

# First the "outside" eth0 interface on the firewall
/sbin/ifconfig eth0 204.48.178.2 netmask 255.255.255.128  \
        broadcast 204.48.178.127 up

### Now add aliases to eth0 to users/hosts from the  outside.
/sbin/ifconfig eth0:3 204.48.178.3 netmask 255.255.255.128  \
       broadcast 204.48.178.127 up
/sbin/ifconfig eth0:4 204.48.178.4 netmask 255.255.255.128  \
       broadcast 204.48.178.127 up
/sbin/ifconfig eth0:4 204.48.178.5 netmask 255.255.255.128  \
       broadcast 204.48.178.127 up

###  ethernet "eth1", i.e. the "inside" interface for the firewall=20
/sbin/ifconfig eth1 10.0.0.1 netmask 255.255.255.248  \
       broadcast 10.0.0.7 up


## Set up outside access to the mainframe
/sbin/iptables --table nat --append PREROUTING  --destination =
204.48.178.3
\
               --jump DNAT --to 10.5.2.104

## Set up outside access to a Windows 2000 cpu
/sbin/iptables --table nat --append PREROUTING  --destination =
204.48.178.4
\
               --jump DNAT --to 10.5.2.105
              =20
#  Set up inside and outside 1 to 1 mapping for W2K user
/sbin/iptables --table nat --append PREROUTING  --destination =
204.48.178.5
\
                           --jump DNAT --to 10.5.2.107
/sbin/iptables --table nat --append POSTROUTING --source 10.5.2.107/32
\
               --jump SNAT --to 204.48.178.5

## Setup NAT from entire WAN to the outside world
/sbin/iptables --table nat  --append POSTROUTING --source 0.0.0.0/0
\
               --jump SNAT --to 204.48.178.2

## Now set the genaral policies
/sbin/iptables --policy INPUT   DROP
/sbin/iptables --policy FORWARD ACCEPT
/sbin/iptables --policy OUTPUT  DROP

echo 1 > /proc/sys/net/ipv4/ip_forward
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  End iptables script =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D




"Experience is not what happens to you, it
 is what you do with what happens to you"
       -- Aldous Huxley (1894-1963)

   Ashe Coutts (acoutts@sbsdk12.org)
   805.963.7751 Ext 260
   Fax 805.884.1557



