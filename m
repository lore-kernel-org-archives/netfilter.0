From: nbastin@mac.com
Subject: Re: Unassigned Networks List
Date: Sun, 16 Mar 2003 12:37:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <07676BC4-57D6-11D7-A9BF-0003938052F8@mac.com>
References: <NGBBIFPIJNDPMFBPKBPGOEJIDKAA.NetFilter-Users@Compucenter.org>
Mime-Version: 1.0 (Apple Message framework v551)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBIFPIJNDPMFBPKBPGOEJIDKAA.NetFilter-Users@Compucenter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>


On Saturday, March 8, 2003, at 12:51 AM, George J. Jahchan, Eng. wrote:

> Pavan,
> I am trying to block RFC1918 networks, in addition to unassigned ones 
> (IANA
> reserved or not assigned) from getting in or out on the public 
> interface.
> Any traffic coming in (or leaving) from such networks on the public
> interface undoubtedly has a spoofed source IP and should be dropped.
> As mentioned before, classes A & D networks are fairly well documented 
> on
> IANA's site <http://www.iana.org/assignments/ipv4-address-space>, but 
> B and
> C are listed as "various registries" and in bulk, which is of no help.
> I need a list of 128~191 and 192~223 netblocks which are either 
> reserved or
> not assigned.

Those blocks are assigned, not reserved, and are in use, so why do you 
care that it might be assigned to various registries?  It's marked as 
various registries because the blocks were handed out before the 
current allocation policy was in place, and various pieces of those 
blocks were given to disparate registries and users.

In any event, the IANA recently reclaimed a lot of that space and the 
new list on their web site has about 20 /8's marked as reserved, 
instead of 'various registries'.

--
Nick


