From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Packets missing state ?
Date: Tue, 23 Dec 2003 13:54:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231354.36213.Antony@Soft-Solutions.co.uk>
References: <200312231828.59518.rajiv@theargoncompany.com> <200312231857.21676.vinayakm@theargoncompany.com> <200312231907.58135.vinayakm@theargoncompany.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312231907.58135.vinayakm@theargoncompany.com>
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

On Tuesday 23 December 2003 1:37 pm, Vinayakam Murugan wrote:

> On Tuesday 23 December 2003 18:57, Vinayakam Murugan wrote:
> > > You say you can access the site without any problems.
> > >
> > > I would expect the above log entries to happen when you close down the
> > > browser (or view a different site), but the remote server still
> > > continues to send a few packets.   They are no longer part of an
> > > established connection as far as netfilter is concerned, so they get
> > > logged.
> > >
> > > Try checking the timestamps, or view the logfile in real time as you do
> > > your browsing - I'd expect these log entries to occur soon after you
> > > leave the site at the SRC address.
>
> Thanks Antony. I'm Rajiv's colleague
>
>  We were not able to reproduce it out here.Anyways in this scenario, would
>  the packet would have the state as NEW?  All these logs are of packets
> with state NEW.

Yes, they are NEW because they are for a connection which netfilter has 
decided is over - therefore it is no longer ESTABLISHED, and any packets 
which continue to appear will be treated as a NEW connection.

>  Another peculiar log which we would like to get more info on are
>
>  Dec 23 18:43:05 theargonserver kernel: IPT IN_FIREWALL_NEW: IN=eth1 OUT=
>  MAC=00:03:47:6a:5c:6b:00:c0:49:25:d1:a3:08:00 SRC=80.15.238.66
>  DST=xxx.xxx.xxx.xxx LEN=73 TOS=0x00 PREC=0x00 TTL=55 ID=0 DF PROTO=UDP
>  SPT=31819 DPT=53 LEN=53
>
>  There are a lot of packets to port 53. Is this normal?

Yes.   UDP port 53 means client-to-server DNS lookups.   This happens all the 
time on a normal network, and UDP is used so that if an answer doesn't come 
back quickly, the client will try another server instead.   Depending on the 
rules and logging you are doing, netfilter may again decide that some reply 
packets no longer match ESTABLISHED connections (netfilter keeps its own idea 
of what is an ESTABLISHED UDP connection, even though UDP is a connectionless 
protocol), and so such packets may be treated as spurious NEW packets which 
netfilter doesn't know what to do with.

Unless you experience DNS problems on your network (clients timeout or cannot 
find servers) I wouldn't bother about this; if you do have problems the 
easiest solution (which is really simple to do) is set up your own caching 
DNS server insternal to your network and tell the clients to do their lookups 
from there (the caching server will then do TCP requests to other servers on 
the Internet, and the whole thing will be much more efficient for you - I 
don't know if that will actually be noticeable to people in terms of better 
performance or lower bandwidth, though).

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


