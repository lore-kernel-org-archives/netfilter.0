From: Mike <1100100@gmail.com>
Subject: Re: One Nic; Multiple Subnets
Date: Tue, 28 Dec 2004 12:35:30 -0500
Message-ID: <8ca42282041228093539addaa1@mail.gmail.com>
References: <41CC19DF.2766.F2FCB6D@localhost>
	<8ca4228204122708388845e28@mail.gmail.com>
	<1104166362.6322.26.camel@hubcap.ljm.dom>
	<8ca42282041227095735105c6@mail.gmail.com>
	<16365.213.236.112.75.1104237335.squirrel@213.236.112.75>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <16365.213.236.112.75.1104237335.squirrel@213.236.112.75>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Martijn,

Thanks for your help.
I've definitely decided to go down the "2-nic" path and make life simpler.
Now of course I'm wondering if I should buy some better equipment to
run a strong ethereal/snort combo. on the routerbox.  I'm way overdue
on intrusion detection and network usage.

Any suggestions on the level of hardware required to run ethereal and
snort on a routerbox.

Best regards.

Mike




On Tue, 28 Dec 2004 13:35:35 +0100 (CET), Martijn Lievaart <m@rtij.nl> wrote:
> Mike said:
> > Jason,
> > Thanks for the reply.
> > Sounds like a second nic. is really what's needed here.
> > John Sullivan suggested it could be done using iptables in combination
> > with iproute2; but I'm not sure I could manage it well.  I'm
> > challenged enough by iptables, itself.
> >
> > I'm thinkin' new mobo/cpu/ram combo. for $150 from newegg.com  :-)
> 
> YES! make it as simple as possible. Do it like this:
> 
> * Add another nic, eth2 (I assume you want the new mobo because you cannot
> add another nic to the current setup, right? Otherwise, just add another
> nic and you're set).
> * Give the new nic 192.168.2.1/24, add all new hosts on this second subnet.
> * Make sure the nets can only access the Internet, not eachother.
> (from memory, may not be 100% correct)
>   -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>   -A FORWARD -i eth1 -o eth0 -j ACCEPT
>   -A FORWARD -i eth2 -o eth0 -j ACCEPT
>   -A FORWARD -m limit --limit "10/s" -j LOG --log-prefix "Invalid forward: "
>   -A FORWARD -j DROP
> 
> Obviously, you also have to add the relevant MASQ, INPUT and OUTPUT rules,
> but those should not be wildly different from what you have now.
> 
> HTH,
> M4
> 
>

