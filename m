From: James Mullens <mullensja@ornl.gov>
Subject: RE: ip_conntrack vs netstat
Date: Tue, 02 Sep 2003 16:31:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004301c37191$29af8070$7309db80@ornl.gov>
References: <Pine.LNX.4.53.0308301423020.30825@apollo.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <Pine.LNX.4.53.0308301423020.30825@apollo.rsn.bth.se>
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
To: 'Jonas Lindborg' <jools@apollo.nu>, netfilter@lists.netfilter.org


The firewall will keep a TCP link in its connection tables through 5
days of inactivity.  It will close its connection quickly if it sees the
closure handshaking (FIN, ACK) or a RST is sent.  I think that ACK from
the public side, followed by a response from the private side, may also
establish a connection unless the "TCP window tracking" patch is
installed.  But this is from memory. 

Try this.  If you dump the conntrack table and see the time out left (in
seconds, 2nd number, large).  This counts down from 5 days (of seconds)
for established TCP connections.  If the connection is inactive, the
number will be smaller by the period of inactivity.  

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Jonas Lindborg
Sent: Saturday, August 30, 2003 08:38
To: netfilter@lists.netfilter.org
Subject: ip_conntrack vs netstat


Hello,

When comparing the output of /proc/net/ip_conntrack with the "netstat"
command, I'm seeing a few established connections in ip_conntrack that
are not presented by netstat.

These are familiar connections (ssh, imap) to known hosts that could
very well have been done by me but not in the last 24 hrs so they should
have timed out a long time ago.

"ps" shows no such processes running so this immediately raises the
suspicion that the machine could be compromised and connections are
hidden from netstat and ps. But if this was the case there should be
some connections to unknown hosts showing in ip_conntrack as well so I
should be able to rule out that possibility (?).

Now for my question:
Can anyone confirm that ip_conntrack can show "ghost" connections like
these?



