From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: more iptables nitpicking
Date: Wed, 29 Oct 2003 14:46:06 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310291443240.28375-100000@localhost.localdomain>
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


  putting together a tutorial on this stuff has made me really
read the docs closely, so another couple of nits to pick:

1) the man page opens with a list of options, including 
   iptables -[ADC] ...

   what's with the "-C"?  i know of no such option, and
   "iptables -h" doesn't mention it.

2) the man page also mentions the state match 

   -m pkttype --pkt-type ...

   was it deliberate to spell "pkttype" in two subtly different
   ways here?  that seems just a recipe for confusion.

rday


