From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Problem with sendmail server behind firewall...
Date: Fri, 5 Sep 2003 16:47:35 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309051608040.3111@xena.cft.ca.us>
References: <20030905062950.M87452@ahm.cmc.net.in>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030905062950.M87452@ahm.cmc.net.in>
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
To: Pradeep Bhomia <pradeepbhomia@ahm.cmc.net.in>
Cc: netfilter@lists.netfilter.org

On Fri, 5 Sep 2003, Pradeep Bhomia wrote:
> Earlier Sendmail server was connected directly to the Internet with a valid
> Internet IP. At that time the number of sendmail processes never exceeded 10
> at any given poing of time. (Checked with ps -ef | grep sendmail)
> Now we have implemented the Mandrake Linux 9.1 based firewall using IPTables
> and Shorewall. NATting was configured on the firewall. After doing this, we
> have observed that the number of sendmail process keeps on increasing and
> goes upto nearly 170 processes. It seems that the problem is with the
> incoming message requests. It process remains open for nearly 2 hours. This
> is observed for random connections or some particular sites.
> As such sendmail server is receiving and sending mails without any problem to
> the users.

Given that the problem starts and stops when you turn on and off your
firewall, it must have something to do with the firewall rules.  But... At
UCLA-Mathnet, we saw sendmail (8.12.5) on Solaris behave similarly, on a MX
in a pseudo-DMZ, i.e. porous firewall.  Remote MTA's, obviously sending
spam, would connect and hang through multi-hour timeouts at the start of
data collection (we think), and the server exceeded MaxDaemonChildren and
refused connections.  Legitimate users had no problem, except when
connections were being refused.

We cured it by shortening a number of timeouts and of course raising
MaxDaemonChildren (contact me if you want to see our sendmail.cf, with the
changed timeouts).

However, we had an odd occurrence that seems to tie in with this whole can
of worms: a certain rival school blocked port 25 on the more preferred MX
of their math department (I never found out why).  No TCP reset, no
connection refused, they just dropped the packets.  When sending, sendmail
on Solaris would time out, defer, and later retry the same MX.  But both
Postfix and Sendmail (same version) on Linux would time out, and
immediately try the less preferred MX, which was not blocked.

Conclusion #1: the TCP stacks on Solaris and Linux behave differently.
Conclusion #2: certain MTA's, favored by spammers, possibly part of "bots"
running on victim PC's, get into this hanging behavior when interacting
with Sendmail in certain environments.  Possibly there are answer packets,
most likely ICMP something or other, which your firewall is blocking, and
which our TCP stack is not producing.

If this rings any bells, and if using tcpdump - ethereal - snort - etc. you
ever discover what's going on, I would be very interested to hear the
answer.

Sorry to list members who don't want to hear about Sendmail, but clearly
<pradeepbohmia>'s firewall is killing something, and I wouldn't be too
surprised to find that Mathnet's porous firewall might also be blocking too
much from our rival.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

