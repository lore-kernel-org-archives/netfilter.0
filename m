From: "Joe McEachern" <joe@qacafe.com>
Subject: RTSP alg
Date: Wed, 3 Nov 2004 16:00:39 -0500
Message-ID: <E1CPSFp-0000Jp-00@deer.gmane.org>
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
To: netfilter@lists.netfilter.org



I've been looking at the behavior of the RTSP alg extension. When it parses
a RTSP Transport that contains a RTP/AVP/UDP port range, it creates a
conntrack update for the RTP port (low port), but not the RTCP port (high
port). This prevents the server side from sending RTCP sender reports. 


+    case pb_range:
+        for (loport = prtspexp->loport; loport != 0; loport += 2) /* XXX:
improper wrap? */
+        {
+            t.dst.u.udp.port = htons(loport);
+            if (ip_conntrack_change_expect(exp, &t) == 0)
+            {
+                hiport = loport + ~exp->mask.dst.u.udp.port;
+                DEBUGP("using ports %hu-%hu\n", loport, hiport);
+                break;
+            }
+        }
+        if (loport != 0)
+        {
+            rbuf1len = sprintf(rbuf1, "%hu", loport);
+            rbufalen = sprintf(rbufa, "%hu-%hu", loport, loport+1);
+        }
+        break;


It looks like RTSP clients can still function without this behind a NAT
device - at least real player.

Has anyone created a setup that is allowing RTCP packets from the server to
the client?

Regards,

Joe




