From: "Ilo Lorusso" <sneak@ipnoc.co.za>
Subject: Re: Redirecting mail
Date: Mon, 11 Apr 2005 17:05:18 +0200
Message-ID: <007a01c53ea7$dff345d0$648045ac@sneak>
References: <003301c53c25$72c951e0$648045ac@sneak>
	<005301c53c71$5734b450$f5001eac@riverview.office>
	<001001c53d1d$11e678f0$648045ac@sneak>
	<425825C6.5020504@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Ok,
Ive actually got 2 hops between the machines..

its  ...

 172.20.128.56

1 PIX Firewall
2 Nortel Passport (router)

 192.168.12.56

But these two machines are able to see each other and have full access to
each other, just completely seperate networks.

is it still possible to do that advanced routing even though the hope 
between are not linux devices ??


----- Original Message ----- 
From: "Grant Taylor" <gtaylor@riverviewtech.net>
To: "Ilo Lorusso" <sneak@ipnoc.co.za>
Cc: <netfilter@lists.netfilter.org>
Sent: Saturday, April 09, 2005 8:58 PM
Subject: Re: Redirecting mail


>> Hi,
>> I would just like to confirm with you, if machine 192.168.16.56 is to on
>> the same switch but 3 hops away will the method you describe still work?
>
> Based on your choice of word of "hop(s)" I'm going to assume that the
> 172,20,128.56 mail server that you want to route it's SMTP connections out
> a different INet connection is not directly connected to the same subnet
> that the 192.168.16.56 system is on.  That being the case I'm going to
> assume that you do have a way to establish a route internally on your lan
> via the 192.168.16.x/24 network to an unknown network, to any more unknown
> networks, to the 192.168.16.x/24 network.  If this is indeed the case I
> would make sure that all the routers that the traffic has to pass through
> to pass in to each network have a path to each of the other networks.  An
> example below should help with this.
>
> [Machine A]
> INet connection with unknown IP
> 172.20.128.56 on the 172.20.128.x/24 network
>
> [Machine B]
> 172.20.128.254 on the 172.20.128.x/24 network
> 10.0.0.1 on the 10.0.0.x/24 network
>
> [Machine C]
> 10.0.0.254 on the 10.0.0.x/24 network
> 192.168.144.1 on the 192.168.144.x/24 network
>
> [Machine D]
> 192.168.144.254 on the 192.168.144.x/24 network
> 192.168.16.1 on the 192.168.16.x/24 network
>
> [Machine E]
> 192.168.16.56 on the 192.168.16.x/24 network
> INet connection with an unknown IP
>
> Following the above example I'm going to assume that you are wanting to
> route all SMTP traffic from Machine A out Machine E's internet connection.
> To do this I would make sure that machines / routers have at least the
> following in their (main) routing tables:
>
> [Machine A's partial routing table]
> INet connection is local to Machine A
> 172.20.128.x/24 network is local to Machine A
> 10.0.0.x/24 network via Machine B metric of 1
> 192.168.144.x/24 network via Machine B metric of 2
> 192.168.16.x/24 network via Machine B metric of 3
>
> [Machine B's partial routing table]
> 172.20.128.x/24 network is local to Machine B
> 10.0.0.x/24 network is local to Machine B
> 192.168.144.x/24 network via Machine C metric of 1
> 192.168.16.x/24 network via Machine C metric of 2
>
> [Machine C's partial routing table]
> 172.20.128.x/24 network via Machine B metric of 1
> 10.0.0.x/24 network is local to Machine C
> 192.168.144.x/24 network is local to Machine C
> 192.168.16.x/24 network via Machine D metric of 1
>
> [Machine D's partial routing table]
> 172.20.128.x/24 network via Machine C metric of 2
> 10.0.0.x/24 network via Machine C metric of 1
> 192.168.144.x/24 is local to Machine D
> 192.168.16.x/24 is local to Machine D
>
> [Machine E's partial routing table]
> 172.20.128.x/24 network via Machine D metric of 3
> 10.0.0.x/24 network via Machine D metrick of 2
> 192.168.144.x/24 network via Machine D metric of 1
> 192.168.16.x/24 is local to Machine E
> INet connection is local to Machine E
>
> This will allow your traffic to pass from machine A to Machine E with
> known routes.  The only thing that might cause a problem is if you have
> firewalls on all systems DROPping or REJECTing traffic that is not from
> the local network trying to pass through it.  But if you open up your
> firewalls to the traffic on each of the networks that need to pass through
> then there is no reason why traffic from Machine A could not pass out the
> INet connection on Machine E.
>
> If you would like to give me some more details on what your network
> topology is I'd do my best to help you with what your routing tables would
> need to look like.
>
>
>
> Grant. . . .
>


