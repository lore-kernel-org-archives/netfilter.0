From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: 14 Jan 2003 17:58:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042563532.465.1024.camel@xbox>
References: <20030114093711.GC9940@westend.com>
	<20030114121232.GA3362@westend.com> <1042551825.465.143.camel@xbox>
	<20030114150641.GB23431@westend.com> <1042559354.464.770.camel@xbox>
	<20030114160134.GC6664@westend.com> <1042560593.464.862.camel@xbox> 
	<20030114163734.GB19620@westend.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114163734.GB19620@westend.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Christian Hammers <ch@westend.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-01-14 at 17:37, Christian Hammers wrote:

> Kernel-2.4.20. modprobe-2.4.15. Debian 3.0 woody distribution.
>
> > Is this reproducable upon every reboot ?
> I'm not allowed to reboot it :-) But it's still reproducible that 
> after decreasing with about 1000 per minute the value of
> /proc/net/ip_conntrack has now stabilized around the
> /proc/sys/net/ipv4/ipt_conntrack_max value which is currently 10000 
> (was 65520 and filled up to ca. 50000)

Since you haven't rebooted it, you will continue to have this
problem as basically your running kernel+ip_conntrack is
basically screwed until you reboot the box. 

> Hmm :) 
> Maybe you should set your machine unter a load of at least 4mbit/s 
> with random IPs. This was the amount of traffic my router had when I
> reloaded the firewall rule script with a "rmmod" at the beginning.

I think you're absolutely right that by unloading ip_conntrack
while the box is handling packets gives you a greater chance
of triggering a problem. I remember having this kind of problem
occasionally with NIC drivers and ip_conntrack_ftp.

See also this item on the netfilter TODO list:

TO BE INVESTIGATED:
[...]
- ip_conntrack rmmod loop (sometimes, Yan's patch?)
   
Could be your problem, couldn't it ?
Not a lot I can say to help you any further though...
If you can reproduce this, you may inform netfilter-devel
of your workload and test scenario, which could help
developers. Is your firewall an SMP (multiprocessor)
machine, by any chance ?

Regards,
Filip





