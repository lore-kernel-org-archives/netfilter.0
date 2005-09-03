From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Having Issue with iptables on FC4 - can't get it working
	properly
Date: Sat, 3 Sep 2005 00:05:20 -0500
Message-ID: <200509030005.20751.rob0@gmx.co.uk>
References: <a5abf517050902110130101112@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a5abf517050902110130101112@mail.gmail.com>
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

On Friday 2005-September-02 13:01, Tim P wrote:
> Here is the firewall script I am attempting to use/modify to work
> The goal is to forward some services/port back to a system on the
> niternal network while allowing everyone on the internal network
> access to the internet.
>
> #
> #!/bin/sh

For a script of this nature the shabang line is not necessary, but 
anyway FYI, it is ignored if it's not the first line of the script.

> # Set default policies for packets going through this firewall box
> iptables -N PREROUTING
> iptables -N POSTROUTING

You just created those chains in your filter table.

> iptables -t nat -P PREROUTING DROP
> iptables -t nat -P POSTROUTING DROP

DROP policies in the nat table are not a good idea.

> iptables -P FORWARD DROP
>
> # Set default policies for packet entering this box
>
> iptables -P OUTPUT ALLOW
> iptables -P INPUT ALLOW

ALLOW is not a valid policy.

No further comment on the script, except to recommend that you read the 
Packet Filtering HOWTO. It tells you a better way to do this.

> When running this script as root (chmod 755 permisions) I get the
> following error:
> [root@gtds-vpnserver init.d]# ./masqfirewall.sh
> not found.le ip_conntrack_ftp

I smell a custom kernel here.

> iptables: Bad policy name

Some of these might be the ALLOW policies, but ...

> 'ptables v1.3.0: Invalid target name `DROP

This looks really bad. Your custom kernel must be missing important 
netfilter drivers.

> iptables v1.3.0: multiple -d flags not allowed

Right, every packet has only one destination, so you cannot match a 
packet with two destinations.

> : No such file or directory /proc/sys/net/ipv4/ip_forward
> : command not foundline 69:
>
> [root@gtds-vpnserver init.d]#
>
>
> These errors don't make sense as the modprobes work fine from the
> commandline

I think I know what's wrong.

> I have tried about four ready-made firewall scripts from
> http://www.linuxguruz.com/iptables/ just to see if it was something
> weird in my script and encounter very similar problems. Has anyone

And you edited and saved them using a Windows text editor, right?

> had any luck with this on Fedora Core 4 or is there something I am

There is nothing wrong with stock FC distributions. (The default 
firewall is junk, probably, but good firewalls are possible.)

> missing? The last time I made a firewall/router was when ipchains was
> the thing to use so I am not entirely unfamiliar with the process.

Your script must be in Unix text format. Open it in mc(1) using the 
built-in editor, and I bet you will see a bunch of ^M characters at 
line ends. Delete all those and it might work.

But really ... no ... don't. Use the Packet Filtering HOWTO method, 
which is much better than your script, and might help you begin to 
understand how it all works.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

