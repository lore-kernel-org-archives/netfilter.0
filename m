From: Marcin Krol <mark@wbp.krakow.pl>
Subject: Re[2]: Why would certain packets not reach nat PREROUTING chain?
Date: Mon, 19 Dec 2005 16:39:25 +0100
Message-ID: <12626109102.20051219163925@wbp.krakow.pl>
References: <20051218055403.002CDA00EA@bostoncoop.net>
	<20051218131621.GC2197@bostoncoop.net>
Reply-To: Marcin Krol <mark@wbp.krakow.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-To: <20051218131621.GC2197@bostoncoop.net>
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
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org

Hello Adam,

Look at point 6.3 here:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

There was smth in the tutorial about only the first packet from NEW
connection hitting the chains and the rest of them being handled by
conntrack, although can't remember where exactly this was located in
tutorial.

This would explain the UDP traffic being handled in its entirety
since UDP is connectionless and conntrack.

Note that this is my hypothesis, it's not like I have tested
this thoroughly.

Regards,
Marcin



Sunday, December 18, 2005, 2:16:21 PM, you wrote:

ARK> On Sun, Dec 18, 2005 at 032:42:43M -0500, Leonardo Rodrigues Magalhes wrote:
>>     Adam, have you tried adding a properly PREROUTING rule for this 
>> specific traffic ? It would be like
>> iptables -t nat -A PREROUTING -p udp -d EXTERNAL_IP_OF_NAT_BOT --dport 
>> 500 -j DNAT --to LOCAL_CLIENT

ARK> I have tried that--same result. In fact, I've tried creating a "tunnel"
ARK> between the internal and external client by leaving out the port
ARK> limitation, i.e.:

ARK> iptables -t nat -A PREROUTING -s SERVER_IP -j DNAT --to LOCAL_CLIENT

ARK> None of these have any effect because the packets never reach the nat
ARK> PREROUTING chain. If I put a LOG rule at the start of nat PREROUTING, I
ARK> don't see the inbound packets from the server on the Internet. (I do see
ARK> those packets in the mangle PREROUTING though).

>>     Other test I would suggest ....... have you tried some other UDP 
>> traffic, just like DNS and see if it works ? Have you tried some TCP 
>> traffic and see if it works fine ?

ARK> Everything else seems to work fine. I have another internal box to which
ARK> certain ssh connections from the Internet go, and that's fine. I'm not
ARK> sure exactly how I'd test other UDP traffic... Certainly UDP traffic that
ARK> is FORWARDed through the NAT box (e.g., RealPlayer streams) seems fine.



-- 
Best regards,
 Marcin                            mailto:mark@wbp.krakow.pl



