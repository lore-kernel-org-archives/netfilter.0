From: Joubert Berger <joubertb@gmail.com>
Subject: When do iptables take effect when using iptables-restore
Date: Fri, 13 May 2005 11:35:34 -0400
Message-ID: <63d3731e0505130835640d8da0@mail.gmail.com>
Reply-To: joubert@berger-family.org
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
To: netfilter@lists.netfilter.org

Say I have 10,000 rules loaded.

I now want to update them, so I edit my file and then run
iptables-restore to load the new rules.

During all this iptables is applying policy on packets.  So, what
happens between the time I start running iptables-restore and when it
finishes it?  Does it flush all the  rules and then load the news
ones?  Does that mean during this time I don't have iptables
enforcement going on?   Or does Iptables-restore load all the rules in
memory and then, when the commit happens, moves pointers around so
that enforcement is in effect all the time?

Another question I have is about connection tracking.  Do they get
flushed when we do a save-restore?  Say we allowed 10.10.3.3 through,
and currently  connection tracking is tracking this IP.  Now, we add a
rule to block 10.10.3.3.  But, connection tracking  is allowing it
through.  How does one solve this problem?

--joubert

