From: <g_netfilter@netfids.com>
Subject: Oracle SQL *Net and NAT
Date: Fri, 7 Mar 2003 18:53:06 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <11701.200.48.228.60.1047084786.squirrel@www.netfids.com>
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

Dear friends,

I need to put a Oracle Server 7 in a DMZ with private address, and do NAT.
I had read that is necesary an ALG for SQL *Net, because it uses dynamic
ports and embedded ip/ports numbers. Is there any open source proxy or ALG
that could work with netfilter? If the answer is no, how could I solve the
problem using netfilter and/or other open source tools?

Regards,

Geffrey



