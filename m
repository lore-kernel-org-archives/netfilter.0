From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: UDP DNAT Problem
Date: 04 Apr 2003 10:56:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049446568.1868.34.camel@kermit.spenneberg.de>
References: <000f01c2fa58$5cd5b290$0b19a8c0@rock1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c2fa58$5cd5b290$0b19a8c0@rock1>
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

Am Fre, 2003-04-04 um 05.14 schrieb Craig Packard:

> The packet goes out as expect srcA dstB
> But the weird part is the response comes back in srcFW dst(A)   Where I would like it would be src(B) dst(A)!!!
Are you sure, that you do not have any SNAT rule that might be
responsible?
Post your PRE- and POSTROUTING chains.

Cheers,

Ralf
> 
> I think this is screwing up the communications.  Can anyone help me understand what is happening?
> 
> -    Craig
-- 
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux:  
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

