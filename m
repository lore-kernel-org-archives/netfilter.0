From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: IP Tunnel+IP Tables.
Date: Thu, 9 Oct 2003 19:07:21 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310091845040.2287@xena.cft.ca.us>
References: <20031009223503.69129.qmail@web11406.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031009223503.69129.qmail@web11406.mail.yahoo.com>
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
To: kilho Kim <kilho8667@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Thu, 9 Oct 2003, kilho Kim wrote:
> the problems. The problem we're facing is we have huge
> subnet (even though main idea is the same as Box A &
> Box B) and we are using public IP addresses as our
> private network's ip addresses. For this reason, we
> are trying to hide our network from the clients. Yes
> there maybe some case that the client can actually try
> to access the host that has the duplicated ip address
> as one of our machine does. The way we try to solve
> this is by using the tunneling between the linux A and
> linux B.

Internet -- A -- mid-net -- B -- internal clients

If I understand you right, some or all of the mid-net clients actually have
IP addresses that global internet machines have.  You have bigger problems
than just giving internet access to your internal clients.  Mid-net
machines will not be able to talk to the internet because return packets
will go to the true owners of the IP addresses.  You need to convince your
management to clean up your network addressing.  The range 10.0.0.0/8 (and
others) is intended for this purpose.  It has 2^24 addresses and should be
big enough :-)  Here at UCLA the entire hospital (maybe 10^4 machines) has
used this strategy.

Your external services (web server, SMTP gateway, DNS) would be on a small
subnet with public addresses (belonging to you), from which a second router
would lead to the internal net.  As an alternative, Linux A could do DNAT
so internet users could contact it on port 25, 53 or 80 and the connections
would be forwarded to mid-net server(s).  But that's more complicated.

If you have control of Linux A and Linux B, but your management is
(expletive deleted), a tunnel like you describe should work, as long as
your internal clients don't try to contact any mid-net machines,
specifically including any DNS servers on the mid-net.  Or alternatively,
you forget about the tunnel, the internal clients see the mid-net, but they
never see the true owners of those addresses on the internet.  You can
easily find that things don't work because of the inconsistent addressing.

Hmmm.  I didn't notice if you said you had the tunnel working.  You need to
establish a host route specifically from Linux B to Linux A and vice versa.
Otherwise, tunnel envelope packets (that ought to go direct from A <-> B)
will be sent from B down the tunnel to (what it thinks is) the global
Internet, or from A to the global internet instance of B's mid-net address.
It would really be best to avoid the whole issue by using private
addresses.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

