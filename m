From: David A Golden <david@hyperbolic.net>
Subject: Re: IPSec passthrough with iptables
Date: Tue, 15 Oct 2002 23:45:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20021015233540.03a36008@secure.hyperbolic.net>
References: <B9D1A7D2.3DF9%george@mattandgeorge.com>
 <B9D1A7D2.3DF9%george@mattandgeorge.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210151300.g9FD0vL23616@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Just to muddy the waters, through experimentation, I have found that using 
Checkpoint SecuRemote (on windows) behind a Linux netfilter firewall, I can 
achieve an IPSEC connection using just:

iptables -A FORWARD -s $INTERNAL_NET -j ACCEPT
iptables -A FORWARD -d $INTERNAL_NET -m state --state ESTABLISHED,RELATED \
         -j ACCEPT

I.e. explicit per-protocol forwarding seems unnecessary.  (Though you might 
want to be explicit for security/control reasons.)  [Note, no UDP 
encapsulation, either]

I do experience weird time-outs occasionally, apparently connected to 
incoming IKE packets (UDP port 500) that aren't recognized as connected, 
but I can get around this by just accepting them to the firewall, which 
does nothing as there is nothing running on that port.  (I'm trying 
variations of reject/drop to see if there is a better way to reply.)

Regards,
David

At 09:00 AM 10/15/2002, Antony Stone wrote:
>On Tuesday 15 October 2002 12:09 pm, George Agnelli wrote:
>
> > I'm having a similar problem and am not very experienced yet with iptables.
> >
> > > Make sure you are forwarding (both ways :-) protocol 50 (ESP), protocol
> > > 51 (AH) and UDP sport 500 / dport 500 (IKE).
> >
> > Could you show me the best way to write this in iptables syntax?
>
>iptables -A FORWARD -p esp -j ACCEPT
>iptables -A FORWARD -p ah -j ACCEPT
>iptables -A FORWARD -p udp --sport 500 --dport 500 -j ACCEPT
>
>You may wish to add some -s and/or -d source & destination address
>restrictions on the above rules, eg:
>
>iptables -A FORWARD -p esp -s a.b.c.d -d w.x.y.z -j ACCEPT
>iptables -A FORWARD -p esp -s w.x.y.z -d a.b.c.d -j ACCEPT
>
>where a.b.c.d and w.x.y.z are the two IPsec gateways which need to
>communicate.
>
>Antony.


