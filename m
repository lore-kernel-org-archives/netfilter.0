From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: what are the possible chain policies?
Date: Sat, 29 Mar 2003 14:29:35 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303291426440.7401-100000@dell>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  i was just summarizing the behavior of iptables and i'm puzzled
by a contardiction between the man page and oskar's tutorial.

  regarding possible chain policies, oskar lists DROP, ACCEPT
and REJECT.

  the man page, however, suggests all of ACCEPT, DROP, QUEUE
or RETURN, which seems a bit odd.

  since i've only used DROP or ACCEPT until now, i'm not sure
what the right answer is.

  anyone?

rday


