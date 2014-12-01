From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft icmpv6 mld-listener-query rule not honored?
Date: Mon, 1 Dec 2014 17:04:47 +0100
Message-ID: <20141201160447.GA3225@salvia>
References: <547483B3.6040207@gmail.com>
 <20141201125940.GA11047@salvia>
 <547C8EF0.4070200@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547C8EF0.4070200@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stoffl4ever <stoffl4ever@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Dec 01, 2014 at 04:53:20PM +0100, stoffl4ever wrote:
> On 01.12.2014 13:59, Pablo Neira Ayuso wrote:
> > On Tue, Nov 25, 2014 at 02:27:15PM +0100, stoffl4ever wrote:
> >> SysInfo:
> >> kernel: 3.17.4.201411220955-1-grsec (all nf* modules loaded)
> >> nft: nftables v0.3
> >> Network setup via systemd-networkd: br0(bridge) is attached to
> >> eth0(physical nic)
> >>
> > You need these two patches:
> >
> > http://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/commit/?id=68b0faa87d167ec87ba2a26be62241ad94eb449b
> > http://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/commit/?id=1b63d4b9b54cee6002757a8d20b537aa4037ae8f
> >
> > They apply to Linux kernel 3.18-rc.
> >
> > The second patch sets the transport layer offset to get layer 4
> > protocol matching from the bridge. Please, I'd appreciate if you can
> > give them a test and report, those two are scheduled for 3.19.
>
> Thank you, I am hoping to try it out asap, but I have to setup another
> System because the current system is a semi-production machine that I
> don't have any other access then ssh, and no grsec patch set is
> available for 3.18-rc.

OK.

> > BTW, I noticed that you're using the 'inet' family. I guess you're
> > using bridge netfilter. I think you should use the 'bridge' family
> > instead, it comes with native working reject support since the
> > upcoming 3.18.
>
> Okay I'll try that when i have 3.18 on my box.
>
> > One of the goals of nftables is to supersede br_netfilter.
> >
> I am not using br_netfilter, see lsmod output:

If you're using 3.17, you have it built-in in the bridge module by
default.

br_netfilter as module is available since 3.18-rc.
