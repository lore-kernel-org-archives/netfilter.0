From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: figure out IP/port mapping in NAT
Date: Tue, 31 Dec 2002 22:15:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212312215.41437.netfilter@newkirk.us>
References: <20021225213641.B2104@gateway.junsun.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021225213641.B2104@gateway.junsun.net>
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
To: Jun Sun <jsun@junsun.net>, netfilter@lists.samba.org

On Thursday 26 December 2002 12:36 am, Jun Sun wrote:
> I am using both DNAT and SNAT (ip masquerading) on a gateway machine
> connecting a private network and internet.  The DNAT is used to route
> all http traffic to a specific our own web server on the internet.
>
> Now I am facing an tough problem.  Once receving the http request, our
> own web server needs to know which machine in our private network
> sends this request.

Based upon the wording of your question, I presume the server in question=
=20
isn't physically local?  If it is, you can probably handle this by=20
subnetting the server separate from the clients, and NOT SNATting local=20
communications.  As long as the server and clients believe that the=20
gateway is the only way to reach each other then traffic will route=20
properly.  If there are other routers in the network that both server=20
and clients share then things could be a little more complicated, but=20
still should be doable.

Assuming the server lives elsewhere, but you have some control over it,=20
or influence over its configuration, (the rest of your question seems to=20
indicate this is true) look into tunneling.  This is the 'proper' way to=20
connect physically non-contiguous networks across a third 'public'=20
network.  Create an IPinIP tunnel with the server and the gateway as=20
endpoints, and route traffic from the local network destined for that=20
server through the tunnel instead of NATting.  If configured properly it=20
will appear at the server with the local private IP from the client=20
machine, and replies from the server will route back through the tunnel.

Check http://lartc.org/howto/lartc.tunnel.html for info and quick'n'dirty=
=20
examples.  Obviously the gateway is running Linux.  If the server is as=20
well you should be able to use basic IPinIP tunneling, if the server is=20
Win2k or such look at IPV4 GRE tunnels.

It will be important to remember to exclude this traffic from the=20
masquerading SNAT otherwise performed on outbound traffic from the local=20
network.  Also, if you are on a dynamic IP (MASQUERADE target instead of=20
SNAT, your phrasing makes this unclear) it becomes necessary to change=20
the tunnel configuration at the server end whenever the gateway's public=20
IP changes, which would complicate things considerably.  If both IP's=20
are static, and both machines run Linux, this should all be very simple=20
to implement.  Finally, pay attention to MTU, packet size settings, as=20
you may need to reduce them by a couple of dozen bytes to accomodate the=20
added tunnel header without additional fragmentation.

Trying to implement your backtrack double-check approach would, I=20
believe, require some custom coding, and I'm quite confident that a=20
tunnel will incur considerably less processing and bandwidth penalty,=20
even if it is necessary to set up userspace code at each end to=20
synchronize to a dynamic IP.

j

PS - essentially unrelated, between beginning this reply and sending it I=
=20
decided to set up an IPV6 in IPV4 tunnel, and now I'm on the 6bone.  Now=20
I get to play with ip6tables...

> Since the web server knows which port on gateway machine is sending
> the request, if we know which private IP is mapped to that port, web
> server could query the gateway machine and obtain the private IP
> address of the requesting machine.
>
> Does anybody know how to figure out this private IP to gateway
> out-going port mapping?
>
> Assuming this solution works, it does require extra round of traffic
> between the server and gateway machine.  I wonder if there are any
> better solutions.  For example, if we can somehow "tag" the http
> packets when the gateway re-routes them to our web server and somehow
> our server can "read" the tag, things will be solved in a much more
> elegant way.
>
> Thanks for any pointers.  Please cc your reply to my email address
> as I am not on the mailing list yet.
>
> Jun


