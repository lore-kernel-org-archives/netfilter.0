From: "Vladimir Potapov" <varyag18@mail.ru>
Subject: RE: FORWARD rules
Date: Wed, 10 Sep 2003 22:47:00 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEKJPOHJKKBIDHGBCMDCEJBCAAA.varyag18@mail.ru>
References: <20030910175253.GA2752@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030910175253.GA2752@linux.local>
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
To: Payal Rathod <payal-iptables@staticky.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p udp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 110 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

What more do I add to allow natting as well as a secure FORWARD policy?
Is the position of ESTABLISHED rule ok?

You need to add a chains for NEW packets with tcp-flags syn.You need replace
from console :
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p udp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 110 -j ACCEPT

to
-A FORWARD -d 125.125.125.0/32 -m state --state NEW -p tcp -m tcp --dport
53 --syn -j ACCEPT
-A FORWARD -d 125.125.125.0/32 -m state --state NEW -p udp -m udp --dport
53 -j ACCEPT
-A FORWARD -d 125.125.125.0/32 -m state --state NEW -p tcp -m tcp --dport
80 --syn -j ACCEPT
-A FORWARD -d 125.125.125.0/32 -m state --state NEW -p tcp -m tcp --dport
110 --syn -j ACCEPT





--
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.



