From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: how to set mark using host bits ?
Date: Tue, 06 Mar 2007 09:54:22 +0200
Message-ID: <45ED1E2E.5020303@zoomnet.ro>
References: <loom.20070305T203202-917@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <loom.20070305T203202-917@post.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mircea Croitor <mcroitor@yahoo.com>
Cc: netfilter@lists.netfilter.org

Mircea Croitor wrote:
> Hello,
>
> I want to know if there is an extension for iptables which allows automating
> setting of mark in the mangle table, using last n bits of source ip, with an
> optional offset, to do something like :
>
> (the network is 192.168.0.0/20, offset 0x100)
>
> 192.168.0.0 will have mark 0x100
> 192.168.0.1 will have mark 0x101
> ...
> 192.168.2.0 will have mark 0x300
> ...
> 192.168.15.255 will have mark 0x10FF
>
> This setting of mark should be done on a single rule, since the mark is computed
> from host bits and offset.
> It is useful for efficient upload limiting, when SNAT is used, since the source
> IP is replaced before tc filters see the packet, but I'm sure you knew that. By
> the way, this kind of auto matching is possible on tc filters, using "hashed
> filters".
>
>
>
>   
There was a target called IPMARK for doing that in pach-o-matic-ng. Try 
using older snapshots, or maybe new kernels already include it.

