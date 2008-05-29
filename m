From: "Knight Tiger" <caugar@gmail.com>
Subject: Re: Forwarding packets received on bridged interfaces -regarding
Date: Wed, 28 May 2008 21:55:26 -0700
Message-ID: <69fec4520805282155k441b60edo30a98bb26135df62@mail.gmail.com>
References: <69fec4520805281536t15dd5e5dq289799693263371b@mail.gmail.com>
	 <483E1DF2.3080304@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=JW+RZ4c5pinUHCwpKfREUh93rDzWgZ8aOHUQJOcyZR8=;
        b=jBpdbvdaR8vVqp9ehparDXK5GDAm/zLlsu2B/Rg8H2B9U3mPY7bApmFrpBVd9TqbwNuw801IC14wLxU/XVF9AuUmk3ZZdcYQ2jcPLxqffXONnN4218orqxP+R0rclrod0UPdeyzo+Uyoefj8zE6ZY+7pFaVKo9nVAGyFxqaINqw=
In-Reply-To: <483E1DF2.3080304@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I thank you for your quick response. I wish I could draw ascii art
like that. I dont know how to do that on an email compose window.

On Wed, May 28, 2008 at 8:07 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
<snip>
>
> Let's redraw this up a little bit.
>
>                  +--------------+
>                  |    Bridge    |
> ("Net 0")   AP0---+ eth0    eth1 +---AP1   ("Net 1")   DHCP server
>                  +--------------+
>
> Is a client on "Net 0" suppose to have an IP in the same subnet as clients
> on "Net 1"?  Or is the "Bridge" system going to be routing for all the
> clients on "Net 0" and hiding them as one IP to "Net 1"?

The bridge is between eth0 and eth1. AP0 is connected via a crossover
cable. eth1 connects to "Net 1" and eth0 connects to AP0. eth0 does
not have an IP address (I can assign it one, but I dont see any reason
for it)
The clients have IP address allocated from the same subnet as eth1,
The clients are no different from eth1 from the perspective of the
DHCP server.

> I ask this because you are starting to sound like the "Bridge" system is
> suppose to act like a SOHO router like you would use on your DSL / cable
> modem to connect your home LAN to your internet connection.  However your
> original question implied that you wanted "Net 0" and "Net 1" to be joined
> together as one big network where everything on both sides could see
> everything else.
>

<snip>

The bridge system (comprising of interfaces eth0 and eth1) is a laptop
running Linux that aims to extend the range of a wireless network (the
one which the wireless interface eth1 connects to). It may appear to
be easier to add more APs and connect them to the back bone network
but we are evaluating this approach because we want to switch the
wireless network to a 3G data connection and still offer Wi-Fi
services to our clients. As a start we wanted to evaluate WiFi
extension. with just WiFi. We want the Linux laptop to be totally
transparent and the clients connect to the Wi-Fi network just as they
would from any other AP. The Linux laptop merely acts as a firewall+
bridge for the clients. The clients would get IP addresses in the same
subnet as eth1 in the figure. Remote monitoring of the linux machine
is possible through the DHCP assigned IP address. All traffic from/to
the clients should flow through the bridge. I plan to add filtering
after I get traffic flowing in both directions.

The problem:

The DHCP requests from the clients get blocked at the eth1 interface.
I want all traffic from the clients to go out via eth1. I would like
to know to configure this setup,

I thank you again for your patience. Looking forward to your replies.

Thanks
Regards
Knight
