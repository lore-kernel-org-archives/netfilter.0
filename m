From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Redhat Linux 8.0 IPtables help
Date: Fri, 6 Jun 2003 08:20:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6DDC@wardrive.citadelcomputer.com.au>
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
To: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org

"What port should I block for icmp protocol?"
Errrr??... your blocking them already??? Or did you mean, which icmp =
should you ACCEPT?

-------------------------
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP
-------------------------

BTW, why are you allowing UDP 22,23,80??? It's not used for ssh,telnet =
and http and whatever 24 is.. (can't be bothered). he he ;P

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Sundaram Ramasamy [mailto:sun@percipia.com]
Sent: Friday, June 06, 2003 5:33 AM
To: netfilter@lists.netfilter.org
Subject: Redhat Linux 8.0 IPtables help


Hi,



I have Linux machine with single Network interface. I want to block all =
the
tcp,udp and icmp port's other then 22,23,24 and 80.



Can you verify the following script?

IPTABLES=3D/sbin/iptables

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -A INPUT -p tcp -m multiport --destination-port 22,23,24,80 -j
ACCEPT



$IPTABLES -A INPUT -p udp -m multiport --destination-port 22,23,24,80 -j
ACCEPT





What port should I block for icmp protocol?



-SR




