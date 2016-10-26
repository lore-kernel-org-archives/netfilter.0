From: Michael Johnson - MJ <mj@revmj.com>
Subject: Re: iptables 'related' not working under linux kernel 4.8.3?
Date: Wed, 26 Oct 2016 10:54:12 -0700
Message-ID: <CAHGunUk-HV6ELx0TqngV0Ghyu75Yp8NFgBnbhumJVt+V=hRWeA@mail.gmail.com>
References: <CAHGunUmgVPqiYTiAH3bQP5r_Ygj364EQhtz25Nr9aNDS0toR0g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=r+VopJn7I0wdN/d2QovU7o317jp/MNN45VoVjyg4tU0=;
        b=okBBGsAnIqs35JSMqV5U1S/2azI6jTypuGyzy53WnnoOVoBEWNh3xZhRN0aPDS35sq
         fbAPjKHZPCAGjqcZzRrNqVaTpipUbltF5xVtVLKUga57bBGrNk4RerzwJRdIBLFOxzyD
         Cr9/cr+OB/F4Hd8Ci3/KSzwUQhiXrUDA+IsAhGhyisnPwHaXKRDHM9Mr8CsMaUupbGCD
         2rFmp4FQh9DUeTrTrrkntsZSHRGNbcnV8wBD9xSgty3N/F09oQ3zfn3fK0Dgl7OrPWHI
         LapYODeIwfDHz79y+R7Nrpv83niEuLxg84GdKeBM5flk3RuD+AlNkjJCNggsAhTQdmni
         VMdw==
In-Reply-To: <CAHGunUmgVPqiYTiAH3bQP5r_Ygj364EQhtz25Nr9aNDS0toR0g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hm...

Well, I don't know if the mailing list is working as my message still
isn't showing up in the archives and I've not received any messages
from the list since I joined.  But I figured out my problem and that
is I needed to set net.netfilter.nf_conntrack_helper = 1 vial sysctl.
On the off chance my message does eventually show up in the list
archives, hopefully this will help someone in the future,

On Mon, Oct 24, 2016 at 8:21 PM, Michael Johnson - MJ <mj@revmj.com> wrote:
> I've got a system where we run a custom compiled kernel.  In response
> to the DirtyCOW bug, we updated the kernel from 4.1.4 to 4.8.3.
>
> Everything works flawlessly, except for the --RELATED option in
> conjunction with FTP traffic (I don't know if it is working properly
> for other traffic or not.  To be 100% clear, under the 4.1.4 kernel,
> this worked fine.
>
> Is this just broken or is there something wrong with my kernel
> configuration?  It looks like my kernel config is right, but I know
> for certain.  I've attached the kernel config for both 4.1.4 and
> 4.8.3.
>
> It is worth noting that our system is based off of Debian Wheezy.  The
> iptables userspace tools are the version that come with Wheezy.  I
> compiled iptables 1.6.0 and tried that with the same results.  The
> only configuration option I passed to iptables was
> '--disable-nftables'.  This was done because I was not having log
> getting to to build against libnftnl in a custom location.
>
> Any suggestions?  I really don't want to have to keep my highports
> completely open to allow for FTP to work and I'm hitting a wall at
> this point.
>
> Thanks!
>
> --
> Michael Johnson - MJ



-- 
Michael Johnson - MJ
