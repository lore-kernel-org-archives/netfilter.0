From: Jeremy Guthrie <Jeremy.Guthrie@cdw.com>
Subject: Re: iptables --rename-chain segfaults
Date: Wed, 18 Dec 2013 17:05:29 +0000
Message-ID: <88FFED98AFE8704DA7F1EF36492E569701386AE9@EXMBD7VH.corp.cdw.com>
References: <88FFED98AFE8704DA7F1EF36492E56970138585A@EXMBD7VH.corp.cdw.com>
 <20131218073724.GA10463@unicorn.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Michal Kubecek <mkubecek@suse.cz>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/18/13 1:37 AM, Michal Kubecek wrote:
> On Tue, Dec 17, 2013 at 08:13:15PM +0000, Jeremy Guthrie wrote:
>> We have an issue where 'iptables --rename-chain' appears to segfault
>> without any indication as to why.
> A core dump or at least a backtrace would be helpful.
I will work to get one.  This may take me a little bit.
>> OS:  SLES 11 SP3
>> IPTables Release:  iptables-1.4.6-2.11.4
>> Kernel:  3.0.82-0.7-default #1 SMP
> Looks like distribution iptables package and distribution kernel (even
> if not the lates one). Why don't you handle this through SuSE support?
>
>                                                         Michal Kubecek
>
>
>
We're licensed for patching, not for tech support.  Frankly, this is the
first issue in the years we've been using this platform where we haven't
been able to ferret out the issue.

Thanks & more to come.
