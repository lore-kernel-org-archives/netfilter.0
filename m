From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: routing all HTTP requests to my own web server
Date: Fri, 17 Oct 2008 12:57:50 -0500
Message-ID: <48F8D21E.9050601@riverviewtech.net>
References: <a0a0d59c0810171040s3646c212g150d7691e6d92f4b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a0a0d59c0810171040s3646c212g150d7691e6d92f4b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/17/08 12:40, Jeremy Pullicino wrote:
> After consulting with the docs and online tutorials I came up with 
> the command below:
> 
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT 
> 192.168.11.100
> 
> Is this the correct way to do it?

That is the first part of it.  You will also need to SNAT the traffic.

> Any advice will be really appreciated.

Look through the archive for this mailing list, or better search it, for 
what I refer to as the "TCP Triangle".

I think the most recent thread that this was discussed had a subject of 
"Different kind of transparent proxy".

Also, you may find Jan Engelhardt's TCP Triangle image explains it well.

    http://jengelh.hopto.org/images/dnat-mistake.png



Grant. . . .
