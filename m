From: rruegner <robowarp@gmx.de>
Subject: Re: What to do to protet our send from the attacks which is caused
 by	worms?
Date: Fri, 17 Sep 2004 22:55:35 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <414B4F47.20805@gmx.de>
References: <BAY12-F11jlA733LJa500009c09@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY12-F11jlA733LJa500009c09@hotmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Red Hat <lilo123456@hotmail.com>
Cc: netfilter@lists.netfilter.org

Hi, you can use dansguardian with antivirus plugin for http, and amavis 
new for smtp, and frox for ftp, use clamd as free antivirus scanner
so you have a complete antivirus solution,
alternative for http use apache in proxy mode with mod_vir ( dont know 
exactly how the name was ) coupled wtih squid and squidguard.
Do a conservative firewall for the the rest of the ports with iptables.
You can use some comercial linux distros like astaro or gibraltar with 
all packed  in , or ipcop with serveral plugins.
After all you need a daily update of win machines and comercial antivir 
on it like antivir , and a susserver in your lokal network for security 
updates, check your users not to act as lokal or domain admins
and advice them not to use outlook (express) or internet explorer,
install thunderbird and firefox and set them as default in windows,
install spybot on all machines.
Snort on the firewall will help you find out what attacks are going on
So you have a working pack which gives you relativ sercurity as long
your staying up to date , with all signatures of viri.
Set acls on your switches and check only mac adresses you know on them.
dont use buggy win xp firewall, check out ie. kerio firewall for windows.
Security is a concept ,not one software or os
Regards

Red Hat schrieb:
> Hi,
> 
> What to do to protet our send from the attacks which is caused by worms in
> Microsoft XP OS of our users? Our user may have worms in their system & it
> causes that our send go up & up that our send is going upper than which we
> have to use. for example if we can send 64Kb/s their worm cause our send go
> upper than this. These worms would cause our network work too bad. I mean
> the other user which doesn't have worm, can't work properly.
> Hope you understand our problem. Now I want to use a software or command in
> my Linux server which contain squid to protect our send not to go up 
> because
>  of the worm of our users.
> I think we can protect it by iptables but I don't know how should I do 
> this?
> So wanted to intall smoothwall to help me. Now I understand that it can't
> help me.
> what's you opinion & how should I do that?
> 
> Thanks in advance.
> 
> Best Regards,
> Mehdi
> 
> _________________________________________________________________
> Tired of spam? Get advanced junk mail protection with MSN 8. 
> http://join.msn.com/?page=features/junkmail
> 
> 

