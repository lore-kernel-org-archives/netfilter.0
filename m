From: "nattapon viroonsri" <nattaponv@hotmail.com>
Subject: Enable Loopback confuse
Date: Fri, 19 Aug 2005 10:41:41 +0000
Message-ID: <BAY22-F13F52A0BB552F1A3EF3365A6B50@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Anyone please recommend me about iptables loopback

When i enable loopback i just use 2 line below and everything work fine
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

But i see many example around then have also included this line below  to 
enable loopback
iptables -A FORWARD -o lo - j ACCEPT ?

i try generate packet locally like "telnet localhost 25" and debug with 
"iptables -L -nv"
but dont see any packet match  this rule(FORWARD)    only  INPUT and OUTPUT 
matched

So can i omit this line ?
or what kind of packet that match this rule ?

_________________________________________________________________
Don't just search. Find. Check out the new MSN Search! 
http://search.msn.com/


