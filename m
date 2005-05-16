From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP sent an invalid ICMP type to a broadcast and
	icmp_ignore_bogus_error_responses
Date: Sun, 15 May 2005 20:36:18 -0500
Message-ID: <4287F912.8010208@riverviewtech.net>
References: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
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
To: netfilter@lists.netfilter.org

> kernel: XX.XX.XX.XX sent an invalid ICMP type 3, code 1 error to a
> broadcast: 0.0.0.0 on lo

Sorry for the delay in getting back to you.  After looking at all the information presented I have a feeling that something else is in play here than what is just in side of your box.

Forgive me for possibly restating the obvious, but after looking at what you have sent and thinking about it this message is really stating that 172.20.71.1 sent an (invalid) ICMP message of type 3 code 1 (host unreachable) to a (broadcast) address of 0.0.0.0 on interface lo.  This to me makes me believe that someone or something on the 172.20.71.0/24 network on eth1 sent some sort of traffic to your system with a bogus source address of 0.0.0.0 for which your system is replying.  This reply which is being sent to 0.0.0.0 could be causing your kernel to send traffic back to it's self as the 0.0.0.0 means "this host" much like 127.0.0.1 does.  However 0.0.0.0 is more general and has different meanings than 127.0.0.1.  Seeing as how the traffic would be responded to "this host" it would be natural to do it over the loop back interface lo as it would be the fastest way to reply to "this hos
 t".  However your kernel is complaining about this invalid traffic on the lo interface.  T
hus I have a feeling that if you sniff your eth1 interface for inbound traffic coming from the source address of 0.0.0.0 you will find that someone on your network is doing something that they should not be doing.  You will then need to find out the MAC address of the inbound traffic and trace back based on who else in the network would have that MAC address.

At present I can not see any thing in your configuration that would be causing any such problems with out out side influences.  As such with out any more information I don't know what else that I could do for you.  If you do come up with any thing else I'd be glad to try to help, just email me and let me know.



Grant. . . .

