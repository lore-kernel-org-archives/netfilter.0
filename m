From: "Remus" <rmocius@auste.elnet.lt>
Subject: Microsoft PPTP VPN server behind FIREWALL
Date: Tue, 25 Mar 2003 13:08:35 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <083201c2f2cf$a4fc85c0$6e69690a@rimas>
References: <Pine.LNX.4.33.0303250926560.7010-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi folks,

I have running the Microsoft PPTP VPN server behind my Firewall with MASQ.

I tried to use this command to make a forward to itenal IP address:
iptables -t nat -A PREROUTING -d $EXTERNALIP -p tcp --dport 1723 -j
DNAT --to 192.168.1.150:1723
But it doesn't work, I mean I cannot connect to my VPN server from outside.

Any ideas or issues?

Thank you in advance for the help. :-)

Remus



