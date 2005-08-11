From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: A Simple Question
Date: Thu, 11 Aug 2005 07:54:56 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508110751280.28320@yvahk01.tjqt.qr>
References: <5c685153050809171164af25e4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5c685153050809171164af25e4@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robb Bossley <robb.bossley@gmail.com>
Cc: netfilter@lists.netfilter.org


>iptables -P INPUT DROP
>iptables -P FORWARD DROP
>VS
>iptables -P INPUT ACCEPT
>iptables -P FORWARD ACCEPT
>...(other stuff here)...
>iptables -A INPUT -j DROP
>iptables -A FORWARD -j DROP
>
>Which is preferred for security and why?

Both equally work well. It's just a matter from which side you tackle the 
problem. Compare with 3d-engine editing:

A Quake2 map starts with "air" and you got to add walls -
  that's like -P ACCEPT and -j REJECT/DROP

An Unreal map starts with "everything filled" and you got to subtract rooms -
  like -P DROP and -j ACCEPT

In fact, sometimes it is wise to alternate between the two methods within the 
same table. I've got this in some ruleset:

-P INPUT DROP
-p tcp -m multiport --dport someservices -j ACCEPT
(denying all other traffic)

-P OUTPUT ACCEPT
-o $internal -j DROP
(allowing all other interfaces)


Just like Apache's "Order allow,deny" if you need another inspiration for 
comparison.


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

