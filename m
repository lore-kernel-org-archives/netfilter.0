From: Marc Lucke <marc@marcsnet.com>
Subject: Re: netfilter digest, Vol 1 #1292 - 10 msgs
Date: 11 Nov 2003 09:25:34 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068503133.26846.12.camel@hohum.blue.net.au>
References: <20031110120106.4132.41732.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031110120106.4132.41732.Mailman@netfilter-sponsored-by.noris.net>
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

Antony - my thanks to you.  I rather suspected your answer would be
true.  My problem is that I am getting very large differences in the
usage I track using iptables and the usage that my ISP reports. 
iptables reports much more traffic - up to 12% in fact.  I have checked
with the ISP who say they too only count layer 3 IP.

Another question, then?  In my system, ip_forward=1 and I have
masquerading to allow a 192.168. subnet to access the net.  I then have
rules like

iptables -A FORWARD -i eth0 -o eth1 -d 192.168.x.y -j ACCEPT

where eth0 is the default gateway and eth1 is the LAN.

I have tested to ensure that even if a user on the 192.168. network
calls a resource listening on the public eth0 ip address that that usage
doesn't show up - why should it, after all - the traffic is not going in
to eth0!  So that all works as expected.

Just to be sure in terms of working out why I have such a large
discrepancy with my ISP, is there a way that the MASQ rule could be
having some sort of unwanted effect when examining the counters in the
FORWARD rule?  My thought is not.


Marc

On Mon, 2003-11-10 at 23:01, netfilter-request@lists.netfilter.org
wrote:
> Send netfilter mailing list submissions to
> 	netfilter@lists.netfilter.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> 	netfilter-request@lists.netfilter.org
> 
> You can reach the person managing the list at
> 	netfilter-admin@lists.netfilter.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
> 
> 
> Today's Topics:
> 
>    1. ethernet headers and iptables counters (Marc Lucke)
>    2. Re: ethernet headers and iptables counters (Antony Stone)
>    3. mail server problem (Roberto Rossi)
>    4. Re: mail server problem (Antony Stone)
>    5. Re: mail server problem (netfilter@tommi.org)
>    6. Re: mail server problem (Antony Stone)
>    7. open port to specific ip address (Lohan Spies)
>    8. Re: open port to specific ip address (Antony Stone)
>    9. IP6TABLES and Muulticast Listener ICMPV6 PDUs (Christian Riechmann)
>   10. RE: open port to specific ip address (Lohan Spies)
> 
> --__--__--
> 
> Message: 1
> Subject: ethernet headers and iptables counters
> From: Marc Lucke <marc@marcsnet.com>
> To: netfilter@lists.netfilter.org
> Organization: 
> Date: 10 Nov 2003 20:14:39 +1100
> 
> 
> --=-VAWwww8EbLkqCmm//b/s
> Content-Type: text/plain
> Content-Transfer-Encoding: 7bit
> 
> Hi,
> 
> Do the iptables counters include layer 2 ethernet packet headers?  If
> so, how much traffic is this - is it a set amount?
> 
> Horst.Hansen@fhtw-berlin.de Sat Mar 08 12:29:13 2003 asked the question
> that I was interested in - nobody seemed to answer him.
> 
> My apologies if this is an RTFA question.
> 
> 
> good wishes to all,
> Marc

> --__--__--
> 
> Message: 2
> From: Antony Stone <Antony@Soft-Solutions.co.uk>
> Organization: Software Solutions
> To: netfilter@lists.netfilter.org
> Subject: Re: ethernet headers and iptables counters
> Date: Mon, 10 Nov 2003 09:40:40 +0000
> 
> On Monday 10 November 2003 9:14 am, Marc Lucke wrote:
> 
> > Hi,
> >
> > Do the iptables counters include layer 2 ethernet packet headers?  If
> > so, how much traffic is this - is it a set amount?
> 
> No, because you may not be using ethernet.
> 
> Netfilter can be used for packets across ethernet, 802.11, PPP modems - all 
> sorts of network transports.
> 
> Packet and byte counters in netfilter are IP (OSI layer 3) and upwards.
> 
> You can check this easily by creating a rule matching something specific (eg 
> ping packets), send a known amount of traffic through the box (or measure it 
> with a packet sniffer / protocol analyser such as ethereal, which will give 
> you a detailed view of the contents of the packets), and then check what the 
> counters say.
> 
> Antony
> 
> -- 
> 
> Anything that improbable is effectively impossible.
> 
>  - Murray Gell-Mann, Nobel Prizewinner in Physics
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


