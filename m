From: dir@att.net
Subject: IPtables, QUEUE target and connection-tracking...
Date: Wed, 13 Aug 2003 14:26:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19mwaX-0002R3-AR@kashyyyk.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Any pointers on how connection-tracking interacts (or doesn't !) with queuing 
up to userland?

I would like to queue up de-fragged ICMP, UDP and TCP messages up to userland 
so that I can render a verdict on them.

Is this possible/plausible given a 2.4.20 kernel (RH9)?

Thanks, dir


