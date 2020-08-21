From: Nirgal =?ISO-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Subject: Re: Fwd: Issue migrating "iptables -m socket --transparent" into nftables
Date: Fri, 21 Aug 2020 22:10:31 +0200
Message-ID: <1667802.tW6joTg63a@deimos>
References: <CAKcfE+ZhO2O6nanU=ABJB8ptpB8VvjCK1wmzQ8TMFx+U-0_8nw@mail.gmail.com> <CAKcfE+Yyo-zj9Oxh4Oth6yK7SoXVfa2mQrK9-11Q5NHc09uXzQ@mail.gmail.com> <20200821152333.GA22135@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200821152333.GA22135@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Balazs Scheidler <bazsi77@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

I should be able to test the whole thing by tomorrow.
You rock guys! :)

On Friday, 21 August 2020 17:23:33 CEST Pablo Neira Ayuso wrote:
> On Fri, Aug 21, 2020 at 05:15:21PM +0200, Balazs Scheidler wrote:
> > Hi,
> > 
> > Here's the accompanying nftables patch, just in case Pablo didn't do it.
> 
> Thanks Balazs, this looks good to me!
> 
> > Pablo do you want me to submit these as a pull request?
> 
> You can just send them via git format-patch to
> netfilter-devel@vger.kernel.org.
> 
> > All I did for testing was that it did compile this ruleset and attempted to
> > submit it via netlink to the kernel, which it refused, as I didn't patch my
> > kernel.
> 
> I'm attaching the kernel patch, compiled-tested only by now.
> 
> > ```
> > table inet haproxy {
> >   chain prerouting {
> >      type filter hook prerouting priority -150; policy accept;
> >      socket transparent 1 socket wildcard 0 mark set 0x00000001
> >    }
> > }
> > ```
> 
> Thanks.
> 




