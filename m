From: Kevin White <ml-kevin@kevbo.org>
Subject: Connection stats logging?
Date: Fri, 07 May 2004 13:59:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409BCE94.3070502@kevbo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

I sent this message on Monday (by mistake, it was sent twice).  I've not
seen a response, and I'm not sure where to go next.  I'm considering
asking in -dev, because I'm willing to do some coding, I just want to
make sure I'm looking in the right direction.

Please help me with any thoughts you can provide, so I go about solving
this the right way!  Thanks!

We had a firewall application using an old OpenBSD (2.9).  One of the
things it did on NAT was log lines like this when connections closed:

Apr 29 23:25:46 si000AmerSh ipmon[3122]: 23:25:46.021102 STATE:CLOSE
216.65.19.55,53505 -> 192.168.0.82,25 PR tcp Pkts 60 Bytes 22144

We used this line to do statistics.

I'm trying to figure out how to get something similar with Netfilter.

Basically, what I need is a report of the connection: where it was to,
how many bytes and packets it had, when it closes.

I've looked at ulogd, but I'm not sure that would be ideal.  Basically,
I'd have to build my own connection tracker DB to assign every packet
to, so I'd be at least doubling the memory footprint.

I'm wondering if there's something built in that I can get to to give me
these kinds of statistics.  Or if I should be writing an extension.
(I'd like to get this data for every connection that goes through the
firewall.)

Thoughts, or pointers?  I'm looking for input before I waste too much
time barking up the wrong tree.

Thanks,

Kevin






