From: "Sherwyn Greene" <sgreene@kentz-ojs.com>
Subject: FW: iptables and Limewire
Date: Thu, 14 Sep 2006 08:05:48 -0400
Message-ID: <23973.2402646498$1158235625@news.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 
 
Sherwyn Greene
Planner / I.T. Technician
Project Controls Dept.
Kentz-OJ's E&I Services J.V.
+1 (868) 648-0876
 

________________________________

From: Sietse van Zanen [mailto:sietse@wizdom.nu] 
Sent: Thursday, September 14, 2006 8:01 AM
To: Sherwyn Greene
Subject: RE: iptables and Limewire


1. Yes, but not entirely. You can block all outgoing traffic execpt traffic
on port 80 or 443. This would allow for HTTP and HTTPS, but also for
connections to limewire users, that set their client to listen on port 80 or
443. That will not be many users, and they will only be reached with direct
connects, so doing this should get rid of 99.99% of the limewire traffic.
Your internal users will no longer be able to connnect to Limewire servers
directly. They might be able to exploit a public open proxy, that allows
CONNECT. Also not very likely.
 
2. iptables -P FORWARD DROP
    iptables -A FORWARD -s your_internal_net -d 0/0 -p tcp --dports 80,443
-j ACCEPT
first rule sets the policy to DROP, second would then only allow http
traffic. Of course you have to do NAT to, when you use private address
range.
Downside of this, is that users will not be able to access web servers on
non-standard ports.
 
3. Don't think there's a limewire conntrack module, so if you want to do the
honourable, write it yourself. :-)
You might be able to use a L7 filter (l7filter.sourceforge.net). But like
said at point 1. It's probably overdone, as you can block 99.99% with
iptables alone.
 
Another strategy is to use a web proxy and block all internet traffic for
your internal users. This will stop absolutely 100% p2p traffic, but will
cost you considerably more resources and time to set up.
 
-Sietse
 
PS: As I am writing this mail from OWA, which only uses HTML, I can not send
it to the list, as it only accepts text. Could you be so kind to forward it
to the list?

________________________________

From: Sherwyn Greene
Sent: Thu 14-Sep-06 13:00
To: netfilter@lists.netfilter.org
Subject: iptables and Limewire


Hi, everyone
 
    I have a problem on my network they are user using limewire p2p and
using up all or most of the bandwidth, so my question is:
 
1. Can I use iptables to block limewire from connecting, but allow web
browsing
 
2. if so, how to implement this
 
3. Is there a module or something like that for iptables that will give me
that abuilty to block them
 
Thank
 
Sherwyn Greene
Planner / I.T. Technician
Project Controls Dept.
Kentz-OJ's E&I Services J.V.
+1 (868) 648-0876





