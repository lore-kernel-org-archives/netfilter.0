From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Re: Routing rule for two gateways.
Date: Mon, 23 Sep 2002 09:42:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005f01c26307$0c4cb5f0$8c01a8c0@sundaram>
References: <00ce01c26051$994ca630$0200000a@ramasamy> <200209201417.35968.dharmu@nsecure.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
Cc: dharmu@nsecure.net

What is the Linux command and syntax to set two default gateway.

Thanks


----- Original Message -----
From: "Dharmendra.T" <dharmu@nsecure.net>
To: "Sundaram" <sun@percipia.com>; <netfilter@lists.netfilter.org>
Sent: Friday, September 20, 2002 4:47 AM
Subject: Re: Routing rule for two gateways.


> Hi Sundaram,
>  I think you can specify both the gws as the default gateways and can
connect
> from internet using both the gateways.
> Regards,
> Dharmendra.T
> Linux Security Expert
> www.nsecure.net
> dharmu@nsecure.net
> On Friday 20 September 2002 07:49, Sundaram wrote:
> > Routing rule for two gateways.
> >
> >
> >
> > I have two Linux netfilter gateways for my network  (1) 192.168.1.10,
(1)
> > 192.168.1.100 public IP in the external interface. Inside LAN I am
running
> > ftp server (192.168.1.50) with default gateway as 192.168.1.10. From
> > Internet using Fist gateway public IP address I was able to access the
ftp
> > server, but using second gateway public IP address I was not able to
access
> > the ftp server.
> >
> >
> >
> > Where I need to set the routing, so that I can access the ftp server
using
> > both gateway.
> >
> >
> >
> > Thanks in advance
> >
> > -SR
>
> --
>


