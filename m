From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Packets missing state ?
Date: Tue, 23 Dec 2003 10:21:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072192881.2184.371.camel@grendel>
References: <200312231828.59518.rajiv@theargoncompany.com>
	 <200312231857.21676.vinayakm@theargoncompany.com>
	 <200312231907.58135.vinayakm@theargoncompany.com>
	 <200312231354.36213.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312231354.36213.Antony@Soft-Solutions.co.uk>
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

On Tue, 2003-12-23 at 08:54, Antony Stone wrote:
>
> Yes, they are NEW because they are for a connection which netfilter has 
> decided is over - therefore it is no longer ESTABLISHED, and any packets 
> which continue to appear will be treated as a NEW connection.

ESTABLISHED state is maintained for 5 days, so I'm guessing the problem
is not there. When I've seen this before the traces usually show the
following:

*ESTABLISHED communications go fine
*One side issues a FIN/ACK to tear down the connection
*state timing is dropped from 5 days to 2 minutes
*Other end of the connection has more data to send &
Attempts transmission after the 2 min. timer expires
*Packet is dropped by the firewall and logged

Normally a FIN/ACK exchange takes place pretty quickly but per the RFCs
one end does not have to close as well if it does not think its
finished. These can cause the log entries you are experiencing.

I saw this *a lot* back in the beta days when Rusty had the FIN expire
set to one minute. Now that its at two minutes, it happens less
frequently.

Of course I have seen scanning in the wild like this that uses a fixed
source port of 80 so you'll just think* that its a state issue. The
scanning can identify static Vs. stateful firewalling as well as what
hosts are up or down. You need to log outbound HTTP to be able to tell
the difference.

> >  Another peculiar log which we would like to get more info on are
> >
> >  Dec 23 18:43:05 theargonserver kernel: IPT IN_FIREWALL_NEW: IN=eth1 OUT=
> >  MAC=00:03:47:6a:5c:6b:00:c0:49:25:d1:a3:08:00 SRC=80.15.238.66
> >  DST=xxx.xxx.xxx.xxx LEN=73 TOS=0x00 PREC=0x00 TTL=55 ID=0 DF PROTO=UDP
> >  SPT=31819 DPT=53 LEN=53
> >
> >  There are a lot of packets to port 53. Is this normal?
> 
> Yes.   UDP port 53 means client-to-server DNS lookups. 

It could also be server to server queries as well as a load balancer.
See if you have an outbound query that immediately precedes this log
entry. If so, its someone pulling metrics to see what IP to serve up to
you. I'm leaning towards load balancer on this one as the source IP has
no PTR. It could however be one of your users on their home account and
their DNS entries are still pointed at the home office.

BTW, if the above was a successful recursive query you really need to
lock the box down. See the Bugtraq post I did back in Sept. on how
spammers can park their domain on your recursive DNS.

HTH,
C



