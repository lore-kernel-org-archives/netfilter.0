From: Marco Nicoloso <marco.nicoloso@fastwebnet.it>
Subject: [newbie]DNS on the internet... how to allow connections?
Date: Mon, 21 Feb 2005 23:34:48 +0000
Message-ID: <421A7018.4030800@fastwebnet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi there,

I solved all of my routing problems which I had before... Now everything 
works fine, but the name resolution. According to the scheme (Trusted 
subnet -> Firewall -> Internet), hosts on my trusted subnet can see the 
DNS properly, they get its address from the DHCP, but they cannot get 
DNS queries satisfacted.

I tried with different rules, but none works:
$IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT

or these:
$IPTABLES -A FORWARD -p tcp -s $DNS1_IP -j ACCEPT
$IPTABLES -A FORWARD -p tcp -s $DNS2_IP -j ACCEPT
$IPTABLES -A FORWARD -p udp -s $DNS1_IP -j ACCEPT
$IPTABLES -A FORWARD -p udp -s $DNS2_IP -j ACCEPT

Do I have to setup my own named, cache queries and requests new ones if 
I need? Or it is just my problem, that I am not able to write rules...?

Thanks in advance

Marco Nicoloso

