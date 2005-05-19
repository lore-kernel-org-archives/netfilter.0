From: Chadley Wilson <chadley@pinteq.co.za>
Subject: Re: Iptables
Date: Thu, 19 May 2005 22:13:26 +0200
Message-ID: <200505192213.27006.chadley@pinteq.co.za>
References: <200505191945.22293.chadley@pinteq.co.za>
	<20050519193348.GA8623@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050519193348.GA8623@bender.817west.com>
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

On Thursday 19 May 2005 21:33, Jason Opperisano wrote:

> > ########    Firewall Setup     ##################
> > ########      Config           ##################
> > #set -x
> > ipt="/usr/sbin/iptables"
> > ext="eth0"
> > int="bond0"
> > lo="127.0.0.1"
> > chad="192.168.2.5"
> > etel="196.25.100.28"
> > #################################################
> >
> > #################################################
> > ####                                         ####
> > ####               BASIC SETUP               ####
> > ####                                         ####
> > #################################################
> >
> > #Enable IP Forwarding
> > echo "1" >> /proc/sys/net/ipv4/ip_forward
> >
> > #Clear All Tables
> > ${ipt} -t filter -F
> > ${ipt} -t nat -F
>
> there's also a mangle table...

How would the mangle table work for me?
Well actually what does mangle do in english, I have read the man pages and 
some docs I found on google and tldp, but I don't quite grasp the idea.

>   iptables -t mangle -F
>
> > ##  Allow all from local interfaces [localhost]
> > ${ipt} -t filter -A INPUT -s ${lo} -j ACCEPT
> >
> >
> > ##  Allow all prerouting
> > ${ipt} -t nat -A PREROUTING -s 192.168.2.0/255.255.255.0 -j ACCEPT
> > ${ipt} -t nat -A PREROUTING -s 196.25.100.5/255.255.255.0 -j ACCEPT
>
> um--what exactly are you trying to accomplish with these?
I think it had some thing to do with setting the default policy to drop! and 
having no access to any services, I never really worked out if this was the 
cause.

>
> > ##  Allow all forwarding
> > ${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -m state --state
> > RELATED,ESTABLISHED -j ACCEPT ${ipt} -t filter -A FORWARD -i ${ext} -o
> > ${int} -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> how about just:
Cool, it take it this achieves the same goal?

>   iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> > ##  Allow pings
> > ${ipt} -t filter -A INPUT -p icmp -j ACCEPT
> >
> > ##  Keep established connections on all interfaces
> > ${ipt} -t filter -A FORWARD -m state --state RELATED,ESTABLISHED -j
> > ACCEPT
>
> we just did this above...

> > ${ipt} -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> >
> > ##  Accept www from internet {ext}
> > ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 80 -j ACCEPT
>
> you run a web server on your firewall?

Uh no I ctually run an FTP server, I thought I needed to open port 80 to 
access the internet. (as I said before I am a newbie, still wet behind the 
ears :) )

> > #################################################
> > ####                                         ####
> > ####                RULES                    ####
> > ####                                         ####
> > #################################################
> >
> > ##  Masquerade {chad} outgoing to internet
> > ${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -j MASQUERADE
> > ${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -s ${chad} -j ACCEPT
> >
> > ##  Accept SSH from {etel}
> > ${ipt} -t filter -A INPUT -i ${ext} -s ${etel} -p tcp --dport 22 -j
> > ACCEPT
> >
> > ##  Accept ssh from all internal
> > ${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 22 -j ACCEPT
> >
> > ## Accept telnet
> > ${ipt} -t filter -A INPUT -p tcp --dport 23 -j ACCEPT
> > ${ipt} -t filter -A INPUT -p udp --dport 23 -j ACCEPT
>
> 1) telnet only uses TCP, not UDP.
> 2) telnet?  c'mon, what is this?  1997?
>
Our SCO-Unix box has not got ssh and it is linked nationwide to 500 dial-up  
and dial-in sites all of which were setup in "1997" :} by someone else. So we 
have to be able to telnet in and out of it. Offen I have files on my server, 
which I need to access from a remote site via the SCO box using telnet. :( 

> > ##  Accept incoming SMTP
> > ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 25 -j ACCEPT
> >
> > ##  Accept external POP3
> > ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 110 -j ACCEPT
>
> you run SMTP and POP3 servers on your firewall too?  i'm sensing a
> pattern here...
No but I need to able to receive mail from my mail box on the ${ext} 
interface!
I take it this is wrong hey! 

>
> > ##  Allow mail from ext to int
> > ${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d
> > 196.25.100.21 -o ${ext} --sport 25 --state NEW,ESTABLISHED,RELATED -j
> > ACCEPT ${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d
> > 196.25.100.21 -o ${ext} --sport 110 --state NEW,ESTABLISHED,RELATED -j
> > ACCEPT
>
> um--we've already ACCEPTed all ESTABLISHED,RELATED packets in
> FORWARD--so it's redundant to keep using them in rules.  so we need to
> create rules that allow packets that are NEW.  if you're trying to allow
> $chad to connect to 196.25.100.21 on SMTP and POP3--those should be
> dport, not sport:
>
OK! I see the logic.
This is a new trick for me, Thanks
I haven't read about -d <ip_addr> before!
>   iptables -A FORWARD -i $int -o $ext -p tcp -s $chad \
>     -d 196.25.100.21 --dport 25 -j ACCEPT
>
>   iptables -A FORWARD -i $int -o $ext -p tcp -s $chad \
>     -d 196.25.100.21 --dport 110 -j ACCEPT
>
> from the text of you message, you want to allow $chad out on any
> service, though--right?  then how about:
>

>   iptables -A FORWARD -i $int -o $ext -p tcp -s $chad -j ACCEPT
>
> (which you already have in here if we scroll back up a bit)
>
> > ##  Allow DNS updates
> > ${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 53 -j ACCEPT
> > ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 53 -j ACCEPT
>
> the DNS server runs on the firewall too, eh?  how's about:
>
Yes the firewall is a DNS and DHCP server too. (I only have linux PC so I make 
it work). 
Current with the default policy accept on the 196.25.100.0 network we can 
resolve the ftp url i.e ftp://ns.teq/
if I take out the ${ext} rule it doen't work.

>   iptables -A INPUT -p tcp --dport 53 -j ACCEPT
>   iptables -A INPUT -p udp --dport 53 -j ACCEPT

> (you need TCP for zone transfers, and UDP for regular name resolution
> requests)
OK, 
>
> > ## Accept all from local interfaces
> > ${ipt} -t filter -A INPUT -i ${int} -j ACCEPT
> > ${ipt} -t filter -A INPUT -i ${int} -j ACCEPT
>
> a rule so nice, we need it twice?
>
Oops thats a mistake :)

> > ## Drop all the rest, incoming , and forward between interfaces
> > #${ipt} -t filter -A INPUT -j DROP
> > #${ipt} -t filter -A FORWARD -j DROP
>
> -j
>
Thanks Jason,

I have learn't quite a bit from this, I shall save this mail for future use. 
By the way, this is my first attempt at my own firewall, mostly an effort to 
learn and understand. I always used the Redhat default or Susefirewall2. But 
am not confident that they do the job right, also I never really understood 
how to customise them. Hence build your own, Ha hA, not s easy when you 
haven't got the knowledge, but I am sure I will get there.

Thanks again,


-- 
Chadley Wilson
Redhat Certified Technician 
Cert Number: 603004708291270
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================


