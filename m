From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: connecting to a SMTP/POP server on the internet
Date: Thu, 17 Jul 2003 07:45:06 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF2A@wardrive.citadelcomputer.com.au>
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
To: system administrator <sysadmails@yahoo.com>, netfilter@lists.netfilter.org

Can you do it from the linux box? Are you running DSL, which by then you =
need to lower your outgoing MTU?
Have you logged any packets?
Have you run a tcpdump?

and the list goes on.....

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: system administrator [mailto:sysadmails@yahoo.com]
Sent: Thursday, July 17, 2003 1:11 AM
To: netfilter@lists.netfilter.org
Subject: connecting to a SMTP/POP server on the internet=20


Hi there,

We want to connect to a SMTP/POP server on the
internet from our LAN with:
                                                     =20
                        =20
iptables -A FORWARD -i eth0 -p tcp -j ACCEPT
iptables -A FORWARD -i eth0 -p udp -j ACCEPT
iptables -A FORWARD -j DROP
iptables -t nat -o eth1 -A POSTROUTING -j MASQUERADE
                                                     =20
                        =20
When we try to access from the workstation to the POP
server we get a message: 'connection to x.com timed
out', we can however access the mail on the firewall -
even if the connection is slow.
                                                     =20
                        =20
Please help us out ...
                                                     =20
                        =20
# Our general setup:
# RedHat 8.0 firewall with iptables installed on PII
400MHz
# eth0 =3D our LAN and eth1 =3D Internet
# cat /proc/sys/net/ipv4/ip_forward =3D> 1
# gateway on workstation in LAN pointing to firewall
# gateway defined for eth1 pointing to router

Thanks in advance,

Frank

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com


