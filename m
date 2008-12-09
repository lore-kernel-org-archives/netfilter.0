From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: UDP netbios nameserver packets blocked
Date: Tue, 09 Dec 2008 11:38:13 +0100
Message-ID: <493E4A95.7040302@freemail.hu>
References: <493DBE52.1010003@www.knutejohnson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <493DBE52.1010003@www.knutejohnson.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Knute Johnson <knute2008@www.knutejohnson.com>
Cc: netfilter@vger.kernel.org

Hello,

I think that you did not load the nf_conntrack_netbios_ns module...

Just to be clear: DNS !=3D NETBIOS NS !!!

Swifty

Knute Johnson =EDrta:
> I have the following line in my iptables configuration;
>
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> When I use the smbclient command, it attempts a DNS lookup, which=20
> fails as it should, then does a netbios nameserver lookup.  The=20
> response is getting blocked with the last line in my configuration;
>
> -A INPUT -j REJECT --reject-with icmp-host-prohibited
>
> I can make it work if I put in the following;
>
> -A INPUT -p udp --sport 137 -j ACCEPT
>
> but I thought the top line should have allowed the response to pass=20
> through.  It is coming back on the same port as it was sent on.
>
> Any insight would be appreciated.
>
> Thanks,
>

