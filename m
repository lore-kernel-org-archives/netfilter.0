From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this firewall good enough?
Date: Tue, 8 Jun 2004 10:55:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406081055.55531.Antony@Soft-Solutions.co.uk>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
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

On Tuesday 08 June 2004 10:14 am, Sagara Wijetunga wrote:

> Hi all
>
> I have set up my first firewall using iptables. I want
> to check with more experienced users of iptables
> whether my firewall is good enough to protect the
> server.
>
> My server expressly offer following services only:
> 1.  FTP server
> 2.  SSH server
> 3.  SMTP server
> 4.  DNS server
> 5.  HTTP server
> 6.  POP3 server
> 7.  IMAP server
> 8.  HTTPS server
> 9.  SMTP over SSL
> 10. IMAP over SSL
> 11. POP3 over SSL

Are all these services being offered to *any* IP address, or do you want to 
offer some things to internal users and some things to external users 
perhaps?

> I have set up the firewall with following rules:
>
> 1.  /sbin/iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1
> -j ACCEPT
> 2.  /sbin/iptables -A INPUT -p tcp -m state --state
> ESTABLISHED,RELATED -j ACCEPT

Don't restrict this just to TCP.   You need UDP as well, and ICMP will be 
important.

> 3.  /sbin/iptables -A INPUT -p tcp --dport 20  --syn
> -j ACCEPT	#ftp-data

No need for this rule given the above ESTABLISHED,RELATED rule - ftp data is 
considered RELATED to ftp-control

> 4.  /sbin/iptables -A INPUT -p tcp --dport 21  --syn
> -j ACCEPT	#ftp
> 5.  /sbin/iptables -A INPUT -p tcp --dport 22  --syn
> -j ACCEPT	#ssh
> 6.  /sbin/iptables -A INPUT -p tcp --dport 25  --syn
> -j ACCEPT	#smtp
> 7.  /sbin/iptables -A INPUT -p tcp --dport 53  --syn
> -j ACCEPT	#DNS

You need to allow UDP port 53 for DNS as well as TCP port 53

> 8.  /sbin/iptables -A INPUT -p tcp --dport 80  --syn
> -j ACCEPT	#http
> 9.  /sbin/iptables -A INPUT -p tcp --dport 110 --syn
> -j ACCEPT	#POP3
> 10. /sbin/iptables -A INPUT -p tcp --dport 143 --syn
> -j ACCEPT	#IMAP
> 11. /sbin/iptables -A INPUT -p tcp --dport 443 --syn
> -j ACCEPT	#https
> 12. /sbin/iptables -A INPUT -p tcp --dport 465 --syn
> -j ACCEPT	#smtp over SSL
> 13. /sbin/iptables -A INPUT -p tcp --dport 993 --syn
> -j ACCEPT	#IMAP over SSL
> 14. /sbin/iptables -A INPUT -p tcp --dport 995 --syn
> -j ACCEPT	#POP3 over SSL
> 15. /sbin/iptables -P INPUT DROP
> 16. /sbin/iptables -P FORWARD DROP
> 17. /sbin/iptables -P OUTPUT ACCEPT
>
> Ofcourse, the comment style #string is not included in
> the real rule.
>
> I have following queries regarding the above firewall:
>
> 1. Does this effectively offer connections ONLY to the
> services I offer and nothing more than that?

I would say yes.

> 2. Does the rule 2 create any security loophole?

Depends on the applications running on the machine and what outbound 
connections they open - for example, if someone can start netcat on the 
machine, OUTPUT is completely open, and Rule 2 will allow replies; you then 
have an open link to some system on the outside world.   However, if you 
don't trust the applications (or users) on your server, then a firewall is 
not your solution.

> 3. This firewall allows passive as well as non-passive
> FTP connections. Is passive FTP connections   a
> security threat?

Not with a stateful firewall, no.   Passive FTP is no less secure than active 
FTP.

> 4. Is this firewall good enough to protect the server?

Look good enough to me.   Of course, you haven't said how valuable the data on 
the server is, how attractive a target it might be, etc (a server run by GCHQ 
or the NSA is more likely to get challenged than a server run by Joe Brown's 
Motor Trading Company).

> If no, could you kindly comment how could I improve
> further?

You might want to add a LOGging rule at the end of the INPUT chain, just to 
get an idea of what stuff you're blocking - it's a way of finding out how 
good a job the firewall is doing for you.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


