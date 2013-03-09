From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Netfilter applied to specific interfaces only
Date: Sat, 9 Mar 2013 23:10:44 +0100
Message-ID: <20130309221044.GA3419@localhost>
References: <CADju=b7RdboFOXvPRSn=Ax-+pihecm_Txf-JCHLYum_gjSC9dw@mail.gmail.com>
 <alpine.LNX.2.01.1303082046110.28399@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1303082046110.28399@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Jim Mellander <jmellander@lbl.gov>, netfilter@vger.kernel.org

On Fri, Mar 08, 2013 at 08:52:37PM +0100, Jan Engelhardt wrote:
> 
> On Friday 2013-03-08 20:14, Jim Mellander wrote:
> >
> >In the HPC world, and in network intrusion detection, network
> >performance is paramount.  We've found that just having the iptables
> >kernel module loaded without any ruleset substantially reduces
> >performance at high traffic rates.
> 
> This one is a known issue with ip_tables/x_tables, and solved in 
> xtables2 where you can deallocate the base chains when empty -- (more 
> accurately, they do not exist by default and need to be created first) 
> -- given finer control over what is being executed.

Just for the record: this idea was initially introduced by nftables
back in 2009.

Regards.
