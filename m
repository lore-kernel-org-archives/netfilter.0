From: "Eugene Polyanichko" <messiah@nline.net.ua>
Subject: Re: conntrack "invalid parameters" error
Date: Tue, 19 Feb 2008 15:40:03 +0200
Message-ID: <005401c872fc$eebce120$0201a8c0@stealth>
References: <003901c872f9$915921e0$0201a8c0@stealth> <47BAD7FB.8040709@netfilter.org>
Reply-To: "Eugene Polyanichko" <messiah@nline.net.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

I've compiled it (and almost all other netfilter features) inside kernel.

> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> Did you insmod nf_conntrack_netlink? nfnetlink can return EINVAL for
> those cases.
> 
> -- 
> "Los honestos son inadaptados sociales" -- Les Luthiers
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
