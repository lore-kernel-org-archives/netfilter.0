From: David Cary Hart <DCH@TQMcube.com>
Subject: RE: TTL target
Date: Fri, 23 Jul 2004 16:09:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090613367.28446.3.camel@dchws.tqmcube.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90511EB@asimail2.alphanumeric.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90511EB@asimail2.alphanumeric.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Fri, 2004-07-23 at 14:43, Jason Opperisano wrote:
> just re-read your original post.  if you're trying to *change* the TTL of packets traversing your firewall--you need the TTL patch from patch-o-matic, which will enable a "-j TTL" target in the MANGLE table.
> 
> sorry for the confusion.
> 
I must ask a dumb question. Why would one want to mangle TTL or filter
on TTL?

Thanks

> -j
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gonzalez,
> Federico
> Sent: Friday, July 23, 2004 1:52 PM
> To: netfilter@lists.netfilter.org
> Subject: TTL target
> 
> 
> Hi,
> 
> I have iptables 1.2.9, red hat kernel 2.4.22 and i need to use the TTL
> target to change the packets TTL.
> 
> How do i enable this functionality ?
> 
> Thank you.



