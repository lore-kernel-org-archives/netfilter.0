From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: redirect port 80 to another port > 1024 on same machine
Date: Mon, 18 Aug 2003 17:55:23 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308181749140.5375@xena.cft.ca.us>
References: <005901c365d9$5c127d10$6564a8c0@redwood.medexpert.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005901c365d9$5c127d10$6564a8c0@redwood.medexpert.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david brant <dbrant@medexpert.com>
Cc: netfilter@lists.netfilter.org

On Mon, 18 Aug 2003, david brant wrote:

> I need to forward tcp port 80 to tcp port 8080 on the same box.  The
> machine does not function as a NAT box and has only a single interface.
> Has anyone come across a rule that might help me out?

Here's something to try:  Suppose your machine is 192.168.0.1.

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT \
	--to-destination 192.168.0.1:8080-8080

In other words, you do an identity transformation of the IP address, but
jigger the port.  It might work :-)  The big question is, if there are
multiple connections at once, will there be a problem that there is only
one destination port in the range?

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

