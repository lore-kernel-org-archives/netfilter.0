From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging packets with original address
Date: Wed, 3 Mar 2004 09:53:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403030953.24832.Antony@Soft-Solutions.co.uk>
References: <4045A0F1.F7366A69@multitech.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4045A0F1.F7366A69@multitech.co.in>
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

On Wednesday 03 March 2004 9:10 am, prabha wrote:

> Hi
>     I want to log some packets in the INPUT and FORWARD chains, but with
> the original address of the packets. (ie) with the destination address
> before any DNAT rule has been applied on the packet in the PREROUTING chain.

You cannot do this because packets pass through the INPUT chain after they 
pass through PREROUTING.

>     When the packet comes to the INPUT / FORWARD chains, it will be
> after any DNAT has been applied.

Correct.

> I do not want the NATted address to be present in the logs, but the original
> address as the received interface saw it. Is this possible?

Put the LOG rule in the PREROUTING chain.

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


