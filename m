From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Subject: Re: Re: need help in rate limiting tcp-syn !!
Date: 29 Jun 2002 23:21:28 -0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020629232128.4703.qmail@webmail7.rediffmail.com>
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

hello anthony,
  can u please tell me how i can limit the # of packets from a  
tcp-syn flood and portscan from a particular ip(say a.b.c.d) from 
all kinds of attack if possible.


i badly need this i am currently performing some tests on DDOS and 
i need to figure this out. in a DDOS attack i want to limit the # 
of packets from a group of attack clients. i have to dynamically 
add the ip address and limit the # of packets from incomming 
attack clients.

can u please tell me how i can succefully protect my machine from 
a single attack client incase of 1) portscan and 2) tcp-syn 
flood.

Thanks for the help

---
ganesh






On Sun, 30 Jun 2002 Antony Stone wrote :
>On Saturday 29 June 2002 9:56 pm, ganesh kumar godavari wrote:
>
> >  hello group,
> >   i have attached my shell code to limit the  ping-icmp and
> > tcp-syn and tcp-portscan protection. i need some help in 
>this
> > matter.
> >
> > i am not able to limit the incoming tcp-syn packet and port 
>scan
> > packets done using nmap.
> >
> > i used nmap -sS -O -P0 -p1-15 <host name> for port scanning, 
>nmap
> > -sS -O -P0 <host name> for syn flooding.
>
> > $IPTABLES -N PORTSCANLIMIT
> > $IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST 
>RST
> > -m limit --limit $TCPSYNLIMIT --limit-burst $TCPSYNLIMITBURST 
>-j
> > ACCEPT
> > $IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST 
>RST
> > -j DROP
> > $IPTABLES -A PORTSCANLIMIT -j RETURN
>
>You're using -sS with nmap, which sends SYN packets, but your 
>portscanlimit
>rule is looking for packets with the RST flag set.
>
>The option "--tcp-flags SYN,ACK,FIN,RST RST" means "look at the 
>flags SYN,
>ACK, FIN and RST, and match if the RST flag (only) is set".
>
>If you want to match on only the SYN flag being set, then the 
>option should
>read "--tcp-flags SYN,ACK,FIN,RST SYN" (this will ignore the PSH 
>and URG
>flags).
>
>If you want to match on the SYN flag being set no matter what 
>other flags may
>be set as well, use "--tcp-flags SYN SYN".
>
>Remember that this is not the only way of doing a port scan with 
>nmap,
>however :-)
>
>
>
>Antony.
>

_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/


