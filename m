From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Re: MARK not working
Date: Fri, 2 Apr 2010 11:16:24 +0200
Message-ID: <20100402111624.7af22eb8@catlap>
References: <4BB53BEC.9010709@gmail.com>
	<20100402065742.23be08f0@catlap>
	<4BB59C59.50607@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BB59C59.50607@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dennison Williams <dennison.williams@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

>Yes, this is a bit confusing to me as well.  In this scenario we have
>the establishing of a vpn connection (udp port 4500), following this is
>an attempt to establish a l2tp connection (udp port 1701 encapsulated
>in the vpn tunnel).

I think you're missing rule accepting traffic entering VPN
connection interface.

Try adding ACCEPT in INPUT or MARK 0x1 in PREROUTING for udp dport
1701. Alternatively you can MARK/ACCEPT incomming traffic on VPN
interface (eg. tap0 - vpn interface, then -i tap0).

The same will apply to traffic comming on l2tp interface if you going to
terminate the connection on very same box.

Hope that helps.

Regards,
Marek
