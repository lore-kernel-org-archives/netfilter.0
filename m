From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ICMP floods
Date: Wed, 15 Oct 2003 03:31:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310150331.55388.Alistair@nerdnet.ca>
References: <01d501c392d0$0a9efbb0$de0018ac@admin.monash.edu.my> <200310150306.19623.Alistair@nerdnet.ca> <3F8CF4C7.7010909@iprimus.com.au>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F8CF4C7.7010909@iprimus.com.au>
Content-Disposition: inline
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
To: Michael Kearey <mutk@iprimus.com.au>
Cc: netfilter@lists.netfilter.org

On October 15, 2003 03:18 am, Michael Kearey wrote:
> Alistair Tonner wrote:
> <Snip>
>
> >>/sbin/iptables -A ICMP -p icmp --icmp-type source-quench -j ACCEPT
> >>/sbin/iptables -A ICMP -p icmp --icmp-type time-exceeded -j ACCEPT
> >>#/sbin/iptables -A ICMP -p icmp --icmp-type echo-request  -j ACCEPT
>
>    ^
>
> >>/sbin/iptables -A ICMP -p icmp --icmp-type echo-request -m limit --limit
> >>5/second  -j ACCEPT
> >
> > The  limit rule above will never be used as the packets are allready
> > accepted by the rule above it.
>
> <Snip>
>
> It's commented out isn't it?

	Okay ... perhaps I should go back to sleep now... *grin*

>
> Cheers,
> Michael

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

