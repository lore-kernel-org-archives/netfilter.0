From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 06:21:23 -0500
Message-ID: <200508150621.23635.rob0@gmx.co.uk>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
	<4300612F.6070603@mnemon.de>
	<200508152205.09409.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508152205.09409.michael@networkstuff.co.nz>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 2005-August-15 05:05, Michael Hallager wrote:
> > Regarding the timeout issue, do as Grant recommended. May be you
> > should log in OUTPUT too, at least if logging in INPUT will not
> > show the problem.
> >
> 1. I have tried both IN and OUT and I am not seeing any error
> messages or anything *obvious*

Your "dmesg" output is likely now full of dropped packet logging. 
Assuming Slackware's syslogd configuration, the same packet logs will 
be found in /var/log/syslog. Those packets tell the story of what is 
being dropped.

On Monday 2005-August-15 05:10, Michael Hallager wrote:
> > modules. Slackware-current has 2.4.31, and those packages will work
> > seamlessly in any 2.4.x-capable Slackware release (that's 8.0 and
> > later. And don't forget the alsa-driver package.)
>
> The original reason is that it is an IBM Netfinity with a SCSI RAID
> controller.

No doubt one of the stock .s kernels, probably raid.s, supports this 
controller.

> This is somewhere I would prefer not to go at present as the machine
> is located at almost the other end of the country.

Remote reboots are always risky. It helps immensely if there is a 
console and a warm body nearby.

I avoid unattended remote reboots as much as possible, but there are 
things you can do to minimise the risk. lilo(8) has a one-time reboot 
option. You can use that to boot into a test kernel, and have a cron or 
at(1) job set to reboot. If all is working you can log in and cancel 
the scheduled reboot.

Of course that fails if the OS fails to load, or if the kernel is 
severely lacking what might be needed, but this is highly unlikely if 
you're testing a Slackware kernel.

> That is why I keep recompiling 2.4.29, the one I originally compiled
> for this machine, rather then upgrading. There is only a small chance

The version is a minor issue at most, especially with late-model 2.4.x 
releases. 2.4 has been stable for quite some time. The major issue is 
the configuration of the kernel,

> that something would go wrong but I prefer not to give Murphey a
> chance....

Of course if you can get by with just a modules recompile, do so.

> Please advise if you think there is any not so obvious options
> needed.

See /boot/config. No, I couldn't guess what specific options you might 
be missing.

> I have read several 'howtos' and official DOC's when setting IP
> Tables up.

None I have seen explain the problems of using kernel default settings. 
That is why I have always recommended starting with Slackware defaults. 
I'm loosely affiliated with slackbook.org, which in Slackware terms is 
a semi-official documentation project. I will talk to Alan and propose 
a rewrite of http://slackbook.org/html/system-configuration-kernel.html 
to include this explanation.

On Monday 2005-August-15 06:07, Michael Hallager wrote:
> AS FOLLOWS:
>
> root@202-150-101-225:/home/michael# iptables-save

There are no rules whatsoever! Did you or some process flush them?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

