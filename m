From: "Asim Ejaz Butt" <asim.butt@streaming-networks.com>
Subject: Re: MSN and Yahoo Block through IPTABLES
Date: Thu, 26 Jun 2003 16:38:04 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007d01c33bd7$699e3810$5505a8c0@asimejaz>
References: <010a01c33b03$d78da1f0$5505a8c0@asimejaz> <004901c33b4a$963ee9b0$1100000a@busbydev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: David Busby <busby@pnts.com>
Cc: netfilter@lists.netfilter.org

I have tried DROP policy as well but not succeeded.

One thing that I should mentioned that my Internet setup is upload through
normal DDP and download through Satellite Downlink and both are on separate
systems. That is one linux based PC where I am running IPTABLES used to
upload request and the 2nd PC which is a Satellite Receiver used for
download. So my upload request goes to one system and download request
received from another system.

Is that help U to find out that particular problem of blocking MSN/Yahoo
chat using IPTABLES.

Regards,
Asim
----- Original Message -----
From: "David Busby" <busby@pnts.com>
To: "Asim Ejaz Butt" <asim.butt@streaming-networks.com>;
<netfilter@lists.netfilter.org>
Sent: Wednesday, June 25, 2003 11:49 PM
Subject: Re: MSN and Yahoo Block through IPTABLES


> Can you set policy to DROP then only allow what you need?
>
> /B
>
>
> ----- Original Message -----
> From: "Asim Ejaz Butt" <asim.butt@streaming-networks.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, June 25, 2003 03:23
> Subject: MSN and Yahoo Block through IPTABLES
>
>
> > Hello Gurus,
> >
> > I am trying to block MSN and Yahoo Instant Messengers with my LAN using
> > IPTABLES. Following commands are used to block them but unsuccessful.
> >
> >  /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 --dport 1863 -j REJECT
> >  /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 -d 64.4.0.0/18 -j
REJECT
> >
> >  /sbin/iptables -A FORWARD -d cs.yahoo.com -j REJECT
> >  /sbin/iptables -A FORWARD -d scsa.yahoo.com -j REJECT
> >
> > Anyone help in blocking them through IPTABLES.
> >
> > Asim Ejaz Butt
> > asim.butt@streaming-networks.com
> >


