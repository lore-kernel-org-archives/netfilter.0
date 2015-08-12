From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: unknown option "--map-set"
Date: Wed, 12 Aug 2015 14:35:01 +0530
Message-ID: <CAA5aLPiHDNwK_mxiaTVYYCmZpkr1wyyjbMCa4CmQDhPrVVv3Yg@mail.gmail.com>
References: <CAA5aLPg=UhPp0wODZc8qtx3FwnReM+3Qs4zFm9_8Fgap8LMvtg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=ZAnHURv4VUHCS7uLXNPjjLaejtzQ24cmZvBGT7Uvo8k=;
        b=i+Vi7qd6RZwrOYr8KjqNvXuzTzdNHLM/aemrhVOt8RMe8hnjvSsesTyZWjA5O14nv6
         oO264MeAB0MVnDviupc+Ba80ZmuIrMz1rj1Wci1n0+HMpS8ZfEZ8pgpE2LxI/ipCFnzz
         htBYLHF6jf44sY+YhTEWsxPJ6m6f7Uqcmb5KgLBV2Z5kYu+LXQz00Npfrg4gKu7fxov7
         UhLj/HlawyD4i7iqW/naL0SnjdZoIXa2FY/OuBP0ZJePlPSZWfAfhXwvmD+zcRHZNG0B
         co+OlB/qXaHPszpvrZPbQoQKEn+hBq7eaPAubMhVr+dH2kFflAOxeGLW0vxFUGwry/uV
         2uAw==
In-Reply-To: <CAA5aLPg=UhPp0wODZc8qtx3FwnReM+3Qs4zFm9_8Fgap8LMvtg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Well, it looks that the Sep 16 Snapshot didnt have the code for
map-set option. But thats strange as the code was committed on Sep 14,
so it should have been there.

Am I missing some very basic thing over here?

On Wed, Aug 12, 2015 at 12:42 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> I am running sl6.3 (i.e. kernel 2.6.32-279). I upgraded the kernel
> using elrepo to kernel 4.1.4.
> I downloaded iptables-20140916.tar.bz2 i.e. Sep 16, 2014 snapshot in
> order to test new functionality of skb-priority added in ipset 6.22.
> Prior to this my iptables version was 1.4.7
>
> I installed ipset .6.25 and create an ipset named test (ipset -N test
> hash:ip skbinfo)
>
>
> Then I Installed above mentioned Sep 16, 2014 iptables snapshot
>
> now it shows my version as 1.4.21
>
> when I execute follwing command
> iptables -t mangle -A POSTROUTING -o eth1 -j SET --map-set test src --map-prio
>
> it gives error
> iptables v1.4.21: unknown option "--map-set"
> Try `iptables -h' or 'iptables --help' for more information.
>
> prior to installing iptables, i execute follwing commands  to stop
> iptables and remove iptables modules, so that old modules should not
> confilct.
>
> service iptables stop
> rmmod iptables_mangle
> rmmod iptables_filter
> rmmod iptables_nat
> rmmod ip_tables
>
>
> Please help.
