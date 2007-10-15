From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: DHCP works but iptables should have dropped
Date: Mon, 15 Oct 2007 14:03:44 +0200
Message-ID: <47135720.9040804@freemail.hu>
References: <E1IgS7N-0000Jz-Kg@www3.emo.freenet-rz.de> <slrnfh5249.8cf.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrnfh5249.8cf.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@vger.kernel.org

[...]
> Use "netstat -lnp |grep dhcp". You can see that dhcpd has open 2 sockets.
> One is UDP socket for reply packet transmission, the second one is raw
> socket for request recieving.
>
> The raw socket has one important attribute: it recieves packets before
> netfilter. The same mechanism is used by tcpdump/libcap.
>
>   
Are you saying that We CAN NOT "protect" the DHCP-server with iptables?
> Therefore dhcpd can recieve packet even if they are blocked by
> netfilter. This is feature, not a bug. I have not idea why ISC' DHCP
> sever is implemented in this manner, but it is. (May be because of indirect
> broadcast destination IP address in DISCOVERY client request.)
>
> -- Petr
>   
Swifty
