From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging Portscans
Date: Tue, 22 Oct 2002 11:14:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210221014.g9MAErL00581@vulcan.rissington.net>
References: <20021021233312.512.qmail@web40701.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021021233312.512.qmail@web40701.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Tuesday 22 October 2002 12:33 am, Tasha Smith wrote:

> Here is what the nmap scan i used   "namp -sS -sT -P0 -v 152.22.xx.xx"

I don't understand the use of -sS and -sT at the same time.

-sS is for a SYN scan - nmap sends out a SYN packet, looks to see if a 
SYN/ACK comes back, but doesn't send anything back after that.

-sT is a connect() scan - nmap sends out a SYN as before, but if it gets a 
SYN/ACK back again, it replies with an ACK so that a full connection is 
established with the remote end.

Unless you don't have root access on the machine you're running nmap from, I 
don't see why you'd normally want to use the connect() type of scan, but in 
any case I think it's inappropriate to use both -sS and -sT in the same nmap 
command.

> > > I even added this to my syslog.conf file......
> > >
> > >  kern.warn                            /var/log/fwlog
> >
> > Does this successfully log anything at all ?  I mean, if you insert a rule
> > right at the start of your INPUT chain:
> > iptables -I INPUT -j LOG --log-prefix "fwlog: "
> >
> > Does anything go into /var/log/fwlog ?
>
> Yes, somehting does go into the "/var/log/fwlog" file. (All kernel
> messages goes into this file like:
> OCT 21 01:4443 HOSTNAME   kernel : Linux version 2.4.19
> (root@hostname.bc.hisa.telus.net) gcc version 2.96)

No, I actually meant "does anything from netfilter get logged into 
/var/log/fwlog ?" - however you have answered this below and it seems that 
the logging is working correctly.

> iptables -I INPUT -j LOG --log-prefix "fwlog: "
>
> When this line is added to my script and i run the nmap scan from a
> computer with an ip address of 152.22.xx.xxx  the only things that get log
> in the fwlog file are:
> OCT 21 01:4453 HOSTNAME   kernel : fwlog: IN eth1 OUT= MAC=
> ff:ff:ff:ff:00:43:xx:xx:xx src=192.168.0.11 DST=192.168.0.255 LEN=78
> TOS=0x00 PREC=0x00 TTL=128 ID 63894 PROTO=UDP SPT=137 DPT=137 LEN=58

Okay, so you are getting log entries from *a* logging rule, just not from the 
one you're trying to detect the scan from...

(By the way, there's no need to disguise mac addresses when you post your 
logfile entries - nobody outside your local network can do anything useful 
with a mac address, and anybody inside your local network can find it out for 
themselves anyway.)

> But nothing from the computers ip addressd that i did the port scan
> with only tarffic that is getting logged is my machine behind the firewall
> and the firewall machines eth1.

> > By the way, what result do you get from the scan ?   Does it suggest you
> > have closed ports, open ones, nothing accessible, what ?
> The relsut i get is: All 1601 scanned ports on "firewall machine" are
> filtered."

Hmmm.   Is this true ?   Or should someof your ports be accessible from the 
machine you're scanning from ?   (eg SSH, SMTP...?)

> > What happens if you simply ssh to the Firewall, or telnet to port 25 ?
> > Do you see a log entry then ?

> No, i dont!

Okay, let's step back a bit a see if we can successfully log things which are 
connecting, and then try to log things which are being blocked.

Try adding the following to the start of your INPUT chain:

iptables -I INPUT -s a.b.c.d -p tcp --dport 22 -j ACCEPT
iptables -I INPUT -p tcp --dport 22 -j LOG --log-prefix="ssh "

(Entering them in that order should insert the "accept ssh" rule, and then 
insert the "log ssh"rule in front of it.)

a.b.c.d is any machine outside your firewall (eg the one you've been scanning 
from with nmap) from which you can ssh back into your firewall.

If for some reason you don't happen to have sshd running on your firewall 
simply change the port number to any other service you can connect to (80 ? 
110 ? 25 ? 23 ?) in order to test things.

Then from the remote machine a.b.c.d connect to your firewall and make sure 
you have a valid connection (eg yoou do successfully log in by ssh, or 
whatever), and then see what comes up in your log file.

Antony.

-- 

I vote "no" to this proposal to form a committee to investigate whether we 
should or should not hold a ballot on whether to vote yet.

