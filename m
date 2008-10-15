From: "Amos Jeffries" <squid3@treenet.co.nz>
Subject: Re: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 
     ISP's network
Date: Thu, 16 Oct 2008 10:23:53 +1300 (NZDT)
Message-ID: <b279aba36c2ccd3e1bb1d98c7fce21a2.squirrel@webmail.treenet.co.nz>
References: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elvir Kuric <omasnjak@gmail.com>
Cc: netfilter@vger.kernel.org

> Hi all,
>
> I have an question network/iptables related. In my home network I am
> planning to deploy ipv6 addressig, not because I do not ip addresses,
> but only as training how to set up
> all that. I read some manuals/books and less or more it is not so big
> problem. On my home firewall/router I have Debian GNU/Linux with
> iptables as firewall tool and it works fantastic :)
> I am wondering does someone has experinece with translation from ipv6
> ---> ipv4, I mean I am going to set up my home computers to use IPv6
> but still I have to push my iptables rules ( I know iptable supports
> ipv6 ) and
> my gateway to packages from ipv6 network prepare for ipv4 network ( my
> ISP provider )
> Any suggestio is welcome and thank you in advance.
>

Greetings.
  If you need direct assistance, I've been through this already in a
Debian environment.
 You need to look at dual-stack network with a 6to4 or 6over4 tunnel on
one of the machines. Depending on how close you are to 192.88.99.1 will
determine which works fastest for you. I have a script I can provide when
I return home which does setup of 6to4 tunnels. 6over4 is usually
provided by the tunnel broker you choose.

What OS are your home machines?
and do you have at least one machine Linux 2.6.25+ (newer is better for
IPv6 stability) to use as the IPv4/IPv6 gateway? NP: it does not have to
be the same as IPv4 gateway machine, but that helps :)

Amos Jeffries

