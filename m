From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 15:22:33 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207101422.g6AEMi812683@vulcan.rissington.net>
References: <001601c22819$406b6a30$0300a8c0@W2KP01>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001601c22819$406b6a30$0300a8c0@W2KP01>
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

On Wednesday 10 July 2002 2:54 pm, Mark Ayad wrote:

> I have a problem with the following Firewall Script which works fine apart
> from when I try to INTERNALLY connect to the webserver 192.168.0.3:80
> using the public IP which if I'm right should be the same as $EXTIF. The
> internal machine I'm launching the request from is actually the webserver
> (but that shouldn't matter).
>
> I know I'm missing a line from what I read in
> http://netfilter.samba.org/unreliable-guides/NAT-HOWTO/NAT-HOWTO.linuxdoc-1
>0 .html and I've tried nearly every combination I can think of except the
> one that works that is.
>
> So whats the missing line ?
>
> $IPTABLES -A INPUT -p tcp --syn --destination-port 80 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --syn -j DROP
>
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
>
> $IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j
> DNAT --to-destination 192.168.0.3:80
>
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

This one looks a bit odd to me, even though I've written it myself, but I 
think it should do the trick:

$IPTABLES -t nat -A POSTROUTING -o $INTIF -i $INTIF -j MASQUERADE

If it doesn't, then just use the standard version:

$IPTABLES -t nat -A POSTROUTING -o $INTIF -s a.b.c.d/n -j MASQUERADE

where a.b.c.d/n is your internal network range.

 

Antony.

