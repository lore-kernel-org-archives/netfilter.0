From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: routing bewteen two networks on the same LAN
Date: Wed, 4 Jun 2003 08:09:11 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D9E@wardrive.citadelcomputer.com.au>
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
To: "T. Horsnell" <tsh@mrc-lmb.cam.ac.uk>, netfilter@lists.netfilter.org

WHat is the IP address for the firewall for both networks and have you =
got default gateways for both of them on all the workstations..?
Have you used the -J LOG yet to track any dropped packets?
Also, how are you using 2 IPs on the NIC, aliasing or IProute2? I'd use =
iproute2 if I were you.

Did you try to ping  the other way around and get 131.111.26.1 to ping =
10.0.0.1 and see if it reaches the firewall?

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: T. Horsnell [mailto:tsh@mrc-lmb.cam.ac.uk]
Sent: Monday, June 02, 2003 10:38 PM
To: netfilter@lists.netfilter.org
Subject: routing bewteen two networks on the same LAN



Should iptables be able to forward between two different ip
address spaces on the same LAN (i.e. using the same ethernet
adapter for both input and output)?

We currently have global ip addresses for hosts on our network
and I'm trying to migrate them to the 10. private address space.
I have a separate iptables box running as a firewall, and have=20
added entries like

iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.26.0/24
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.26.0/24 -d 10.0.0.0/9

but I cant get traffic between, say, a host 10.0.0.1 and a=20
host 131.111.26.1

If 10.0.0.1 pings 131.111.26.1, tcpdump on the firewall
shows ICMP packets arriving on eth0 from 10.0.0.1 and
apparently going  out to 131.111.26.1, but 131.111.26.1
never sees them.
(I have got IP_FORWARDING turned on..).

Any advice would be welcome.

Cheers,
Terry.

--=20


Terry Horsnell (tsh@mrc-lmb.cam.ac.uk)
I.T. Manager
Medical Research Council
Lab of Molecular Biology
Hills Road
CAMBRIDGE CB2 2QH
U.K.
Phone:	+44 (0)1223 248011
Fax:	+44 (0)1223 213556


