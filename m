From: "Raj Wurttemberg" <rajw@c64.us>
Subject: RE: DirectX 8.1 and NAT
Date: Tue, 3 Dec 2002 21:56:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c29b40$c4277e50$d201a8c0@hornet>
References: <000201c29b1d$424a07e0$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000201c29b1d$424a07e0$6601a8c0@s3ac>
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
To: netfilter@lists.netfilter.org

> standard. So either way this claim is bogus as is any claim without
> reasonable proof.

Well to be honest and from my experience (or inexperience) with
Micro$oft's MechWarrior 4 game it IS possible for ONE computer to play
behind an iptables firewall. I do not know that much about iptables and
I am learning gradually from this mailing list... but here is what I
have on my firewall so I can play MechWarrior 4 (Please don't beat me up
to badly... I'm an iptables noob!): 

IPTABLES="/sbin/iptables"
STATIC_IP="My IP address from the ISP"
INTERNAL="My game systems's internal ip address"
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 6073 -j DNAT
--to $INTERNAL:6073
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 6667 -j DNAT
--to $INTERNAL:6667
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 9999 -j DNAT
--to $INTERNAL:9999
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 2200:2400 -j
DNAT --to $INTERNAL:2200-2400
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 2200:2400 -j
DNAT --to $INTERNAL:2200-2400
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 27999:29000
-j DNAT --to $INTERNAL:27999-29000
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 27999:29000
-j DNAT --to $INTERNAL:27999-29000
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 47624 -j
DNAT --to $INTERNAL:47624
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 47624 -j
DNAT --to $INTERNAL:47624

$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 6073 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 6667 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 9999 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 2200:2400 -j ACCEPT
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 2200:2400 -j ACCEPT
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 27999:29000 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 27999:29000 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 47624 -j ACCEPT
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 47624 -j ACCEPT

Comments, corrections, and advice are welcome.

Thanks,
/*Raj*/


