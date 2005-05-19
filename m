From: Jason Opperisano <opie@817west.com>
Subject: Re: Iptables
Date: Thu, 19 May 2005 15:33:48 -0400
Message-ID: <20050519193348.GA8623@bender.817west.com>
References: <200505191945.22293.chadley@pinteq.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200505191945.22293.chadley@pinteq.co.za>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, May 19, 2005 at 07:45:22PM +0200, Chadley Wilson wrote:
> Greetings,
> 
> Sort of still a newbie with iptables! I ve been at it for a while, but 
> struggle to understand when things don't work when I think they are right.
> 
> OK heres the problem:
> 
> I have a dns server configure, master zone int network, slave is external dns 
> box.
> 
> Dhcp server only internal.
> 
> Iptables must do the following:
> allow one int ip (me) to the external int face for everything. (the external 
> interface is actually our other internal network which has the gateway to the 
> internet)
> 
> when I set my default policy to drop, my DNS and windows file sharing from the 
> ext network doesn't work. My mail and internet still work. I have removed the 
> broken lines and set my policy back to ACCEPT. But I would feel much safer if 
> it were drop and only allow services that I choose. As it is now, I can 
> access the net, mail and windows file shares, the dns for the FTP server is 
> working and all is bliss.
> How do I make this more secure?
> 
> etel is our gateway
> my router has 6 cards in it. 5 are bond0 1 eth0 int and ext respectively.  
> 
> Attached is my iptables file, 
> 
> Please could some one show me what is wrong I can't figure it out.

> ########    Firewall Setup     ##################
> ########      Config           ##################
> #set -x
> ipt="/usr/sbin/iptables"
> ext="eth0"
> int="bond0"
> lo="127.0.0.1"
> chad="192.168.2.5"
> etel="196.25.100.28"
> #################################################
> 
> #################################################
> ####                                         ####
> ####               BASIC SETUP               ####
> ####                                         ####
> #################################################
> 
> #Enable IP Forwarding
> echo "1" >> /proc/sys/net/ipv4/ip_forward
> 
> #Clear All Tables
> ${ipt} -t filter -F
> ${ipt} -t nat -F

there's also a mangle table...

  iptables -t mangle -F

> ##  Allow all from local interfaces [localhost]
> ${ipt} -t filter -A INPUT -s ${lo} -j ACCEPT
> 
> 
> ##  Allow all prerouting
> ${ipt} -t nat -A PREROUTING -s 192.168.2.0/255.255.255.0 -j ACCEPT
> ${ipt} -t nat -A PREROUTING -s 196.25.100.5/255.255.255.0 -j ACCEPT

um--what exactly are you trying to accomplish with these?

> ##  Allow all forwarding
> ${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -m state --state RELATED,ESTABLISHED -j ACCEPT
> ${ipt} -t filter -A FORWARD -i ${ext} -o ${int} -m state --state RELATED,ESTABLISHED -j ACCEPT

how about just:

  iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

> ##  Allow pings 
> ${ipt} -t filter -A INPUT -p icmp -j ACCEPT
> 
> ##  Keep established connections on all interfaces
> ${ipt} -t filter -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

we just did this above...

> ${ipt} -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> ##  Accept www from internet {ext}
> ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 80 -j ACCEPT

you run a web server on your firewall?

> #################################################
> ####                                         ####
> ####                RULES                    ####
> ####                                         ####
> #################################################
> 
> ##  Masquerade {chad} outgoing to internet
> ${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -j MASQUERADE
> ${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -s ${chad} -j ACCEPT
> 
> ##  Accept SSH from {etel}
> ${ipt} -t filter -A INPUT -i ${ext} -s ${etel} -p tcp --dport 22 -j ACCEPT
> 
> ##  Accept ssh from all internal
> ${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 22 -j ACCEPT
> 
> ## Accept telnet
> ${ipt} -t filter -A INPUT -p tcp --dport 23 -j ACCEPT
> ${ipt} -t filter -A INPUT -p udp --dport 23 -j ACCEPT

1) telnet only uses TCP, not UDP.
2) telnet?  c'mon, what is this?  1997?

> ##  Accept incoming SMTP
> ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 25 -j ACCEPT
> 
> ##  Accept external POP3
> ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 110 -j ACCEPT

you run SMTP and POP3 servers on your firewall too?  i'm sensing a
pattern here...

> ##  Allow mail from ext to int
> ${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d 196.25.100.21 -o ${ext} --sport 25 --state NEW,ESTABLISHED,RELATED -j ACCEPT
> ${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d 196.25.100.21 -o ${ext} --sport 110 --state NEW,ESTABLISHED,RELATED -j ACCEPT

um--we've already ACCEPTed all ESTABLISHED,RELATED packets in
FORWARD--so it's redundant to keep using them in rules.  so we need to
create rules that allow packets that are NEW.  if you're trying to allow
$chad to connect to 196.25.100.21 on SMTP and POP3--those should be
dport, not sport:

  iptables -A FORWARD -i $int -o $ext -p tcp -s $chad \
    -d 196.25.100.21 --dport 25 -j ACCEPT

  iptables -A FORWARD -i $int -o $ext -p tcp -s $chad \
    -d 196.25.100.21 --dport 110 -j ACCEPT

from the text of you message, you want to allow $chad out on any
service, though--right?  then how about:

  iptables -A FORWARD -i $int -o $ext -p tcp -s $chad -j ACCEPT

(which you already have in here if we scroll back up a bit)

> ##  Allow DNS updates
> ${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 53 -j ACCEPT
> ${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 53 -j ACCEPT

the DNS server runs on the firewall too, eh?  how's about:

  iptables -A INPUT -p tcp --dport 53 -j ACCEPT
  iptables -A INPUT -p udp --dport 53 -j ACCEPT

(you need TCP for zone transfers, and UDP for regular name resolution
requests)

> ## Accept all from local interfaces
> ${ipt} -t filter -A INPUT -i ${int} -j ACCEPT
> ${ipt} -t filter -A INPUT -i ${int} -j ACCEPT

a rule so nice, we need it twice?

> ## Drop all the rest, incoming , and forward between interfaces
> #${ipt} -t filter -A INPUT -j DROP
> #${ipt} -t filter -A FORWARD -j DROP

-j

--
"Peter: Hey, Brian. If cops are pigs, does that make you a Snausage?
 Brian: Clever, Peter. Did you stay up all night writing that?
 Peter: No, I got to bed around two, two-thirty."
        --Family Guy

