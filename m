From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: RE: Is this config OK, plus where should I be logging...
Date: Mon, 5 Apr 2004 07:46:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c41ad1$692d25b0$0464a8c0@stu>
References: <200404042007.23099.Antony@Soft-Solutions.co.uk>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404042007.23099.Antony@Soft-Solutions.co.uk>
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

Thanks for your reply, it has me thinking here.

I agree, running local services on a firewall is asking for it,
especially with SMTP.
I think what I need to do is add a third network card to the firewall
and create a DMZ, probably safer than dnat-ing to these services on the
LAN, such as SMTP server on the LAN.
That will add some extra rules to the firewall, but at least now it will
be a pure netfilter machine ;-)
I will probably just open UDP 53,TCP 80 and FTP for the purposes of
connecting to the net and running updates from the firewall itself.
I may also want ssh, so I can admin from the internet, but then I could
always ssh to the DMZ and then ssh from there to the firewall, probably
safer.

Just a few questions on your reply below?
On the "-t nat" table , PREROUTING, OUTPUT and POSTROUTING is -P ACCEPT.
Good or bad, should I drop here and add the rules as I need them?

Also, I currently have an eth0 which is the Un-trusted interface
connecting to my DSL modem.
I have eth1 which is my trusted LAN and ppp0, which is the virtual
interface that comes up when the DSL line is up, pritty much 24/7.
However, I base my rules on ppp0 as the un-trusted interface and not
eth0, in fact in a previous email, you asked where is eth0? What should
I do here?

What is the very first table that a packet will "touch" as it comes into
the firewall? PREROUTING or INPUT?
I believe it will be PREROUTING, as a packet may be destined for another
machine on the network, dnat...
So, should this table be not be the most "looked after" as so to speak,
followed by the FORWARD table?
Especially if we have a DMZ, where we are PREROUTING most services to
that interface, and almost nothing will be for INPUT as no services will
be running on the firewall itself, except for ssh????

Thanks
For your time, it is truly appreciated.



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Sunday, April 04, 2004 9:07 PM
To: netfilter@lists.netfilter.org
Subject: Re: Is this config OK, plus where should I be logging...


On Sunday 04 April 2004 7:41 pm, Stuart Lamble wrote:

> Hi
>
> Ok, here is an update...
> I have added the results of iptables-save as is, without hacking 
> anything off. ;-) I have the firewall box that is running the 
> following... mail server on port 25
> ssh server on port 22
> webmin running port 10000 over SSL 443
> web server on port 80

So, this thing is not a firewall, it's a general purpose server which
happens 
to run some netfilter rules :)

(Yes, I disapprove of firewalls running network services... :)

By the way, what do you mean by "webmin running port 10000 over SSL
443"?

Is this thing listening on port 10000, or port 443?   Set up one rule to
allow 
whichever type of packets you need, and remove the other rule.

> DNAT to another lan server running oracle web services on port 7783 = 
> 7783 (from the web) DNAT to another lan server running ssh services on

> port 22 = 555 (from the web)
>
> My internal 192.168.100.0/255.255.255.0 is masqueraded for internet 
> browsing and prity much everything else. The firewall itself needs to 
> do DNS lookups, browse the net and send SMTP traffic.
>
> All that I require, stated above is working.

Okay, good.

> I want to know if the config is secure, where are the holes, what are 
> the best practices.

Best practice item 1: don't run network services on your firewall :)

As I said in my earlier reply, I can't see why you have bothered to put
OUTPUT 
ACCEPT rules in place, when you then put a default ACCEPT policy on the 
OUTPUT chain (and you have no DROP rules).   Absolutely everything is
allowed 
out of this box, so why not make it obvious that that is the case,
instead of 
making someone (perhaps you, in six months' time) think that the ACCEPT
rules 
are there for a purpose and anything not specified will not be allowed?

Also, whilst we're talking about those rules, why have you used
multiport, and 
then specified only a single port in each rule?

The simpler your rules are, the easier they are to understand.

The more compilcated you make them, the easier it is to make mistakes.

> Also, I want to log suspicious behaviour, port scans, what gets 
> dropped etc. I am stuck with that ;-(

Put your LOGging rules at the end of FORWARD and INPUT, just before the 
default DROP policy takes effect.   At first you may as well just log 
everything with a simple rule "iptables -A INPUT -j LOG", and then once
you 
get bored of seeing loads of packets addressed to port 135 on your
firewall, 
you can DROP those before the LOG rule and start to narrow down what you
log 
to only the stuff you find interesting.

> # Generated by iptables-save v1.2.7a on Sun Apr  4 22:25:58 2004 
> *filter
>
> :INPUT DROP [0:0]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
>
> -A INPUT -i lo -j ACCEPT
> -A INPUT -i eth1 -j ACCEPT
> -A INPUT -p icmp -j ACCEPT
> -A INPUT -p tcp -m tcp --sport 25 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 25 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 443 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 10000 -j ACCEPT
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -s 192.168.100.0/255.255.255.0 -j ACCEPT

I still disapprove of the above rule.   It will allow packets from the 
Internet which have a source address matching your internal network to
get 
through the firewall.   You should tighten it by adding the source
interface 
eth1 as well:

iptables -A FORWARD -s 192.168.100.0/24 -i eth1 -j ACCEPT

> -A FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 22 -j ACCEPT -A 
> FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 7783 -j ACCEPT -A 
> OUTPUT -s 127.0.0.1 -j ACCEPT -A OUTPUT -o eth1 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --sport 80 -j ACCEPT

You still have INPUT rules for ports 80 and 443, but a OUTPUT rule only
for 
port 80 (as well as a default ACCEPT policy which will allow the 443
packets 
as well as any others).   This inconsistency doesn't look good.

> -A OUTPUT -p tcp -m tcp --sport 25 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --sport 22 -j ACCEPT
> -A OUTPUT -o ppp0 -p udp -m udp -m multiport --ports domain -j ACCEPT 
> -A OUTPUT -o ppp0 -p tcp -m tcp -m multiport --ports http -j ACCEPT -A

> OUTPUT -o ppp0 -p tcp -m tcp -m multiport --ports smtp -j ACCEPT -A 
> OUTPUT -o ppp0 -p tcp -m tcp -m multiport --ports ndmp -j ACCEPT 
> COMMIT # Completed on Sun Apr  4 22:25:58 2004

Personally I would prefer to see:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT ......... -j ACCEPT
  .... for each type of traffic you want to allow in to the "firewall"
iptables -A OUTPUT ........ -j ACCEPT
  .... for each type of traffic you want to allow out
iptables -A FORWARD ........ -j ACCEPT
  .... for each type of traffic you want to allow through.

By using the ESTABLISHED,RELATED rules more effectively, you can focus
only on 
the destination ports in all three chains, and not need to have matching

rules in INPUT and OUTPUT, with source ports in one and destination
ports in 
the other, as you have done.

Hope this helps,

Regards,

Antony.

-- 
One good tern deserves another.

                                                     Please reply to the
list;
                                                           please don't
CC me.



---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.650 / Virus Database: 416 - Release Date: 4/4/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.650 / Virus Database: 416 - Release Date: 4/4/2004
 


