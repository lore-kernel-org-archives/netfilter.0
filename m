From: Payal <rpayal@indiainfo.com>
Subject: Re: Help with POP3/SMTP and MASQ
Date: Tue, 11 Jun 2002 19:24:41 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <ae4vrl$2a2$2@main.gmane.org>
References: <F21XZZTHfyQgeDKvPEk0000a6ad@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F21XZZTHfyQgeDKvPEk0000a6ad@hotmail.com>
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

Hi,
I am very very new to iptables. But I think smtp and pop should be left t=
o=20
mail server + tcpd [i.e hosts.allow and hosts.deny].
-Payal
On Tuesday 11 June 2002 03:07 am, you wrote:
> Hello...
> I've had had no luck getting POP3/SMTP going through my RedHat 7.1 2.4
> kernel iptables box.  I have been able to setup incoming FTP connection=
s
> through my firewall, but no luck on the email.  Here's my script...I've
> pretty much added alot of extra stuff hoping that something would work =
and
> I could figure it out from there, but so far nothings worked.  I must b=
e
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
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 21 -j AC=
CEPT
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.7 --dport 20 -j AC=
CEPT
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
> Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.=
asp.

