From: Jun Sun <jsun@junsun.net>
Subject: figure out IP/port mapping in NAT
Date: Wed, 25 Dec 2002 21:36:41 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021225213641.B2104@gateway.junsun.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I am using both DNAT and SNAT (ip masquerading) on a gateway machine connecting
a private network and internet.  The DNAT is used to route all http traffic
to a specific our own web server on the internet.

Now I am facing an tough problem.  Once receving the http request, our
own web server needs to know which machine in our private network 
sends this request.

Since the web server knows which port on gateway machine is sending the
request, if we know which private IP is mapped to that port, web server
could query the gateway machine and obtain the private IP address of
the requesting machine.

Does anybody know how to figure out this private IP to gateway out-going
port mapping?

Assuming this solution works, it does require extra round of traffic
between the server and gateway machine.  I wonder if there are any
better solutions.  For example, if we can somehow "tag" the http
packets when the gateway re-routes them to our web server and somehow
our server can "read" the tag, things will be solved in a much more
elegant way.

Thanks for any pointers.  Please cc your reply to my email address
as I am not on the mailing list yet.

Jun

