From: Verachten Bruno <gounthar@gmail.com>
Subject: Re: Is it possible to get a transparent proxy with Redsocks when
 using the new nftables?
Date: Thu, 5 Mar 2020 11:35:21 +0100
Message-ID: <CACtV=dd_TJNKLiExGvNWGPkMrSEZ4zyL=J5GGbx_9k7vFMzKxA@mail.gmail.com>
References: <CACtV=deJ2Sfq1q0r=MYvFOyh9B0UHkRTTnCYPW4yxMVfGLJyeA@mail.gmail.com>
 <20200303155712.GA14081@strlen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=TJDyOYXUkFW+VufOj/0SAg824f+m/E9SWh5X4wfDXzE=;
        b=Z+MOeHPaaCLFJnfuEdT8Carzk9SfJuBYiZCveVCh6CjufqafOukhVY+VRhyq77D4+h
         3n41PVMyqEQJxVFRD6TAZOgCfYFH9pUhZZuY//SpaeUzDcklzkAsVWETwdpcPSm1DWaM
         3+vdsj96ZwpyZF3DqaLnf6K3gbCAVhPtP5bOs+zXLY6i6ELhRlmlrbFYNcPVBFllwR4S
         tl3UDdI5Eb9HZ+CYJ+ME38UJfyynmfJEIj4m074QaJ5/rgbYfpEU1XcCx/DYKMFBLNu8
         sX/Ho12M8Y6+jBJ6JRj8SCAkRno/R1+zTK3+o2IRmQBs/zECzf0yq6bJO5ecgfZDWrs2
         I0pA==
In-Reply-To: <20200303155712.GA14081@strlen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> given all counters are 0 i would guess you use an older kernel
> where nft nat and iptables nat cannot coexist.
>
> I suspect you need to unload iptable_nat module.
Thanks for the tip.
As for the kernel, I have:
Linux orangepizero 5.4.20-sunxi #20.02.1 SMP Mon Feb 17 02:09:41 CET
2020 armv7l GNU/Linux

lsmod|grep -i table
ip_tables              24576  0
x_tables               20480  1 ip_tables

I can see ip_tables module, but not iptable_nat module:
lsmod |grep ip|grep table
ip_tables              24576  0
x_tables               20480  1 ip_tables

Once I launch my nft command, I get the same:
lsmod |grep ip|grep table
ip_tables              24576  0
x_tables               20480  1 ip_tables

Once I launch my old ip_tables commands, I then get:
poddingue@orangepizero:~$ lsmod|grep -i table
nf_tables              98304  86 nft_compat,nft_chain_nat,nft_counter
nfnetlink              16384  2 nft_compat,nf_tables
ip_tables              24576  0
x_tables               20480  4 ip_tables,nft_compat,xt_tcpudp,xt_REDIRECT

iptable_nat exists, but is not in use:
sudo modprobe iptable_nat
poddingue@orangepizero:~$ lsmod |grep ip|grep table
iptable_nat            16384  0
nf_nat                 32768  1 iptable_nat
ip_tables              24576  1 iptable_nat
x_tables               20480  1 ip_tables

And I can remove it:
sudo modprobe -r iptable_nat

I can't remember which command I use to have this output:
table ip filter {
        chain INPUT {
                type filter hook input priority 0; policy accept;
        }

        chain FORWARD {
                type filter hook forward priority 0; policy accept;
        }

        chain OUTPUT {
                type filter hook output priority 0; policy accept;
        }
}
You suggested me to get rid of this part, but I can't remember where
this came from, unfortunately.

Thanks for your time and patience,
-- 
Bruno Verachten
