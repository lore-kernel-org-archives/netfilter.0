From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: moving on to tcp flags filtering, more ambiguity
Date: Wed, 9 Oct 2002 07:48:40 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210090738460.13873-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>


first, given the flags SYN,ACK,FIN,RST,URG,PSH, and the shortcuts
ALL and NONE, the flags filtering clause has the form

  --tcp-flags [!] comp mask

as an example, 

  --tcp-flags SYN,RST,ACK SYN

means specifically to compare those three flags, and of those three,
*only* SYN can be set.  so far, so good.

  we can also incorporate ALL and NONE, for example:

  --tcp-flags ALL SYN		(only SYN can be set among all flags)
  --tcp-flags ALL NONE		(all flags must be unset -- a bit silly)

so "ALL", in these cases, is short for all six flags.  but what if we
have

  --tcp-flags SYN,RST,ACK ALL

as a mask, i'm assuming that "ALL" really now means just all of
the flags that were listed in the comp list, since it wouldn't make
much sense to mean all six flags anymore.  is this reasonable?
and i'm also assuming this would mean the same as

  --tcp-flags ! SYN,RST,ACK NONE

even though that's a really hideous way of expressing it.


rday


