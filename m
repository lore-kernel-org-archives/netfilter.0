From: "Richard" <richard@o-matrix.org>
Subject: timeout value
Date: Mon, 29 Nov 2004 23:03:44 -1000
Message-ID: <EINSTEINFsAitVGeSJI000061f2@einstein.systemmetrics.com>
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

Hi,

The default timeout value for a UDP connection track is 3 minutes. Is there
a way to change this only for certain ports?

For example, 3 minutes is too low for voip sip services. I'd like to change
it to 60 minutes for udp port 5060. In lieu of running a new conntrack, is
there a way to change this only for port 5060? I prefer not to change the
default udp timeout value because that would overburden the server with too
many connections.

Thanks,
Richard

