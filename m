From: Stephane Bortzmeyer <bortzmeyer@nic.fr>
Subject: [OT] A success story with connlimit
Date: Mon, 17 May 2004 16:45:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040517144515.GA22532@nic.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

[Warning: may contain advertising.]

We used the connlimit patch
(http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-connlimit),
on a Debian-patched 2.4.26 Linux kernel, to manage the huge number of
requests when we opened the ".fr" top-level domain last week. As far
as 12 000 emails were received per minute and we had to ensure FIFO
(first come, first served) and fairness, so it was not possible to
dispatch the load to several machines.

In addition to that, several registrars, during the tests, managed to
exhaust various resources of the system by accident (client programs
too aggressive).

The connlimit patch allowed us to set up a maximum of five
simultaneous connections per prefix of length 28. Most serious
registrars never hit the limit but some who were using rogue SMTP
clients or untuned regular MTA were limited that way, allowing the
process to run smoothly. No big technical issue was noticed.

So, thanks to the developers of Netfilter and of connlimit.

AFNIC (registry of ".fr")
http://www.afnic.fr/



