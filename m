From: "Mark Ayad" <mark@javamark.com>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 16:51:11 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <000b01c22821$3c6b1e00$0300a8c0@W2KP01>
References: <001601c22819$406b6a30$0300a8c0@W2KP01> <200207101422.g6AEMi812683@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Nice try but no luck

$IPTABLES -t nat -A POSTROUTING -o $INTIF -i $INTIF -j

can't use -i in POSTROUTING

So I tried

$IPTABLES -t nat -A POSTROUTING -o $INTIF 192.168.0.0/24 -j MASQUERADE

No luck there although this time the rule is correct.

So I tried

$IPTABLES -t nat -A POSTROUTING -o $INTIF 192.168.0.3 -j MASQUERADE

...but no success.

I know this is a silly problem, since I could used the internal IP of the
web server, but I want to crack this to be sure the server can be reached
via the external address. At the moment I confirm this using a web
anonymiser.

Mark



----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Wednesday, July 10, 2002 4:22 PM
Subject: Re: Destination NAT Onto the Same Network Problem


> On Wednesday 10 July 2002 2:54 pm, Mark Ayad wrote:
>
> > I have a problem with the following Firewall Script which works fine
apart
> > from when I try to INTERNALLY connect to the webserver 192.168.0.3:80
> > using the public IP which if I'm right should be the same as $EXTIF. The
> > internal machine I'm launching the request from is actually the
webserver
> > (but that shouldn't matter).
> >
> > I know I'm missing a line from what I read in
> >
http://netfilter.samba.org/unreliable-guides/NAT-HOWTO/NAT-HOWTO.linuxdoc-1
> >0 .html and I've tried nearly every combination I can think of except the
> > one that works that is.
> >
> > So whats the missing line ?
> >
> > $IPTABLES -A INPUT -p tcp --syn --destination-port 80 -j ACCEPT
> > $IPTABLES -A INPUT -p tcp --syn -j DROP
> >
> > $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> > $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> > $IPTABLES -A FORWARD -j LOG
> >
> > $IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j
> > DNAT --to-destination 192.168.0.3:80
> >
> > $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
>
> This one looks a bit odd to me, even though I've written it myself, but I
> think it should do the trick:
>
> $IPTABLES -t nat -A POSTROUTING -o $INTIF -i $INTIF -j MASQUERADE
>
> If it doesn't, then just use the standard version:
>
> $IPTABLES -t nat -A POSTROUTING -o $INTIF -s a.b.c.d/n -j MASQUERADE
>
> where a.b.c.d/n is your internal network range.
>
>
>
> Antony.
>
>


