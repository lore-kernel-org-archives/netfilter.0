From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Doing MASQ for Asheron's Call
Date: Fri, 10 Oct 2003 17:19:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E68@alderaan.smgtec.com>
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
To: Ryan Anderson <ryan@michonline.com>, netfilter@lists.netfilter.org

Warning Hack alert!!!

Ok, here is one way to bend the rules in the most inflexible hard coded
hack that I could think of without recompiling.

Conntrack cannot fix this problem because the AC protocol is broken.
There, I said it. Two machines behind cannot connect to the same server
with the same source and destination ports. That is one reason why
turbine made it worse and allowed you to change the port ranges used to
connect. At that point it became nearly impossible to write a proper
iptables module.=20

If you want to write it properly, you need to statefully inspect every
packet that uses UDP. One better would be to have command line arguments
into the kernel module which filters the IP addresses searched for the
one coming from the Microsoft servers. You cannot use port filtering
since the originating port from the client can and must be a
self-defined port number.

1. In order to get multiple AC's to work behind a firewall, you must set
the port ranges on each client machine differently. Machine 1 =3D=3D =
9000
Machine2=3D 9100, etc.. This can be done in the AC configuration screen =
if
you run the ac binary directly. The following script doesn't use the
conntrack, so it must be hard coded for every user. It is probably
simpler to do it this way unless you have a lot of dynamically people
playing AC.

I am writing this from memory so there are probably simple errors
within. This is also assuming a basic restrictive firewall is already
configured.

#!/bin/bash

NET_AC=3D666.666.666.0

CLIENT1_IP=3D1.1.1.1
CLIENT2_IP=3D2.2.2.2
CLIENT1_PORTS=3D9000:9010
CLIENT2_PORTS=3D9100:9110

iptables -A FORWARD --destination ${NET_AC}/24 -p udp -m mport --dports
${CLIENT1_PORTS},${CLIENT2_PORTS} -j ACCEPT

iptables -t nat -A PREROUTING --source ${NET_AC}/24 -p udp -m mport
--dports ${CLIENT1_PORTS} -j DNAT --to ${CLIENT1_IP}

iptables -t nat -A PREROUTING --source ${NET_AC}/24 -p udp -m mport
--dports ${CLIENT2_PORTS} -j DNAT --to ${CLIENT2_IP}



