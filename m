From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: nft show counter
Date: Fri, 2 Apr 2021 13:58:38 +0200
Message-ID: <trinity-5952d750-31c3-468f-9c47-86937547349b-1617364718637@3c-app-gmx-bs22>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
 <20210401181414.GF13699@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617364718;
        bh=XCbkYOMqzpprpi+9xlqR0rltuTrI57hiINusGU3t3mo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Ms0zP7XtS2XRakcDheNVTpffEmGFq4Dbr8uONsDg1mowwPW5pszXLLALfi8nStJYM
         b3H8VLNLVz4LRBAcR8J9o8SsIIFwmSFkkJsS09JFK5ONi7mKeXhZrfwwob+LXXpqqP
         GkVjqE892Z2c29xjmW6wQ38zUzLp8NnOlg+/sndk=
In-Reply-To: <20210401181414.GF13699@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: Frank Myhr <fmyhr@fhmtech.com>, Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

> Gesendet: Donnerstag, 01. April 2021 um 20:14 Uhr
> Von: "Florian Westphal" <fw@strlen.de>
> Frank Wunderlich <frank-w@public-files.de> wrote:
> > one thing:
> >
> > # nft list counter filter voip2
> > table ip mangle {
> > }
> > table ip nat {
> > }
> > table ip filter {
> > 	counter voip2 {
> > 		packets 124 bytes 7440
> > 	}
> > }
>
> Can't repro so looks like this is already fixed.
>
> > tables mangle and nat should not be printed (still have them separatel=
y from converting iptables to nft)...in json-format it is right
>
> Yes, they should not be printed.

tested with my self-compiled nftables, and indeed it seems to be fixed:

root@bpi-r2:~# nft -f ruleset_new.nft
root@bpi-r2:~# nft list counter filter voip1    #using debian buster versi=
on
table ip mangle {
}
table ip nat {
}
table ip filter {
        counter voip1 {
                packets 0 bytes 0
        }
}
root@bpi-r2:~# /home/frank/nftables/install/sbin/nft list counter filter v=
oip1 #self compiled
table ip filter {
        counter voip1 {
                packets 0 bytes 0
        }
}
root@bpi-r2:~#

anyway i have now moved the mangle/nat chains into my filter table in newe=
r version of my ruleset to have only an ip(v4) and an ipv6 table (still se=
parated as v4 is much more complicated than v6)

Thanks, i will now test the mapping for log-counters, here it will be good=
 to have addr/port (instead of saddr/daddr + sport/dport) too. Is there a =
way to filter deeper into protocol stack (SIP data ignoring start registra=
tion traffic)

regards Frank
