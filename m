From: Gnarlodious <lists.gnarlodious@gmail.com>
Subject: Re: Block LAN DHCP broadcast
Date: Mon, 16 Jul 2007 08:38:18 -0600
Message-ID: <3130eec50707160738o418b7a9m43f68af0c6a9afe4@mail.gmail.com>
References: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
	<1184595437.17688.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=AchuEC/KeQd1sUWCh2thCie3ICzEHY0YVwKJmFo/sywVpi/s+kTRWI8p/3Iq2ol3+XqbxsNR+j0310GetdSU6YQVBEAMw7WQ2j7B6kdbIEITAWO7Yemp2u1QaLTQVCOcUjC53ZkK/XBNW97WJaVMsL9SNOiw+VunJiWIpgEjdTM=
In-Reply-To: <1184595437.17688.72.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

Thanks for the quick response. Not sure I understand all of that...
Yes, this LAN is all on one IP range. The routers are all connected
with ethernet.

I don't want to block client computers, but I understand that if I
drop DHCP ports 67 and 68 to and from other routers then DHCP will be
handled by the router the computer is connected to. Is that right?

So, these are existing connections I need to block. Using iptables, is
there a way using IP or MAC address to limit DHCP broadcast to other
routers?

-- Gnarlie


On 7/16/07, Thomas Jacob wrote:
> Assuming that all your hosts are connected to a single broadcast-domain
> LAN,
> that your firewall box is the layer 3 default gateway for
> internet-connections for your hosts and that you're talking about
> preventing all other hosts on this lan to respond to dhcp broadcasts,
> that's pretty much impossible.
>
> DHCP packets are not passing through your router box on their way
> between
> an assumed evil dhcp host and your normal hosts.
>
> You could try to find some sort of filter options in your switching
> hardware
> to control the flow of broadcasts and/or dhcp packets.
>
> Or you could try using some form of dhcp authentication.
>
> Or you could have a seperate VLAN for each of your hosts
> and only allow them to communicate via your router
> (possibly creating a performance bottle neck though...)
>
>
> On Mon, 2007-07-16 at 07:52 -0600, Gnarlodious wrote:
> > Hello and thank you for the help.
> >
> > I am running iptables v1.3.7 on a LAN router and I need to block DHCP
> > requests. New machines on the router should be prevented from
> > broadcasting DHCP, forcing only that router to handle DHCP.
> >
> > Can this be done? Seems like I have been trying for days without success.
> >
> > -- Gnarlie
> > http://Gnarlodious.com/
>
>
>
>

