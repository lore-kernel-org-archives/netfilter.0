From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Closed ports and traffic shaping
Date: Thu, 16 Feb 2006 00:38:38 +0200
Message-ID: <fad9d4840602151438x3f291cd4mfe9c53896ef453de@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: NetFilter <netfilter@lists.netfilter.org>, lartc <lartc@mailman.ds9a.nl>

First off, please excuse the cross post between lartc and netfiler,
the line between the two is very blurred here (at least for me)...

A thought just crossed my mind now while working on a new iptables/tc
collaboration for a project.

I use iptables to basically seal off a linux gateway, we're very
restrictive on what users can do on the connection. For now I'm using
destination port filtering, will bring in source port filtering for
replies and layer-7 for some help later.

Traffic shaping is done with tc using WRR. All traffic coming from the
server's OUTPUT chain is classified differently from internet traffic,
which passes through WRR (localhost is pfifo_fast).

Now here is the question...

If someone on the network attempts to use an aggressive file sharing
program, one that keeps on connecting to random peers on random ports,
and the server replies that the requested ports are unavailable
("REJECT --reject-with tcp-reset" for TCP, and "REJECT --reject-with
icmp-port-unreachable" for UDP) where applicable; do these packets get
classified as internet traffic or do they pass through the OUTPUT
chain and get classified as local traffic?

I know tcpdump hooks in before netfilter gets to work, but it looked
like the errors came from the internet hosts and not localhost. What
I'm getting at is if these error packers don't get classified
differently from normal internet traffic they can potentially saturate
your class doing shaping for internet traffic, right or wrong? I know
you need a pretty aggressive piece of P2P to get this done...

Any advice & insight would be appreciated

--

Kenneth Kalmer
kenneth.kalmer@gmail.com

Folding@home stats
http://fah-web.stanford.edu/cgi-bin/main.py?qtype=3Duserpage&username=3Dken=
neth%2Ekalmer

