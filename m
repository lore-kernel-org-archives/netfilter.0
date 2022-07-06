From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Subject: Re: Bug in the wiki
Date: Wed, 6 Jul 2022 12:46:41 +0100
Message-ID: <CAEXMXLSZsU9XY6QwrS1UAVSErb1Kg=M5JPx_GHCgbDG4hXO9eA@mail.gmail.com>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
 <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com> <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
 <16130a18-e4c1-a1b7-1414-7025389efca0@fhmtech.com> <CAEXMXLSGWtT_6JrCEFhRgvG4-Ssj1jnVUs_r4JjoFzwjiip=mA@mail.gmail.com>
 <d8aa9eed-4e9f-7385-6908-438e71c8c2d1@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zOZo2Q7lrQz/K8D5Muuc6kxgsFNLQ92Mm6HWvZAOTCw=;
        b=Ykgg1RQIAhDWHZutiQBT6I9uzUTHSxNkPsGi+SnvStm/8j/yuN1Akmw3UB91pvvSXW
         WGAmtTNqDZeRCp+GzBK9148bOd3WPi8X9m6dS/hLXfsCucZ7ZI5+Tkw3wte4uZed4pwQ
         XcgaQpZpa4H7Iu1NgMCFMWJa86IU9V4KGTH21LaWdaJcRTxi4cUQFWo0z0OoryC/5mdm
         8E1jhSU+SDlGRvWqXsVgFtyQVaNPWuhaLcHyD6TtqgT1nXLTAjGHlxh8l75idy9WeNWn
         JPRdfEsYb/XumEmTFLNtFeX+W7m4RJwPSny5fYuVGBB0CiuYlUhKYmskY/TZqljfwAZc
         1UfQ==
In-Reply-To: <d8aa9eed-4e9f-7385-6908-438e71c8c2d1@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

On Wed, Jul 6, 2022 at 12:26 PM Frank Myhr <fmyhr@fhmtech.com> wrote:
> * I agree that your modifications will counter a single-ip ping flood
> attack. Whether that attack is significant compared with, say, DDoS ping
> floods or attacks against other services, will depend on the particulars
> of your installation. If the single-ip ping flood *is* a big concern, it
> may be better to use a different ruleset construction with icmp in a
> dedicated chain.

The discussion about netfilter/conntrack approach is really not at my
level, but regarding the attack scenario, It's more of a total packets
issue.

If each source is allowed to send unlimited (let's say 100) packets,
then the attack could ramp at 100*5 packets per second, so after 60
minute could be at 1.8M packets/s.

This limits the reach of my knowledge about any of this :D I just
tried to get this configuration working for me.

Thanks
