From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: block msn
Date: Thu, 17 Jul 2003 07:45:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF2B@wardrive.citadelcomputer.com.au>
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
To: juanca <juanca@sat.com.py>, netfilter@lists.netfilter.org

Another one... Use TCPDUMP and see where there're coming from.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: juanca [mailto:juanca@sat.com.py]
Sent: Wednesday, July 16, 2003 9:36 PM
To: netfilter@lists.netfilter.org
Subject: block msn=20


I`ve got this rulset but It doesn`t work what else do I need to add?
All the windows machine work msn, just on linux doesn`t
Any suggetions ?
Thanks in advance

iptables -A FORWARD -s 192.168.0.10 -p TCP --dport 1443:1467 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.33 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.38 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1513:1525 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 66.35.229.204 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 65.54.194.118 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.34 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 208.45.129.195 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.11 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1601:1603 -d 0/0 -j =
DROP
iptables -A FORWARD -s 192.168.0.10 -d 64.4.13.0/24 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 64.4.0.0/24 -j REJECT
iptables -A INPUT -p tcp -s 192.168.0.10 -d messenger.microsoft.com -j =
DROP



