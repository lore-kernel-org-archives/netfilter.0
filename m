From: Jason Opperisano <opie@817west.com>
Subject: Re: Transparent Remote Proxy Server
Date: Mon, 27 Sep 2004 14:27:56 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096309676.16814.57.camel@wolfpack.ljm.dom>
References: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>
	<41546F23.2010601@pbl.ca>
	<9B51275E-10B2-11D9-9099-0003931DA24A@freezone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9B51275E-10B2-11D9-9099-0003931DA24A@freezone.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-09-27 at 14:25, ms419@freezone.co.uk wrote:
> Thank you sincerely for your suggestion! You are correct: It is simpler 
> to use DNAT & MASQUERADE. I tried it & it works. But now, I am trying 
> to avoid using NAT.
> 
> The problem with NAT (as I understand it) is it rewrites the 
> destination address, which breaks HTTP/1.0 requests without a Host: 
> header. By using policy routing, I hope to route traffic through wum 
> without rewriting the destination address.

your "-j REDIRECT" on wum rewrites the destination IP address as well.

-j

-- 
Jason Opperisano <opie@817west.com>


