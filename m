From: Ricardo Katz <ricardo.katz@gmail.com>
Subject: Re: 50k rules and performance issue in nft list table AND iptables-nft
Date: Fri, 21 Aug 2020 08:50:54 -0300
Message-ID: <CAG3fPQ7m5L_a3NV-ocGBgBMCzaJb+VXFNkDKmZB44fv419N1zw@mail.gmail.com>
References: <CAG3fPQ4m9+Wbj3vKPmXbXa9-vH6ABq1eVNGGGzgbY_hNqGtdTw@mail.gmail.com>
 <20200821112049.GA29905@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wuJ9X5gabJM1CxeBUfX9hghunsIOexgaJe0Yxg7T7pA=;
        b=D9KuGug+iSFEY5T9Tu+XJne9lvapKgrR4VahsvrivZW5LdiQ9FlM1NpKzGBR5e+Q39
         ISj1PtIF8ogySmMpgVV7KM1K3ziV7DdxRQ+r0enNlAE90X7Ugaat4Z8lhPtvzBDpbc8C
         ioe2O/vAKG7wS9l3ku/HPSqjuySFz/Br+kY/NB5ULuRuvCXJ4tfXzB0V5nH8yrDBu2Mj
         zBAcPumLfMOxfy21P8mmWqYysdMNsu2NfuPiB9gLg1VCtsAJSv5Ki7/Wb4A1bZmAg1Ls
         gMtp7AGV1foap2TpGs1vsUsWhkUY097t+eGF7qfweGeVN9VUlghS6ROd9BccR6hHOeZn
         ho7g==
In-Reply-To: <20200821112049.GA29905@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Thank you Pablo.

I'll compile here with the patch ASAP and test in my QA and Prod
environment, and will provide some further feedback

Best,


On Fri, Aug 21, 2020 at 8:20 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> Hi,
>
> On Fri, Aug 14, 2020 at 06:56:32PM -0300, Ricardo Katz wrote:
> > Hello,
> >
> > I've been digging into some performance issue I'm facing in my
> > production environment and would like to ask if someone has a light
> > about this.
> >
> > My environment has ~50k rules that references some ipsets (it's a
> > Kubernetes cluster with Calico), and we've seen that sometimes
> > iptables-nft-save takes more than 20s. So I've tried to search what
> > was causing that, and have found some interesting behavior:
> [...]
> > * nft list table performs WORST than iptables-nft-save, sometimes
> > taking more than 25s to display the rules. I've made the same test in
> > a non prod (less load) environment and it takes a little bit less but
> > yet, it's strange. The measured time is 4s in userspace and the rest
> > in kernel space, which leads me to ask: is there a way netlink should
> > be tuned? [...]
>
> I have posted a patch to improve listing time:
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20200821111438.5362-2-pablo@netfilter.org/
>
> Thanks for reporting.
