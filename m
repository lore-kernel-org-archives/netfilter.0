From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: how to negate a limit match?
Date: Wed, 29 Oct 2003 13:31:10 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310291330000.27971-100000@localhost.localdomain>
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


  it's not clear from the man page how to reverse the meaning
of a limit match.  if i want to accept everything *over* a given
limit, i'm supposed to use the "!".  but where?  is it like
this?

  -m ! limit -- limit ... etc etc ...

rday


