From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: DNAT udp 192.163.1.2:514 -> 127.0.0.1:1514 -- from local box
Date: Thu, 17 Jul 2003 07:43:29 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF29@wardrive.citadelcomputer.com.au>
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
To: Graham Swallow <Information-Cascade@ntlworld.com>, LIST-netfilter <netfilter@lists.netfilter.org>

Update your iptables firstly, and secondly use the p-o-m patch to fix =
the OUTPUT NAT problem.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Graham Swallow [mailto:Information-Cascade@ntlworld.com]
Sent: Thursday, July 17, 2003 5:59 AM
To: LIST-netfilter
Subject: DNAT udp 192.163.1.2:514 -> 127.0.0.1:1514 -- from local box



VERSION: uptables-1.2.1.a

I Type:
	iptables
		-t nat -A OUTPUT
		-p udp -d 192.168.1.2 --dport 514
		-j DNAT --to 127.0.0.1:1514
It replies:
	iptables: Invalid argument


The traffic is to ORIGINATE from a local process (this is 192.168.1.46),
heading out to a ficticious 192.168.1.2, and DNAT'd to localport 1514

syslogd reuses to log to a port other than 514, but using DNAT as a
kludge should work. I've tried a range of options, and got REDIRECT
to almost work, but after the first packet it gave connection refused.
NAT-HOWTO.txt 6.3.7 says must be OUTPUT and 127 =20

I am using socat  http://www.dest-unreach.org/socat/  to test

	socat UDP4-LISTEN:1514 -	# server

	socat -  UDP4:127.0.0.1:1514	# client


   regards
--
   Graham
   Information-Cascade -at- ntlworld.com


