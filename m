From: "James Miller" <jimm@simutronics.com>
Subject: Dropping SYN with FIN flag set
Date: Tue, 21 Oct 2003 10:47:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com>
Reply-To: <jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi folks.. sorry if this is a really dumb question.. please don't flame me
too much.

Nessus is always alerting on  "Remote host does not discard TCP SYN packets
which have the FIN flag set".  What is the best way to close up this hole?
Is there a global rule I could setup or do I need to set this on a per rule
basis?

something like '-p tcp --tcp-flags SYN,FIN -j DROP'





Thanks,
Jim



