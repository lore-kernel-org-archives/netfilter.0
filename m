From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: SSH Brute force attacks
Date: Fri, 06 May 2005 17:57:34 +0200
Message-ID: <427B93EE.3030905@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: iptables <netfilter@lists.netfilter.org>

Hi All

One one of my hosted boxes, my logwatch scripts continuously pipe out my 
ssh and auth log of unsuccessful dictionary attacks

I came across this link : http://blog.andrew.net.au/2005/02/17/

And seen that it would help me slow (in hope) that malious person done.

Would anyone care to comment / share tips etc on what I have below

iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set 
--name SSH
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_WHITELIST
iptables -A SSH_WHITELIST -s $MYIPADDRESS -m recent --remove --name SSH 
-j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent 
--update --seconds 60 --hitcount 4 --rttl --name SSH -j LOG --log-prefix 
"SSH BRUTE"
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent 
--update --seconds 60 --hitcount 4 --rttl --name SSH -j DROP

Kind Regards
Brent Clark

