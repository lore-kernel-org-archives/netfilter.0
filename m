From: "Nix N. Nix" <nix@go-nix.ca>
Subject: Re: IPTABLES vs Checkpoint
Date: 26 Nov 2002 17:32:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038349954.22977.34.camel@tux.go-nix.ca>
References: <3F5BAB933C75004690195047C4040A6D0535D4@tc-pdc.jhbA.techconcepts.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5BAB933C75004690195047C4040A6D0535D4@tc-pdc.jhbA.techconcepts.co.za>
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
To: Wayne de Nobrega <wdenobre@techconcepts.co.za>
Cc: netfilter@lists.netfilter.org

On Tue, 2002-11-26 at 14:28, Wayne de Nobrega wrote:
> Hello,
> 
> I have a customer who is part of an international group which has a
> policy of using the Nokia Checkpoint firewall.  Due to the signifcant
> cost differences, and our preference, the local branch and ourselves
> would like to install an IPTABLES based firewall.  I need some help in
> motivating this to head office and am looking for information comparing
> the two solutions.  I need to focus on the technical issues of the two
> products and ultimately the inherent security realised from the two
> products.
> 
> Can anyone offer some input or point me to a source of information.

AFAIK Checkpoint is not a firewall at all, but a proxy server.  This
clearly means that it acts like a Web/FTP/whatever server that connects
people in your company to the outside world by requesting Web pages over
HTTP and initiating FTP connections on their behalf.

OTOH iptables works below the application layer.  It allows manipulation
of individual TCP connections, UDP packets and ICMP traffic irrespective
of the application layer service they provide.

Nonetheless:  Checkpoint and iptables are not necessarily mutually
exclusive.  Consider the following setup:
    ________      __________      ________      ________________
   /        \    /          \    /        \    /                \
  | Internet +--+ Checkpoint +--+ iptables +--+ Internal Network |
   \________/    \__________/    \________/    \________________/

The Checkpoint box would basically allow all traffic through.  It
wouldn't be just an inert box though !  You could forward all outgoing
HTTP traffic from the iptables computer to the Checkpoint Web proxy to
do authentication, content filtering, etc.  The Checkpoint box would be
mostly closed off, and you would rely on iptables to selectively block
ports and do all the fancy things a Linux router can do for you.

This way, you can comply with corporate policy and use iptables as well.

> 
> Many thanks
> 
> Wayne

Good luck !


