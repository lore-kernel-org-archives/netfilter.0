From: kilho Kim <kilho8667@yahoo.com>
Subject: Re: IP Tunnel+IP Tables.
Date: Fri, 10 Oct 2003 09:07:47 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031010160747.89303.qmail@web11408.mail.yahoo.com>
References: <Pine.LNX.4.53.0310091845040.2287@xena.cft.ca.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0310091845040.2287@xena.cft.ca.us>
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
To: Jim Carter <jimc@math.ucla.edu>
Cc: netfilter@lists.netfilter.org

Thanks for the reply Jim.
The problem we're having is just changing the internal
net addresses costs too much. It is not ordinary
network but special network that has very limited
resources (even putting one more wire other that what
we have is not allowed). Well I thought about the
solutions, but nothing is really satisfactory at the
moment. So I'm trying to see if I miss anything by my
lack of knowledge.

Here are solutions I'm considering.
1. Use IP Tunnel between the machine A and machine B.
This can prevent client machines from touching inner
machines, but since machine A and machine B are still
using the public IP addresses as private addesses. If
the machine on the internet has the same address as
what machine A or B are using, the client machines
won't be able to contact true destination.
Besides this we have one machine A, but we can have
upto 300 Linux B machines. For this, I believe machine
A will be responsible for upto 300 tunneling
configured for each Linux B machines. I'm not sure how
realistic it is to configure 300 ipip tunneling on one
box. (I feel that calculating IP checksum will kill
the processor.)

2. Using DNAT at machine B and again DNAT at machine
A. For this to work I need to maintain two tables, but
we're currently using class A addresses (uggggg). So
we'll basically need to maintain very large (I mean
VERY LARGE) tables at machine A and machine B. I'm not
sure if IP tables supports wild card matching or some
sort (I gotta dig into this).

3. Just don't allow client from accessing those public
internet machines using the address we're using.
This seems to be the easiest. Install firewall on
machine B, and block anything that goes to the IP
addresses that we're using. Well, but people who wants
to contact the machines that has the same IP addresses
as we do will complain.

Above are 3 possible senarios I can think of. If
anyone out there can give me any suggestion, please
help.

--- Jim Carter <jimc@math.ucla.edu> wrote:
> On Thu, 9 Oct 2003, kilho Kim wrote:
> > the problems. The problem we're facing is we have
> huge
> > subnet (even though main idea is the same as Box A
> &
> > Box B) and we are using public IP addresses as our
> > private network's ip addresses. For this reason,
> we
> > are trying to hide our network from the clients.
> Yes
> > there maybe some case that the client can actually
> try
> > to access the host that has the duplicated ip
> address
> > as one of our machine does. The way we try to
> solve
> > this is by using the tunneling between the linux A
> and
> > linux B.
> 
> Internet -- A -- mid-net -- B -- internal clients
> 
> If I understand you right, some or all of the
> mid-net clients actually have
> IP addresses that global internet machines have. 
> You have bigger problems
> than just giving internet access to your internal
> clients.  Mid-net
> machines will not be able to talk to the internet
> because return packets
> will go to the true owners of the IP addresses.  You
> need to convince your
> management to clean up your network addressing.  The
> range 10.0.0.0/8 (and
> others) is intended for this purpose.  It has 2^24
> addresses and should be
> big enough :-)  Here at UCLA the entire hospital
> (maybe 10^4 machines) has
> used this strategy.
> 
> Your external services (web server, SMTP gateway,
> DNS) would be on a small
> subnet with public addresses (belonging to you),
> from which a second router
> would lead to the internal net.  As an alternative,
> Linux A could do DNAT
> so internet users could contact it on port 25, 53 or
> 80 and the connections
> would be forwarded to mid-net server(s).  But that's
> more complicated.
> 
> If you have control of Linux A and Linux B, but your
> management is
> (expletive deleted), a tunnel like you describe
> should work, as long as
> your internal clients don't try to contact any
> mid-net machines,
> specifically including any DNS servers on the
> mid-net.  Or alternatively,
> you forget about the tunnel, the internal clients
> see the mid-net, but they
> never see the true owners of those addresses on the
> internet.  You can
> easily find that things don't work because of the
> inconsistent addressing.
> 
> Hmmm.  I didn't notice if you said you had the
> tunnel working.  You need to
> establish a host route specifically from Linux B to
> Linux A and vice versa.
> Otherwise, tunnel envelope packets (that ought to go
> direct from A <-> B)
> will be sent from B down the tunnel to (what it
> thinks is) the global
> Internet, or from A to the global internet instance
> of B's mid-net address.
> It would really be best to avoid the whole issue by
> using private
> addresses.
> 
> James F. Carter          Voice 310 825 2897    FAX
> 310 206 6673
> UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los
> Angeles, CA, USA 90095-1555
> Email: jimc@math.ucla.edu 
> http://www.math.ucla.edu/~jimc (q.v. for PGP key)
> 


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

