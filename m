From: SBlaze <dagent.geo@yahoo.com>
Subject: RE: using iptables for poor-man's load balancing?
Date: Wed, 19 Feb 2003 19:39:37 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030220033937.44381.qmail@web40209.mail.yahoo.com>
References: <001b01c2d88c$385830c0$483918ac@C1006818>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c2d88c$385830c0$483918ac@C1006818>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I missed the begining of this thread...so ignore this and sorry if it doesn't
help

If you are using Linux this may be of some help

http://lartc.org/

It's a routing and traffic control Howto. Hope this helps

--- mpboden <mpboden@surfcity.net> wrote:
> i was recently reading the "Iptables Tutorial 1.1.16" by Oskar Andreasson,
> and i'm getting the impression that your rules might be written incorrectly.
> of course, i could be wrong, but if you check the following link,
> http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html, he
> specifically talks about load balancing. in essence, he specifies a range of
> ip addresses that the packets would randomly go to, and this is specified in
> only one "--to-destination" instead of two as you have it written. the
> following rule would send the packets randomly to any of the servers with
> ip's from 192.168.1.1. through 192.168.1.12.
> 
> iptables -t nat -A PREROUTING -p tcp -d 1.2.3.4 --dport 80 -j
> DNAT --to-destination 192.168.1.1-192.168.1.12
> 
> so perhaps a comma would work in your case if you specifically need to have
> the ip's as you have them. i've never tried this, but it seems to make sense
> to me.
> 
> iptables -t nat -A PREROUTING -p tcp -d 1.2.3.4 --dport 80 -j
> DNAT --to-destination 192.168.1.1,192.168.1.12
> 
> furthermore, he mentions adding two more specific rules in the nat table to
> allow hosts on the LAN as well as the firewall computer itself to access the
> servers properly. please check those out.
> 
> mike
> 
> 
> 
> > Message: 7
> > From: "Ian Douglas" <ian@icreditvision.com>
> > To: <netfilter@lists.netfilter.org>
> > Subject: RE: using iptables for poor-man's load balancing?
> > Date: Wed, 19 Feb 2003 15:17:48 -0800
> >
> > > Say for argument's sake that our public IP is 1.2.3.4 and our
> > > internal LAN machines are:
> > >   192.168.1.1
> > >   192.168.1.12
> >
> > (cut two of them out since they're not actually ready to run yet)
> >
> > > Just curious if the following rules would work to round-robin the
> connections:
> > >
> > > /sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 80  -j
> DNAT \
> > >    --to-destination 192.168.1.1:80 \
> > >    --to-destination 192.168.1.12:80
> > > /sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 433  -j
> DNAT \
> > >    --to-destination 192.168.1.1:80 \
> > >    --to-destination 192.168.1.12:80
> >
> > I tested this last night and it didn't work - every request went to 1.1
> >
> > Should I be using "--to 192.168.1.1:80" instead of "--to-destination
> > 192.168.1.1:80" ? I've seen documentation show the use of --to and a
> working
> > script for port forwarding that uses --to-destination
> >
> > As a followup:
> >
> > # uname -a
> > Linux icv.com 2.4.18-18.7.x #1 Wed Nov 13 20:29:30 EST 2002 i686 unknown
> >
> > # rpm -qa | grep iptables
> > iptables-1.2.5-3
> > iptables-ipv6-1.2.5-3
> >
> > # iptables -V
> > iptables v1.2.5
> >
> > Andrej (Tink) suggested I write the list again and ask what version of
> iptables
> > introduced 'multiple targets' for port forwarding.
> >
> 
> 


=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Shopping - Send Flowers for Valentine's Day
http://shopping.yahoo.com

