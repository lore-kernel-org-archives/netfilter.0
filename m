From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Compiling libnetfilter_queue-1.0.2
Date: Wed, 14 Nov 2012 09:29:35 +0100
Message-ID: <50A3566F.3040105@sterenborg.info>
References: <508A7252.80202@sterenborg.info> <alpine.LNX.2.01.1210261455090.2774@nerf07.vanv.qr> <loom.20121113T185650-311@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20121113T185650-311@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Don bham <defestdude@gmail.com>
Cc: netfilter@vger.kernel.org

On 11/13/2012 06:58 PM, Don bham wrote:
>   I have seen this before - it is a bug in CentOS's glibc.
>   Commit id of the fix is (glibc.git) 15bac72bac03faeb3b725b1d208c62160f0c3ad7.
>   --
>   To unsubscribe from this list: send the line "unsubscribe netfilter" in
>   the body of a message to majordomo <at> vger.kernel.org
>   More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> How do i implement this fix please?

Well, just putting 15bac72bac03faeb3b725b1d208c62160f0c3ad7 in Google 
refers you to the patch (I think the 2nd or 3rd url should get you going).

After downloading the diff, you can apply it to the system's header 
file: /usr/include/netinet/ip.h.

Compile libnetfilter_queue-1.0.2 and IIRC it should work just fine.


--
Rob

