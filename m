From: Dean Gakis <phiz@shaw.ca>
Subject: Clearing ip_conntrack table
Date: Fri,  6 Jun 2003 15:36:31 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054935391.3ee1095fac554@phiz.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Is there a way of clearing ip_conntrack table other then attempting to unload
the module (almost always unsuccessfully)?  I have a dual ISP setup using
CONNMARK and iproute2, but when I have a script fail over the default gateway to
the backup ISP, the entires in the ip_conntrack are still forwarding sessions to
the wrong interface since they are marked in the conntrack.  This continues
until the timers expire in the table and they are flushed out.  Is there anyway
of clearing the table similar to pfctl -F state on BSD?


