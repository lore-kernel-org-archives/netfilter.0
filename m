From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Sat, 21 Sep 2002 00:32:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920233209.UGJA17905.mta07-svc.ntlworld.com@there>
References: <000301c260fa$f0b68860$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000301c260fa$f0b68860$0801a8c0@s3ac>
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

Hi.

I just thought I'd clarify something which I might have mis-assumed, based on 
what you said in your last reply:

On Saturday 21 September 2002 12:10 am, Rowan Reid wrote:

> > Okay - this is how it works:
> >
> > The *original* packet (the first one) in what is going to be a natted
> > connection gets to the firewall, enters the PREROUTING chain, and the
> > destination address gets changed.   The packet then goes on
> > to the FORWARD
>
> So it gets nated at the PREROUTING chain oooooooohhhhhhhh ...

Destination NAT (which is what I've assumed is going here - maybe 
incorrectly) is done in the PREROUTING chain.

Source NAT (which maybe is what you're doing ?) is done in the POSTROUTING 
chain.

However, apart from that difference, everything else I said is correct for 
either situation:

1. Reply packets for NATted connections always bypass any rules in both the 
PREROUTING and POSTROUTING chains, and simply get automagically 
reverse-natted according to whatever the original nat rule was.

2. If the original packet got DNATted in the PREROUTING chain, then the reply 
packet gets automagically SNATted at the POSTROUTING stage (ie after going 
through the FORWARD chain).

3. If the original packet got SNATted in the POSTROUTING chain, then the 
reply packet gets automagically DNATted at the PREROUTING stage (ie before 
going through the FORWARD chain).

4. The FORWARD chain should always contain rules whcih relate to the "real" 
source & destination addresses, no matter what DNAT may have already 
occurred, or what SNAT may be about to occur.

5. What I said about whether packets go through INPUT, OUTPUT or FORWARD was 
accurate in all situations.

Hope this helps.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

