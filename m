From: Bill Davidsen <davidsen@tmr.com>
Subject: Rate limiting by IP
Date: Thu, 13 Mar 2003 15:22:27 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.3.96.1030313151750.32436G-100000@gatekeeper.tmr.com>
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
To: netfilter@lists.netfilter.org

I have news servers which are seeing a high load caused by a few users who
are opening sockets and closing them at a high rate, issuing one command
per connect.

I know how to limit overall connection rate, and how to limit connections
per IP, but is there a per-IP rate limiting patch or method? I am trying
to avoid impacting other users, so the solution must be done on each IP.

-- 
bill davidsen <davidsen@tmr.com>
  CTO, TMR Associates, Inc
Doing interesting things with little computers since 1979.


