From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Anyone using DNAT on the OUTPUT chain?
Date: Mon, 10 Jun 2002 13:57:54 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101258.g5ACvxU08297@vulcan.rissington.net>
References: <BC6421B0F2CC4C43897842092E0E00A94C149E@TX1EX1NT.dyncorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <BC6421B0F2CC4C43897842092E0E00A94C149E@TX1EX1NT.dyncorp.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On Monday 10 June 2002 1:45 pm, Kellogg, Chris wrote:

> iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -t nat -j DNAT
> --to-destination 192.168.4.4:80
>
> When I attempt to put this rule in, I get the error message "iptables:
> Invalid argument".

I should think it's the -s argument which netfilter is complaining about - it 
makes (almost) no sense to include this in a rule which only applies to 
packets coming from the local machine.

I assume you really are trying to DNAT packets originating from the netfilter 
box, and not ones which are being routed by it (which you would do in the 
POSTROUTING chain) ?


Antony.

