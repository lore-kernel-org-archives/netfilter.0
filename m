From: "Holger Kinkelin" <holger.kinkelin@gmail.com>
Subject: Re: Redirecting incoming packets to other port
Date: Thu, 12 Oct 2006 08:47:54 +0200
Message-ID: <c936c6b70610112347q1caa9fb9nfc824771796dd998@mail.gmail.com>
References: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
	<452CAFDC.3070909@eccotours.co.za>
	<c936c6b70610110244m34760db8wc1a942becc475910@mail.gmail.com>
	<452CC28D.5020000@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452CC28D.5020000@eccotours.co.za>
Content-Disposition: inline
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
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org

Hi Brent, hi others

> Is this really for SIP.
Yes, it's definately for SIP. I try to create some sort of transparent
sip proxy that I will use later for monitoring packets for a project /
for my thesis.

The thing I want to do is the following

1. redirect traffic from the client to my proxy
--> iptables -A OUTPUT -t nat -p udp --dport 5060 --sport 5060 -j
REDIRECT --to-ports 5061
The proxy waits on 5061 for this traffic, the packets do arrive. Step
1 is working.

2. Now the proxy collects some info from the packets and sends them
(unchanged) out on 5062 to the server. I need a second rule that
changes the source port from 5062 back to 5060 that the SIP server
doesn't notice the proxy
--> iptables -A POSTROUTING -t nat -p udp --dport 5060 --sport 5062 -j
SNAT --to-source 192.168.0.21:5060
192.168.0.21 is the IP of the PC where the client and proxy are
running on. That's working, too. The packets get sent to the server
using the correct ports, the server accepts the packets and replies
correctly. BUT NOW I think the problem occurs! When the reply from the
server arrives on the proxy computer, a "ICMP destination port
unreachable" is sent back to the server. Why? I don't get this.

Has anybody an idea how to fix this problem or how to do the whole
proxy differently?

Regards,
Holger

