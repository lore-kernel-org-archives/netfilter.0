From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Kernel panic In interupt handler - not syncing
Date: 31 Mar 2003 23:46:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049147160.9857.27.camel@tux.rsn.bth.se>
References: <7160403BF562D211A1C70000F809810B05286F4A@nems09.nawcad.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7160403BF562D211A1C70000F809810B05286F4A@nems09.nawcad.navy.mil>
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
To: "Allshouse, Brian M   (Sabre)" <AllshouseBM@navair.navy.mil>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Mon, 2003-03-31 at 22:51, Allshouse, Brian M (Sabre) wrote:
> I'm having problems with kernel panics. I set up my firewall with the latest
> and greatest version of iptables and the latest stable kernel. I'm runing
> slackware 8.1, and ever since I put it on the network for testing I get
> kernel panics that crash the machine I tried the previous kernel version
> (2.4.18) and also tried the latest patches for Iptables. I wanted to see if
> anyone has faced this problem. Maybe tell me if it's my rules or a bug I
> don't know about. I can post my rules if anyone has some ideas. I'm fairly
> new to this so if faulty rules can cause this kind of behavior than I'm open
> to suggestions. Any help would be appreciated, like I said I can post my
> rules or give more details if someone has some ideas. Thanks.

What you need to do is to get a backtrace of what went wrong.
You do this by running the stackdump you get when the kernel panics
(oops) through a program called ksymoops. You will need some way of
saving the stackdump, you can write it down by hand, use a serial
console, use any of the numerous patches out there that saves this stuff
for you, ie. kmsgdump, netconsole, lkcd...

If you are using modules you will need a copy of /proc/ksyms as of the
time the machine crashed. This file only changes when loading/unloading
modules so just get a copy of it after the system is up and running (if
you get that far :)

There's also something called kksymoops that will print an already
decoded backtrace instead. It's included in kernel 2.5 and there's a
backport to kernel 2.4.21-pre5 (might work with earlier kernels as well)
here: http://gandalf.hjorten.nu/kksymoops-2.4.21-pre5
This won't require the /proc/ksyms file. I've havn't tested this patch
yet but it might work :)

After you got a decoded backtrace you can add it to the netfilter
bugzilla (https://bugzilla.netfilter.org) if and _only_ if you see any
iptables functions in the backtrace (if unsure mail me privately and
I'll take a look).

First you need to get that backtrace and after that we can start
investigating what went wrong.

Did you try to rule out flakey hardware such as overheating cpus (easily
checked if you don't mind getting your finger burnt :), bad memory (can
be tested with memtest86 but this takes very long time and might not be
possible in a production system?)

-- 
/Martin

