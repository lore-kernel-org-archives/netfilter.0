From: Payal Rathod <payal-iptables@staticky.com>
Subject: FORWARD rules
Date: Wed, 10 Sep 2003 23:22:53 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030910175253.GA2752@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I had kept the default policy of FORWARD as drop.
Now, I wanted to see an internal machine from internet. So, I used
DNAT as,

iptables -A PREROUTING -t nat -d <ext ip> -j DNAT --to <int ip>
It didn't work. When I set the default FORWARD policy to ACCEPT it
worked.

What is a better approach? I want to have a default DROP in FORWARD
chain. My FORWARD chain looked like this,


$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p udp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 110 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

What more do I add to allow natting as well as a secure FORWARD policy?
Is the position of ESTABLISHED rule ok?

Thanks a lot for the help in advance and waiting eagerly for the mails.
With warm regards,
-Payal





-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

