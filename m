From: "Herbert G. Fischer" <manager@trama.com>
Subject: Re: External Resolved IPs
Date: Tue, 17 Jun 2003 12:46:38 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003401c334e7$a3c21080$093010ac@power>
References: <003001c3344a$5d220240$093010ac@power> <1055802812.19430.188.camel@alpha.newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: NetFilter Users <netfilter@lists.netfilter.org>

Thanks!!

It worked very well!

Man... You don't have idea on how many problems
you helped me to solve...

----- Original Message ----- 
From: "Joel Newkirk" <netfilter@newkirk.us>
To: "Herbert G. Fischer" <manager@trama.com>
Cc: "NetFilter Users" <netfilter@lists.netfilter.org>
Sent: Monday, June 16, 2003 7:33 PM
Subject: Re: External Resolved IPs


> On Mon, 2003-06-16 at 17:00, Herbert G. Fischer wrote:
>
> > My problem is that, when I try to connect to a internal server, using
the
> > external and real
> > IP, I cannot because my FW/NAT appears to be confused or misconfigured.
> >
> > For example:
> >
> > Internal Network: 172.16.48.0/24
> >
> > My IP: 172.16.48.10
> > Server Internal IP: 172.16.48.20
> > * Both are on the same network
> >
> > Server External IP: 200.180.180.20 (IP alias on FW/NAT machine, that
> > redirects to 172.16.48.20)
> > DNS name of Server: server.domain.com, points to 200.180.180.20
>
> > # server
> > iptables -t nat -A POSTROUTING -s 172.16.48.20 -j SNAT --to-source
> > 200.180.180.20
> > iptables -t nat -A PREROUTING -s 0/0 -d 200.180.180.20 -j
> > DNAT --to-destination 172.16.48.20
> >
> > # NAT for the rest of the world
> > iptables -t nat -A POSTROUTING -o eth1 -s 172.16.48.0/24 -j
SNAT --to-source
> > 200.180.180.22
>
> When a request from a local client arrives at the iptables box addressed
> to 200.180.180.20, it hits PREROUTING and is DNATted to the appropriate
> server.  Problem is that the server tries to reply directly to the
> client, (since it's a local IP) which sees a 'new' connection from
> 172.16.48.20, which it ignores.  Try adding:
>
> iptables -t nat -A POSTROUTING -d 172.16.48.20 -s 172.16.48.0/24 -j SNAT
> --to iptables.box.local.ip
>
> With this additional rule in place, requests from local clients hit the
> iptables box and are DNATted to the local server, then before leaving
> the iptables box they are SNATted so that the server sends its reply
> back to the iptables box.  When that reply is received by the iptables
> box, it unSNATs and restores the correct destination IP (the local
> client) then before it leaves the box it unDNATs to restore the correct
> source IP (the local server's public IP).
>
> j
>
>
>


