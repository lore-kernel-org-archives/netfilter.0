From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Essential ICMP
Date: Fri, 18 Feb 2005 13:49:27 +0000
Message-ID: <200502181349.27625.gdh@acentral.co.uk>
References: <Pine.LNX.4.44.0502171900280.31686-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.44.0502171900280.31686-100000@localhost.localdomain>
Content-Disposition: inline
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

On Friday 18 February 2005 00:30, Dean Anderson wrote:
> No, that would be wildly wrong.
>
> Necessary messages: (never block)
>  3 Destination Unreachable
>   (block code 4 and break PATH MTU)
>   (other codes are "Nice")

Oh nice tip :)

It made me revisit my firewall script, and I found this:

$IPTABLES -A icmp_packets -p ICMP --icmp-type 11 -j ACCEPT #dest unreach

So I had the right idea to permit dest-unreach.. just had the wrong 
type-number.. thanks for the memory jog!

Cheers,
Gavin.

