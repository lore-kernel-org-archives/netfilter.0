From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Filter out broadcast messages
Date: Wed, 7 Jan 2004 21:58:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401072158.32985.Antony@Soft-Solutions.co.uk>
References: <BAY10-F77TIFprhMOgR0003cd8a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F77TIFprhMOgR0003cd8a@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 07 January 2004 9:44 pm, Gabby James wrote:

> Hi,
>
> I would like to filter out all broadcast messages.  The packets could come
> from 255.255.255.255 or multiple other addresses of the form 10.*.*.255.
> What kind of syntax do I use to DROP these packets?  The line below will
> filter out packets from 255.255.255.255 but I'm not sure what syntax to use
> to DROP the other adresses.

Should be quite simple really - all you need to know is how many ethernet 
interfaces are on your firewall, and the broadcast address for each (unless 
you've got more than one subnet bound to a single ethernet port, ugh).

Remember that broadcast packets do not get routed, therefore you only ned to 
be concerned with subnets which are local to your firewall.

Unless you have an unusual setup, I'll bet that's no more than three.

It wouldn't be at all hard to script automatically, either.   Start with 
something like:

for a in `/sbin/ifconfig | grep Bcast | tr -s ':' ' ' | cut -d' ' -f6`
do
  iptables -A INPUT -d $a -j DROP
done

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


