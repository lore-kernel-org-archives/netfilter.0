From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Question to the list/maintainers....
Date: Wed, 1 Oct 2003 19:18:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310011918.40436.Alistair@nerdnet.ca>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org


	I am in the process of rewriting my firewall ( as prev mentioned on the list)
	and in this process note that there have been updates to ip_xxxx_irc. put in 
	2.4.22.  I'm currently running 2.4.21 with lowlatency patches and iptables
	1.2.7a with P.O.M. from 20030107.

	Are the updates in 2.4.22 likely to fix the occasional DCC send/recieve 
errors that my natted users have been experiencing ( DCC connection requests
	come through, but cannot be seen by the client, only by the server and
	the NATTING host) -- this is an intermittent problem that I was laying at the 
	foot of the client until I noted that the actual client to client connection
	was never built in the conntrack table?

	(would make my other half and a couple of friends that drop by with laptops
	MUCH happier)

	Considering what I'm up to at the moment, this is becoming  a project that
	I'm gonna have to take a day or three to perform anyway --- I'd like to know 
	if I should add a kernel upgrade and an iptables tools and POM upgrade to 
	the list.

	(This is my HOME lan... not a production system for business... but rather
	a mixed OS lan/playground)

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

