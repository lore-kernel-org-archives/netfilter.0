From: Jason Opperisano <opie@817west.com>
Subject: Re: AW: state NEW
Date: Mon, 22 Nov 2004 08:27:52 -0500
Message-ID: <1101130071.13662.1.camel@hubcap.ljm.dom>
References: <D3DD55FDB74AD511BA5100500416368053EB22@ORION>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053EB22@ORION>
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
To: netfilter@lists.netfilter.org

On Mon, 2004-11-22 at 04:25, Jochen Vogel wrote:
> in the past i thought the state NEW is the state of the connection viz only
> SYN packets
> and not if i write it to conntrack table.

there is no part of "-m state --state NEW" that looks at TCP flags.

-j
 
--
"Beer. Now there's a temporary solution."
	--The Simpsons


