From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: UDP fragments , legitimate ?
Date: Sat, 15 Dec 2012 14:31:48 +1300
Message-ID: <50CBD304.3020002@treenet.co.nz>
References: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com> <CAMfETGDNi9RP3tkDCkK7csup94BKeRLZDRotN9OHG_rq5M3_ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMfETGDNi9RP3tkDCkK7csup94BKeRLZDRotN9OHG_rq5M3_ZA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 15/12/2012 10:00 a.m., Brad Silva wrote:
> I know that NFS over UDP commonly sends packets that are much larger
> than the MTU (as much as 32KB per).
>
> However, it's very unlikely that you would see NFS outside your
> firewall.  Also, most NFS these days is over TCP.

HTCP protocol used by HTTP proxies to communicate between cluster peers 
can contain up to 64KB packets.

Amos

