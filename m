From: Tom Van Overbeke <tvanoverbeke@ccncsi.net>
Subject: RE: dns replies (udp) blocked but why ?
Date: Mon, 25 Aug 2003 16:00:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c36b11$2d474f50$d90315ac@rsrc.be.local>
References: <20030825133641.GA28045@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20030825133641.GA28045@cannon.eng.us.uu.net>
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
To: 'Ramin Dousti' <ramin@cannon.eng.us.uu.net>
Cc: "'Netfilter (E-mail)'" <netfilter@lists.netfilter.org>

:
>
> > Hi,
> >
> > I'm seeing a lot of these messages in my iptables logs lately:
> >
> > Aug 25 14:46:21 dobermann kernel: -drop_the_rest-IN=
> OUT=eth1 SRC=172.21.3.1
> > DST=172.21.3.10 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
> PROTO=UDP SPT=53
> > DPT=3412 LEN=42
> >
> >
> > however, the iptables config should accept it:
> >
> > i have this rule on the firewall (which is also the dns
> server, hence the
> > 'INPUT')
> >
> > $IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> > $IPTABLES -A INPUT -p udp  -s 172.21.0.0/16  --source-port
> > 024:65535  --destination-port 53  -m state --state NEW  -j ACCEPT
>
> I can't understand the topology of your network and what 172.21.0.0/16
> should represent but a server to server query might be from port 53.
> Why are you filtering based on the source port?

172.21.0.0/16 is our lan. i made a habit of limiting the source ports that
can connect to a service to the upper 1024 ports. it was recommended
somewhere i thought as a security measure. anyway, that's not really the
problem here.


>
> >
> > the 172.21.3.10 is the only one causing problems, i noticed
> howerver that
> > this is udp, whereas most dns related traffic i can see is tcp.
>
> Most DNS traffic you see should be UDP though. Why are you seeing more
> TCP than UDP?

you're right. i misinterpreted the output of tcpdump, it is indeed mostly
udp.

>
> > could it be a connection tracking problem ?
>
> If 172.21.3.10 is too slow in replying and the reply time exceeds the
> UDP conntrack timeout you'd see this behaviour. Maybe that's
> the reason.


it's the opposite. 172.21.3.10 was the client and 172.21.3.1 was the server.
so what was being dropped was the reply from the dns server to the client.

the client is an nt4, whereas 99% of our computers are either win2k or aix
or linux. maybe that's the reason ?

anyway, as a test, i added a rule which would allow all traffic from the dns
server on port 53 to a port > 1024 on our lan (like in the days of ipchains,
where you needed an 'in' rule and a 'out' rule for each 'logical' rule), and
i watched if it would trigger some traffic.

it actually did:

Aug 25 15:56:19 dobermann kernel: - dns_udp_reverse - IN= OUT=eth1
SRC=172.21.3.1 DST=172.21.3.10 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=UDP SPT=53 DPT=3574 LEN=42

so this strenghtens my belief that it's a connection tracking issue...




>
> Ramin
>
> >
> >
> >
> > thx,
> >
> >
> > Tom.
>

****************************************************************************
Disclaimer: 
This electronic transmission and any files attached to it are strictly 
confidential and intended solely for the addressee. If you are not 
the intended addressee, you must not disclose, copy or take any
action in reliance of this transmission. If you have received this 
transmission in error, please notify the sender by return and delete
the transmission.  Although the sender endeavors to maintain a
computer virus free network, the sender does not warrant that this
transmission is virus-free and will not be liable for any damages 
resulting from any virus transmitted. 
Thank You.
****************************************************************************


