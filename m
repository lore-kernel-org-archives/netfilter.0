From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Leaking ICMP and UDP packets
Date: Tue, 20 Apr 2004 18:46:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404201846.38703.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0404191102000.2276-100000@dudester.spoontail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0404191102000.2276-100000@dudester.spoontail.com>
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
To: netfilter@lists.netfilter.org

On Tuesday 20 April 2004 6:13 pm, Daniel David Benson wrote:

> > Are you sure they are un-NATted packets "leaking" through netfilter, and
> > not ICMP packets being sent back to some remote system by the firewall
> > itself, saying "host unreachable" etc?
>
> Finally, after 24 hours I got the following packets on my front edge
> (public) interface:
>
> 09:57:48.388232 10.101.10.103 > 169.254.85.249: icmp: time exceeded
> in-transit 09:58:03.386143 10.101.10.103 > 169.254.85.249: icmp: time
> exceeded in-transit 09:58:18.386973 10.101.10.103 > 169.254.85.249: icmp:
> time exceeded in-transit
>
> * This internal IP isn't any of the 1 to 1 NATs listed below and should
> come out as the global NAT IP.

Correct me if I'm wrong, but isn't 169.254.85.249 one of those Microsoft 
"let's make up a network range if we can't find anyone to talk to" addresses?

In other words, the original packet did not come from the outside world, 
therefore did not come through your firewall (it came from a lonely Windows 
machine inside your network which has decided to create its own IP address, 
and has then decided to send packets to 10.101.10.103, which returned an ICMP 
error through your default gateway), and therefore there was no automatic 
reverse NAT in place to set the source address to what you would expect?

I bet you can't find the original packet, to which this ICMP TTL exceeded 
message corresponds, in your packet sniffer logs, because it never came in 
through the firewall in the first place.

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


