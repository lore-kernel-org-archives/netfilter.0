From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: What is the GPRINT output plugin for?
Date: Tue, 4 Jan 2022 12:24:57 +0100
Message-ID: <YdQuiVS9DyNtMsCa@salvia>
References: <87y256gyti.fsf@laptop.lockywolf.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87y256gyti.fsf@laptop.lockywolf.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Nikishkin <lockywolf@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Nov 30, 2021 at 10:30:17AM +0800, Vladimir Nikishkin wrote:
> Dear Netfilter users,
> 
> I have been recently trying to find out how to efficiently log
> suspicious packets passing through my firewall. While perusing ulogd2
> examples, as well as netfilter mailing list, I found about the existence
> of the GPRINT output plugin.
> 
> However, the basic stack suggested in ulogd.conf:
> ```
> stack=log4:NFLOG,gp1:GPRINT
> ```
> did not really work for me, ulogd was complaining about
> ```
> ulogd.c:854 type mismatch between GPRINT and NFLOG in stack

This is a bug:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20220104112056.4034-1-pablo@netfilter.org/

> ```
> And the log file was empty.
> 
> I haven't found any other documentation for GPRINT.
> What is it and what is it for?

Yet another output plugin which displays every field brought to you bu
the input plugin feeder.
