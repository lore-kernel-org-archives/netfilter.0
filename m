From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nat problem
Date: Wed, 7 Jul 2004 14:07:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071407.21256.Antony@Soft-Solutions.co.uk>
References: <40E982F0.309A28A3@knoware.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E982F0.309A28A3@knoware.nl>
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

On Monday 05 July 2004 5:33 pm, Frans Luteijn wrote:

> Dear Sirs,
>
> I have a little problem, which might be a bug. I have an 3COM
> ISDN-router. It broadcasts every 10 seconds its connectionstatus to the
> internal net.

What do yuo mean by "broadcasts"?   What protocol is being used?   What 
address are the packets sent to?

> Now I want to forward those broadcasts to another network.

If, by broadcasts, you mean packets addressed to the "broadcast address" of 
your subnet, it can't be done - you cannot route broadcast packets across a 
router (that's why people use bridges).   The only way it could be done is to 
have a machine which understands the protocol, and is connected to both 
networks, picking up the broadcast packets on one subnet, and then creating 
new broadcast packets to send to the other network (and, of course, dealign 
sensibly with the replies).

This, for example, is how you get Windows NetBios share browsing to work 
across network boundaries - it's not pretty, but if broadcast packets are 
what you're starting from then it's the only way.

Regards,

Antony.

-- 
I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


