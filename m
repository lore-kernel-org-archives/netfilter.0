From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: POSTROUTING
Date: Wed, 18 Feb 2004 18:25:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402181825.35022.Antony@Soft-Solutions.co.uk>
References: <BFEIJHPOPCCMOPEKHHMOAEEHCOAA.giovanni.costagliola@nexusat.it> <4033AE6E.4010008@divx.team.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4033AE6E.4010008@divx.team.lv>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 18 February 2004 6:26 pm, capsx wrote:

> !
>
> I want as source to specify a chain
> not -s 10.0.0.0/27 but something like -s LOCAL_NET_CHAIN

You can't do that.   -s takes an address or network range.   -i takes an 
interface name.   You cannot specify anything else as the 'source' of a 
packet.

Tell us why you want to do this and we might be able to suggest an alternative 
(MARKing packets comes to mind, for example).

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


