From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: opening a port..
Date: Wed, 8 Jan 2003 15:24:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local>
References: <1042030327.590.10.camel@nirvana>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042030327.590.10.camel@nirvana>
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
To: netfilter <netfilter@lists.netfilter.org>

> ok, telnet from another machine to the router.
> 
> telnet 10.0.0.6 4662
> Trying 10.0.0.6...
> telnet: Unable to connect to remote host: Connection refused
> 
> what "service" should I be running? I simply want 4662 open both ways.

# netstat -an|grep 4662
should tell you if your box is listening at all on port 4662.

If you run eDonkey server on the firewall box, open port in the INPUT
chain.
If your eDonkey server is *behind* the firewall, open the port in the
FORWARD chain, and add a DNAT rule in the nat table -> PREROUTING chain.


Rob


