From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I need help , please
Date: Thu, 4 Jul 2002 19:20:38 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704182042.XIE16050.mta01-svc.ntlworld.com@there>
References: <001e01c22321$e86018a0$2400a8c0@inq7.net> <200207041453.g64ErIU32086@vulcan.rissington.net> <00fc01c22352$6a2168a0$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00fc01c22352$6a2168a0$8703000a@aid.inf.cu>
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

On Thursday 04 July 2002 1:00 pm, david wrote:

> I amtrying to set a dns and proxy server

I assume this means you want to run DNS and an http proxy such as squid on 
the machine running the Firewall.   If this is not correct, post again and 
tell us what iptables rules you are trying to set up (which is what I was 
trying to ask).

Anyway, if that is the correct assumption, how about a set of rules such as 
this ?

# Standard default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
# Allow in DNS requests
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
# Allow out DNS requests
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
# Redirect http requests to local proxy
iptables -A PREROUTING -t nat -p tcp --dport 80 -j DNAT 127.0.0.1:80
# Allow proxy requests out of machine
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
# Allow replies etc back in again
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

 

Antony.

> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.samba.org>
> Sent: Thursday, July 04, 2002 4:53 PM
> Subject: Re: I need help , please
>
> > On Thursday 04 July 2002 9:38 am, david wrote:
> > > It was a mistake.What I do is
> > >
> > > # service iptables save
> > > after that  I got a new file in /etc/sysconfig/iptables .
> > > and then :
> > > #/etc/rc.d/init.d/iptables restart 2>salida8
> > > .And here you see all the errors.
> >
> > What rules are you trying to set ?
> >
> > Have you compiled all the required bits of iptables into the kernel or
> > are you loading modules ?
> >
> >
> >
> > Antony.

