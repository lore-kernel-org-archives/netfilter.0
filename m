From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: are the four packet "states" all-encompassing?
Date: Thu, 24 Oct 2002 07:37:25 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210240729250.31148-100000@localhost.localdomain>
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


  are the four conntrack states NEW, ESTABLISHED, RELATED and
INVALID all-encompassing?  that is, does every single packet
fall into one and only one of these states?

  more to the point, what decides that a packet is NEW, given
that it's possible for it to be categorized as NEW despite the
fact that it has no SYN bit set?  (i just noticed the part
in the docs about identifying traffic that's NEW but also
"-p tcp ! --syn".

rday


