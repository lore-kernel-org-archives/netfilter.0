From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: filtering incoming FTP requests through a firewall
Date: Thu, 24 Apr 2003 22:10:14 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304242206230.21883-100000@dell>
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


  i only partially recall a very recent query involving filtering
incoming FTP requests through a firewall to an internal LAN.

  i wasn't surprised to see that DNAT was part of the solution,
but i also recall that it didn't seem that the firewall was
actually doing any filtering, just DNATting.

  just from memory (and i could be wrong), i got the impression
that it was being left to the internal hosts to do that actual
filtering.

  i'm assuming that it would be possible to do both the DNATting
and filtering at the firewall with DNAT and the FORWARD chain
of the filter table, no?

rday

p.s.  i apologize if i'm misremembering this, and that the
solution posted did indeed involve filtering on the FORWARD
chain.


