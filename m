From: prabha <prabha@multitech.co.in>
Subject: Re: [Re: Logging packets with original address]
Date: Thu, 04 Mar 2004 12:05:55 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4046CE4B.5D39CF03@multitech.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi
    I can have the log in the PREROUTING chain. But, I have to log
ACCEPTed
and DROPped packets in the INPUT / FORWARD chains separately.
I use the options in the LOG target to tag the ACCEPTed and DROPped
packets.
So, I cannot have them logged in the PREROUTING chain, where we will not
know
whether the packet is going to be accepted or dropped.
    I have to log the messages in the INPUT or FORWARD chains, but with
the
original addresses.

Regards
Prabha

From Antony@Soft-Solutions.co.uk  Wed Mar  3 09:53:24 2004
>From: Antony@Soft-Solutions.co.uk (Antony Stone)
>Date: Wed, 3 Mar 2004 09:53:24 +0000
>Subject: Logging packets with original address
>In-Reply-To: <4045A0F1.F7366A69@multitech.co.in>
>References: <4045A0F1.F7366A69@multitech.co.in>
>Message-ID: <200403030953.24832.Antony@Soft-Solutions.co.uk>

>On Wednesday 03 March 2004 9:10 am, prabha wrote:

> Hi
>     I want to log some packets in the INPUT and FORWARD chains, but
with
> the original address of the packets. (ie) with the destination address

> before any DNAT rule has been applied on the packet in the PREROUTING
>chain.

>You cannot do this because packets pass through the INPUT chain after
they
>pass through PREROUTING.

>     When the packet comes to the INPUT / FORWARD chains, it will be
> after any DNAT has been applied.

>Correct.

> I do not want the NATted address to be present in the logs, but the
original
> address as the received interface saw it. Is this possible?

>Put the LOG rule in the PREROUTING chain.

>Regards,
>
>Antony.


