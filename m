From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Ignore tcp checksum on ip_conntrack
Date: Mon, 20 Sep 2010 12:28:58 +0200
Message-ID: <4C97376A.6040208@netfilter.org>
References: <1E6DC90B5FEECCA9D7482842@Ximines.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1E6DC90B5FEECCA9D7482842@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Bligh <alex@alex.org.uk>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 16/09/10 17:55, Alex Bligh wrote:
> ip_conntrack ditches packets for masquerading etc if their ip checksum
> is wrong.
> 
> Is it possible to disable this behaviour on kernel 2.6.18 (I know, it's
> old)? I have something that like producing tcp packets with invalid
> checksums.

# echo 0 > /proc/sys/net/netfilter/nf_conntrack_checksum

If you use ip_conntrack instead of nf_conntrack you have to set
ip_conntrack_checksum to 0.

# echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_checksum
