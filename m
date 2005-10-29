From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: libipq: problems changing destination port
Date: Sat, 29 Oct 2005 23:54:26 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510292351550.15219@filer.marasystems.com>
References: <20051029125953.41594.qmail@web52810.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051029125953.41594.qmail@web52810.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Lore <skizzo82@yahoo.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

On Sat, 29 Oct 2005, Lore wrote:

> and in the code I change the tcphdr->dest to 2021, do
> a new checksum and verdict it with NF_ACCEPT.
>
> The packet get's silently dropped and I don't know
> why...

Should work.. but make sure you get the TCP header checksum correct...

What does tcpdump say?

Also beware that conntrack won't be too happy if you modify the 
"connection details" like this. If you need conntrack loaded such mangling 
of the packets is better left to NAT..

Regards
Henrik

