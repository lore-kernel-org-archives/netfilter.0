From: "M. Ahmad Ijaz" <ahmad@netlogicbroadband.com>
Subject: Re: newbie question
Date: Fri, 9 Apr 2004 09:33:33 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002601c41deb$d10544c0$aa47aacb@hacker>
References: <004601c41d60$9bf1af70$aa47aacb@hacker> <20040408120948.GJ10272@home.manuelm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

thanks for ur reply n the 1st portion is solved, its now working

I typed all the commands on root and afterwards used

iptables-save

command to commit, but when i restarted the system and used this command

iptables -L

it shows no rules. So how to accomplish this. Also quite frankly i didnt get
it

> As a script somewhere in /etc/init.d/ and a symlink in
> /etc/rc.$defaultrunlevel/.


can you please tell me how to do it , as i m new to it.

Regards.
Aejaz



----- Original Message ----- 
From: "Frank Gruellich" <frank@home.manuelm.org>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, April 08, 2004 5:09 PM
Subject: Re: newbie question


> * M. Ahmad Ijaz <ahmad@netlogicbroadband.com>  8. Apr 04:
> > hi,
>
> Hello,
>
> > modprobe ip_tables
> > modprobe ip_conntrack
> > modprobe iptable_nat
> > modprobe ip_conntrack_ftp
> > modprobe ip_nat_ftp
> >
> > iptables -P INPUT ACCEPT
> > iptables -P OUTPUT ACCEPT
> > iptables -P FORWARD DROP
> > iptables -A INPUT -p icmp --icmp-type 8 -j DROP
> >
> > iptables -A PREROUTING -s xxx.xxx.xxx.xxx/yyy.yyy.yyy.yyy -p tcp -m
tcp --dport 80 -j REDIRECT --to-ports 8080
> >
> > where xxx is any IP and yyy is the subnet mask, it returns me the same
> > message i.e.  iptables: No chain/target/match by that name
>
> Try
>
> # iptables -t nat -A PREROUTING ...
>
> Rules go into the filter table by default, if not specified otherwise,
> but filter has not {PRE,POST}ROUTING.
>
> > also i dont wana load the modules and the commands each time the
> > system starts, so when i type the commands i used iptables-save
> > command to save tat, also is there ne possibility where i can store
> > the command and execute when system startsup
>
> As a script somewhere in /etc/init.d/ and a symlink in
> /etc/rc.$defaultrunlevel/.
>
> HTH,
>  regards, Frank.
> -- 
> Sigmentation fault
>


