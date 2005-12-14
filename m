From: "John Lumby" <johnlumby@hotmail.com>
Subject: how to override OUTPUT routing (like mangle ROUTE --oif)
Date: Wed, 14 Dec 2005 13:19:04 -0500
Message-ID: <BAY108-F202C62929A2AE50A636A0BA3380@phx.gbl>
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

Re my earlier posting asking this question, in case anyone else ever needs 
to do this, I found a way.   Not exactly identical to what I was originally 
thinking of but works just as well.

With my two internet interfaces like so:

ppp0     66.66.66.66
ppp1     129.129.129.129

and relevant part of my route -n like so:

64.64.64.64     0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
165.165.165.165 0.0.0.0         255.255.255.255 UH    0      0        0 ppp1
0.0.0.0         64.64.64.64     0.0.0.0         UG    0      0        0 ppp0

I realized that all I needed to do was to ensure that any outboubnd 
connection request that was in response to an incoming connection via ppp1, 
should also go out via ppp1 :

iptables -t mangle -I POSTROUTING 1 -s 129.129.129.129 -j ROUTE --gw 
165.165.165.165

result - my sendmail server works exclusively on ppp1 even though my default 
gatway is ppp0.
kinda simple when I figured this out and works perfectly.



