From: "Michael Hudin" <hudin@zoetrope.com>
Subject: Re: Help with POP3/SMTP and MASQ
Date: Mon, 10 Jun 2002 15:17:23 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <00ae01c210cc$9872ac20$52cfd3cf@michael>
References: <F21XZZTHfyQgeDKvPEk0000a6ad@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

The problem looks like it is in your forwarding rules.  You are telling it
to forward but you're not telling it from where to where, so you would need
something along the lines of -A FORWARD -i eth0 -o eth1 -p tcp -m
tcp --dport 110 -j ACCEPT if eth0 is your external and eth1 your internal.
You may need to invoke this slightly differently because I use the
iptables-save setup, not a script.

This should be a starting point.  There may be other things that aren't
working as well.

-michael

----- Original Message -----
From: "Linux Tek" <linuxtek2002@hotmail.com>
To: <netfilter@lists.samba.org>
Sent: Monday, June 10, 2002 2:37 PM
Subject: Help with POP3/SMTP and MASQ


> Hello...
> I've had had no luck getting POP3/SMTP going through my RedHat 7.1 2.4
> kernel iptables box.  I have been able to setup incoming FTP connections
> through my firewall, but no luck on the email.  Here's my script...I've
> pretty much added alot of extra stuff hoping that something would work and
I
> could figure it out from there, but so far nothings worked.  I must be
> missing something obvious!
>
> Any help is appreciated, and thanks to everyone who takes the time to
> respond!
>
>
> #Beginning of script
> #this was from someone's sample script..to load the modules.
>
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_mangle
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_state
>
> #
> # 2.2 Non-Required modules
> #
>
> #/sbin/modprobe ipt_owner
> #/sbin/modprobe ipt_REJECT
> #/sbin/modprobe ipt_MASQUERADE
> #/sbin/modprobe ip_conntrack_ftp
> #/sbin/modprobe ip_conntrack_irc
>
>
>
> #some basic MASQ stuff so I can hit the internet!
> cp /home/main/ip_forward /proc/sys/net/ipv4
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> #rules for ftp in...working right now
>
> iptables -A FORWARD -p tcp --dport 21 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 20 -j ACCEPT
>
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 21 -j DNAT --to
> 10.0.0.7:21
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 20 -j DNAT --to
> 10.0.0.7:20
>
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 21 -j
ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 20 -j
ACCEPT
>
> #rules for FTP out... NOT USED!!!!!!!!!
> #iptables -t nat -A POSTROUTING -p tcp --sport 21 -j ACCEPT
> #iptables -t nat -A POSTROUTING -p tcp --sport 20 -j ACCEPT
> #iptables -A INPUT -p tcp --sport 21 -j ACCEPT
> #iptables -A INPUT -p tcp --sport 20 -j ACCEPT
>
> #iptables -A OUTPUT -p tcp --sport 21 -j ACCEPT
> #iptables -A OUTPUT -p tcp --sport 20 -j ACCEPT
>
>
> #for POP3 and SMTP mail
> iptables -t nat -A POSTROUTING -p tcp -j MASQUERADE --to-ports 25
> iptables -t nat -A POSTROUTING -p tcp -j MASQUERADE --to-ports 110
>
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 25 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 110 -j ACCEPT
>
> iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 110 -j ACCEPT
>
> iptables -t nat -A POSTROUTING -p tcp --sport 25 -j ACCEPT
> iptables -t nat -A POSTROUTING -p tcp --sport 110 -j ACCEPT
>
> _________________________________________________________________
> Get your FREE download of MSN Explorer at
http://explorer.msn.com/intl.asp.
>
>
>
>


