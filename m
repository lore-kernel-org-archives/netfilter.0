From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Subject: Re: Re: iptables problem with rules
Date: 28 Jun 2002 21:30:38 -0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628213038.11959.qmail@webmail30.rediffmail.com>
Reply-To: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

hai anthony,
  i am currently trying to limit the # of incomming packets.

in my current setup i configured a linux router where i am running 
iptables. i want to limit the # of packets comming in and also 
being forwarded. the rules must be specified for both input and 
forward chain. i am currently testing them for the input chain.

please tell me if u need further more information.

Thanks
ganesh

On Fri, 28 Jun 2002 Antony Stone wrote :
>On Friday 28 June 2002 7:04 pm, ganesh kumar godavari wrote:
>
> > hello group,
>
> >   i want to limit
> >   the # of packets based on the type of protocol used
> >
> >   i have used iptables rules like
> >
> > #Syn-flood protection:
> >   iptables -A FORWARD -s a.b.c.d -p tcp --syn -m
> >   limit --limit 1/s -j ACCEPT
> >
> > the rule doesn't help to stop the packets
> >
> > i tried the following rule it helps me to stop the ping 
>flood
> > attack
> >
> >   iptables -A INPUT  -s 128.198.60.195 -p icmp
> >   --icmp-type echo-request -m limit --limit 1/s -j
> >   ACCEPT
> >   iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
>
>I am confused about whether you are trying to stop packets coming 
>in to the
>machine running netfilter (ie you are putting the rules in the 
>INPUT chain)
>or whether you are trying to stop packets going through the 
>netfilter machine
>to another host (ie you are putting the rules in the FORWARD 
>chain).
>
>Please can you clarify your network setup ?
>
>
>
>Antony.
>

_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/


