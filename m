From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Promiscuous mode and xtables
Date: Thu, 04 Aug 2011 22:57:13 +0100
Message-ID: <4E3B15B9.1090803@abpni.co.uk>
References: <4E3A1DB5.3090102@abpni.co.uk> <4E3A5A2D.4090104@tolaris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E3A5A2D.4090104@tolaris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Tyler J. Wagner" <tyler@tolaris.com>
Cc: netfilter@vger.kernel.org

Shouldn't I also set the input chain to DROP as well?

Thanks

On 04/08/2011 09:37, Tyler J. Wagner wrote:
> If you intend to monitor only, set OUTPUT and FORWARD chains to DROP.
> Otherwise you can't firewall. Make sure your monitoring software is up
> to date, as vulnerabilities on it will be the biggest issue.
>
> Regards,
> Tyler
>
> Jonathan Tripathy<jonnyt@abpni.co.uk>  wrote:
>
>      Hi Everyone,
>
>      Currently, I use ebtables and iptables to secure my servers. It would be
>      appreciated if someone could please give me some advice on what the best
>      settings are for using a network port in promiscuous mode for network
>      monitoring *only*. I.e. I do not want any of this traffic to be able to
>      access anything on my server.
>
>      Thanks
>      --
>      To unsubscribe from this list: send the line "unsubscribe netfilter" in
>      the body of a message to majordomo@vger.kernel.org
>      More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
