From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: help needed: clogged console
Date: Fri, 02 Jan 2004 11:00:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073059221.2993.10.camel@jasiiitosh.nexusmgmt.com>
References: <7A3B4AA360FDEF448F3390421FC8D731012C6B06@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731012C6B06@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com
Cc: orlowscy@hotpop.com, shrike-list@redhat.com, redhat-list@redhat.com, netfilter@lists.netfilter.org

On Fri, 2004-01-02 at 10:15, bmcdowell@coxhealthplans.com wrote:
> Search for 'dmesg -n 1' - I think that's what you're after.
> 
> 
> Bob
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Slawomir
> Orlowski
> Sent: Tuesday, December 23, 2003 12:32 PM
> To: shrike-list@redhat.com; redhat-list@redhat.com
> Cc: netfilter@lists.netfilter.org
> Subject: help needed: clogged console
> 
> 
> Hello,
> 
> I have Linux RH 9.0 configured as filtering firewall, and getting a lot of
> (kernel, iptables) messages on active consoles.
> I have thought that putting in /etc/syslog.conf:
> 
> # *.kern /dev/console
> kern.* /var/log/kernel
> kern.* /dev/tty8
> 
> would free me from this, but it did not.
> How can I force kernel message to appear only in /var/log/kernel log and on
> tty8 only?
> 
> Best Regards
> I hope that somebody will be able to help me.
> When  I'm getting a lot of dropped packages it is not possible even to log.
> 
> Slawomir Orlowski

I've been really confused by this issue.  I am also running iptables on
RedHat 9.0.  /etc/syslog.conf shows nothing being logged to the
console.  Yet, ever since applying the netfilter patch-o-matic
tcp-window patch, all of its messages appear on my console.  The
netfilter mail lists say this is a misconfiguration of syslog but it
sure looks correctly configured to me.  No other iptables messages go to
the console - just the tcp-window messages. How do I stop them!!! Thanks
- John
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


