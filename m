From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 ISP's
 network
Date: Wed, 15 Oct 2008 15:45:11 -0500
Message-ID: <48F65657.1010200@riverviewtech.net>
References: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/15/08 15:32, Elvir Kuric wrote:
> I am wondering does someone has experinece with translation from ipv6 
> ---> ipv4, I mean I am going to set up my home computers to use IPv6 
> but still I have to push my iptables rules ( I know iptable supports 
> ipv6 ) and my gateway to packages from ipv6 network prepare for ipv4 
> network ( my ISP provider )

Sorry, I've avoided IPv6 as of yet.

> Any suggestio is welcome and thank you in advance.

Try taking a look at this web page 
http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.tunnel-ipv6.addressing.html 
and see if there is any thing helpful there.

I'm not quite sure how IPTables will come in to play with both IPv4 and 
IPv6.  Also, that particular web page only deals with tunneling IPv6, 
not gatewaying it to IPv4.



Grant. . . .
