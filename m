From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: help needed: clogged console
Date: Mon, 05 Jan 2004 20:42:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073353325.3044.1.camel@jasiiitosh.nexusmgmt.com>
References: <Pine.LNX.4.33.0401051315050.15139-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0401051315050.15139-100000@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: bmcdowell@coxhealthplans.com, orlowscy@hotpop.com, shrike-list@redhat.com, redhat-list@redhat.com, netfilter@lists.netfilter.org

On Mon, 2004-01-05 at 07:31, Jozsef Kadlecsik wrote:
> On Fri, 2 Jan 2004, John A. Sullivan III wrote:
> 
> > > Search for 'dmesg -n 1' - I think that's what you're after.
>                 ^^^^^
> > I've been really confused by this issue.  I am also running iptables on
> > RedHat 9.0.  /etc/syslog.conf shows nothing being logged to the
> > console.  Yet, ever since applying the netfilter patch-o-matic
> > tcp-window patch, all of its messages appear on my console.  The
> > netfilter mail lists say this is a misconfiguration of syslog but it
> > sure looks correctly configured to me.  No other iptables messages go to
> > the console - just the tcp-window messages. How do I stop them!!! Thanks
> 
> Default the tcp-window-tracking patch uses extensive kernel logging,
> while the other parts of netfilter keeps mouth shut. You can easily
> disable the logging by
> 
> echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_log_invalid
> 
> Back to the console logging: klogd uses the console to display the kernel
> log messages. You can alter it's default behaviour by issuing dmesg like
> above or setting the proper command line switches for klogd. If you want
> to send the kernel logs to other places (file/remote machine etc.), *then*
> you have to configure syslogd properly.
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary

Thanks.  Would you kindly confirm the /proc file.  I do not see
ip_conntrack_tcp_log_invalid.  I see ip_conntrack_tcp_invalid_scale and
ip_conntrack_tcp_log_out_of_window - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


