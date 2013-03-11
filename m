From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Netfilter applied to specific interfaces only
Date: Mon, 11 Mar 2013 08:55:19 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303110846470.30173@nerf07.vanv.qr>
References: <CADju=b7RdboFOXvPRSn=Ax-+pihecm_Txf-JCHLYum_gjSC9dw@mail.gmail.com> <alpine.LNX.2.01.1303082046110.28399@nerf07.vanv.qr> <20130309221044.GA3419@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130309221044.GA3419@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jim Mellander <jmellander@lbl.gov>, netfilter@vger.kernel.org

On Saturday 2013-03-09 23:10, Pablo Neira Ayuso wrote:
>On Fri, Mar 08, 2013 at 08:52:37PM +0100, Jan Engelhardt wrote:
>>On Friday 2013-03-08 20:14, Jim Mellander wrote:
>>>
>>>just having the iptables kernel module loaded without any ruleset 
>>>substantially reduces performance at high traffic rates.
>>
>>This one is a known issue with ip_tables/x_tables, and solved in 
>>xtables2 where you can deallocate the base chains when empty -- (more 
>>accurately, they do not exist by default and need to be created first) 
>>-- given finer control over what is being executed.
>
>Just for the record: this idea was initially introduced by nftables 
>back in 2009.

This is now recorded in the xt2 userdoc, where a section has been added 
indicating capability origin by date and thereby implementation.
