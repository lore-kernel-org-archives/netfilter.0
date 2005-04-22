From: Royce Kemp <rkemp@ip3.com>
Subject: Re: NAT problem when coming from private network
Date: Thu, 21 Apr 2005 19:35:33 -0700
Message-ID: <6.0.1.1.2.20050421193231.01d01a20@insight.ip3.com>
References: <49795.72.11.67.10.1114115075.squirrel@72.11.67.10>
	<200504212216.15006.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504212216.15006.Alistair@nerdnet.ca>
References: <49795.72.11.67.10.1114115075.squirrel@72.11.67.10>
	<200504212216.15006.Alistair@nerdnet.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

at first this is what I thought the solution would be, but Mark Wells said 
that his mail server is on the same subnet as the client machine 
(192.168.1.8 and 192.168.1.34)... so why can't the mail server communicate 
directly with the client machine? so packet go from client to firewall and 
are redirected to the mail server.. then the mail server will arp for 
192.168.1.34 and return packet directly to him). is this not possible?

-r


At 07:16 PM 4/21/2005, Alistair Tonner wrote:
>On April 21, 2005 04:24 pm, Mark Wells wrote:
> >  Apologies if this is an RTFM but I have searched and found nothing.
> >
> >  The problem:
> >
> > We're doing NAT (DNAT) on our firewall from a valid outside ip to a
> > machine on our private network which is handling mail. So the rule looks
> > like this:
> >
> > /usr/sbin/iptables -t nat -A PREROUTING -i $EXTERNAL -d 72.11.67.10 -p tcp
> > --destination-port 25 -j DNAT --to-destination 192.168.1.8:25
> >
> > /usr/sbin/iptables -A FORWARD -p tcp -i $EXTERNAL -d 192.168.1.8 --dport
> > 25 -j ACCEPT
> >
> > $EXTERNAL being eth1 our  "outside" interface.  There is also a $INTERNAL
> > which corresponds to eth0 - the interface on out private network.
> >
> > Pretty standard stuff.
> >
> > So NAT works great for incoming mail, and we have similar rules for POP3,
> > IMAP, etc. All works great from outside.
> >
> > The problem comes when we try to hit the mail server (by going to that
> > outside ip),  from a machine that's already on the private network. So for
> > example if I telnet to port 25 on 72.11.67.10 from my personal machine
> > which is on 192.168.1.34 I get nothing. According to my reading of the
> > rule, any packets that come from the outside bound for port 25 on the
> > 72.11.67.10 should be NATted to 192.168.1.8. Which they are if they come
> > from the outside. Why shouldn't it work if packets try to hit port 25 on
> > 72.11.67.10 from the private network then?
>
>         <Bulk snippage>
>
>
>         Basically your problem is this.  Works from outside.  Come inside 
> and the
>system contacts the firewall correctly, gets redirected to the correct inside
>server ****** and the inside server replies directly to the inside pc *******
>and said packet (reply) is not related to anything the inside pc is aware of.
>
>         Ta DAH!
>
>         Now -- to solve.
>
>         write a rule that takes the connections coming from inside ONLY 
> that are
>headed OUT of your firewall (on the way to the mailserver) and SNAT (Source
>Nats) them to the inside ip of the firewall ... this way the mailserver (or
>whatever else) replies back to firewall and firewall sends it to inside ip.
>
>(I'm NOT guarranteeing syntax here I'm TIRED)
>
>iptables -A POSTROUTING -t nat  -p tcp -s ${lan_ip_range} -d
>${lan_ip_of_mailserver} \ --dport ${mail} -j SNAT --to-source
>${lan_ip_of_firewall}
>
>
>         although it worked for me. -- FYI the reason for the -s filter 
> there is so
>that internet traffic connections ARE NOT SNATted on the way in -- thus when
>you only see connections from the firewall to the mail server in the logs you
>know it was someone on the inside of the lan ...
>
>         -- off to bed with me.
>
>         Alistair Tonner
> >
> > Appreciated as always,
> >
> > Mark



