From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: DROP TCP output to HTTP attackers?
Date: Fri, 23 Dec 2005 15:49:37 -0500
Message-ID: <000001c60802$645d22e0$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

Using -j QUEUE, I DROP http packets that I don't like,
and I DROP all subsequent packets from the offending
ipAddress.  Using ethereal, I note that when I DROP,
I send tcp FIN packets.  Therefore, I added -j QUEUE
to the OUTPUT filter, and I block all OUTPUT to the
offending ipAddress, including the tcp FIN packets,
as confirmed with ethereal.  I just deployed this in
the last 30 minutes.  My preliminary observation, thanks
to an obliging attacker, is that I get less follow-up
junk with the OUTPUT filter blocked, although there
did appear to be a few anomalies, that I assume are to
to timing issues.

Any opinions on this procedure?

Thanks,
Mike.
--
Michael D. Berger
m.d.berger@ieee.org 



