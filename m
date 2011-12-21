From: Andrew Beverley <andy@andybev.com>
Subject: RE: Is the current firewall model static?
Date: Wed, 21 Dec 2011 09:27:28 +0000
Message-ID: <1324459648.4269.83.camel@steve-pc>
References: <000301ccbef9$4a8dc180$dfa94480$@nl>
	 <1324375868.21032.1.camel@steve-pc>  <002201ccbfc1$7743d7f0$65cb87d0$@nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1324459646;
	bh=AhZySyMR5JiR8gGeTc5frsa8Zvux0L/endfeBH4biBA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=Kqygs1bF0hKYbaALvRhmbMRWCZaQE+FBd92BP/l0N0E5hgFkAZSR+yRxWi2tuZQXW
	 zR2frAcPNWWEs5Ao0jIxKHcEpVeSU5YvMh6lyQlv5gWfgkbo/UklhznEk2BbGYRSa4
	 ihIQApJyOvV4LPQb2Yw9mXU1H1VuQHK3nyTkRfYc=
In-Reply-To: <002201ccbfc1$7743d7f0$65cb87d0$@nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hansa <mythtv@logic-q.nl>
Cc: netfilter@vger.kernel.org

On Wed, 2011-12-21 at 10:18 +0100, Hansa wrote:
> > I think that what they mean is that the current *Fedora* firewall model
> > is static. It looks like firewalld still uses iptables, but is slightly
> > more intelligent as to how it processes changes to rules and so on.
> 
> I wasn't aware the firewall model is implemented differently across
>  different Linux flavors. I thought netfilter implements a packet
>  filtering framework into the Linux kernel. Shouldn't it work the work
>  the same on every Linux flavor?

Once the iptables binary has been called and the rules have been set,
then yes, it's the same across any flavour of Linux (I guess).

I meant that the distro's implementation of how the rules are managed is
different. There are loads of different ways. A quick search on a Ubuntu
system reveals the following. I'm guessing that all of these use
iptables, but some are better than others at changing rules "on the
fly".

ufw - program for managing a Netfilter firewall
apf-firewall - easy iptables based firewall system
dtc-xen-firewall - A small firewall script for your dom0
ebox-firewall - eBox - Firewall
ferm - maintain and setup complicated firewall rules
fiaif - An easy to use, yet complex firewall
filtergen - packet filter generator for various firewall systems
firehol - An easy to use but powerful iptables stateful firewall
firestarter - gtk program for managing and observing your firewall
guarddog - firewall configuration utility for KDE
ipkungfu - iptables-based Linux firewall
kmyfirewall - iptables based firewall configuration tool for KDE
mason - Interactively creates a Linux packet filtering firewall
pyroman - Very fast firewall configuration tool
uif - Advanced iptables-firewall script
uruk - Very small firewall script, for configuring iptables

>  I did the following test.
> 
> Ssh on port 22 into a Linux box with following filter rules
> # iptables -L -n --line-numbers
> Chain INPUT (policy ACCEPT)
> num  target     prot opt source               destination
> 1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
> 2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> 3    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22
> 4    REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited
> 
> Remove line 3, so new ssh connections are rejected. The current ssh session however should be working because of rule number 1.
> 
> # iptables -D INPUT 3
> # echo "yup it does"
> yup it does
> 
> Seems pretty much dynamic to me :)

With any of the above wrappers, you'll always be able to add and remove
rules directly using iptables commands.

Andy


