From: Michal Kubecek <mkubecek@suse.cz>
Subject: Re: iptables --rename-chain segfaults
Date: Wed, 18 Dec 2013 08:37:24 +0100
Message-ID: <20131218073724.GA10463@unicorn.suse.cz>
References: <88FFED98AFE8704DA7F1EF36492E56970138585A@EXMBD7VH.corp.cdw.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <88FFED98AFE8704DA7F1EF36492E56970138585A@EXMBD7VH.corp.cdw.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Guthrie <Jeremy.Guthrie@cdw.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, Dec 17, 2013 at 08:13:15PM +0000, Jeremy Guthrie wrote:
> We have an issue where 'iptables --rename-chain' appears to segfault
> without any indication as to why.

A core dump or at least a backtrace would be helpful.

> OS:  SLES 11 SP3
> IPTables Release:  iptables-1.4.6-2.11.4
> Kernel:  3.0.82-0.7-default #1 SMP

Looks like distribution iptables package and distribution kernel (even
if not the lates one). Why don't you handle this through SuSE support?

                                                        Michal Kubecek

