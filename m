From: Michal Soltys <soltys@ziu.info>
Subject: Re: u32 question
Date: Mon, 21 Dec 2009 06:52:15 +0100
Message-ID: <4B2F0D0F.8030100@ziu.info>
References: <20091219231018.B79C41A8193@isis.cs3-inc.com> <19245.36072.654916.551426@isis.cs3-inc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <19245.36072.654916.551426@isis.cs3-inc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Don Cohen <don-nfil2@isis.cs3-inc.com>, Mike Kuketz <mike@kuketz.de>

Don Cohen wrote:
> Don Cohen writes:
>  > 
>  > This example doesn't seem to work for me.
>  > Does it work for anyone else out there?  
>  > 
>  >  $ iptables -A OUTPUT -m u32 --u32 "0>>22&0x3C@12>>26&0x3C@-3&0xFF=0:255"
>  >   -j LOG --log-prefix "TCP with payload *** "
>  > I've tried some examples without the @ and they seem to be working but
>  > I don't get anything in the log when I do this:
> 
> A little more data - this seems to work when I replace the -3 above
> with 0.  It now occurs to me that the problem might be that I'm using
> a 64 bit machine and the -3 translates to #xfffffffd rather than
> #xfffffffffffffffd.
> 
> (Mike, are you using a 64 bit machine?)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

This match in its current version does plenty of sanity checks, and 
moving back using negative offsets don't work (as negative offsets 
are not allowed and the data is internally treated as big >0 value 
- thus failing the match). You have two options: 

- patch the xt_u32.c to allow earlier behavior
- use match2 from xtables-addons (separate options for matching)

For reference:

http://xtables-addons.sourceforge.net/
http://marc.info/?t=125219819200001&r=1&w=2
