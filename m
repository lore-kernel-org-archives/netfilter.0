From: Leonid Veytser <veytser@cs.bu.edu>
Subject: NF_QUEUE target and ip_queue.c
Date: Tue, 11 Nov 2003 17:55:01 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311111752590.29271-100000@csa.bu.edu>
References: <200311112212.hABMCmj17939@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311112212.hABMCmj17939@agate.rockstone.co.uk>
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

Could someone explain this from ip_queue.c at ipq_mangle_ipv4 function:

/*
 * Extra routing may needed on local out, as the QUEUE target never
 * returns control to the table.
 */

Thanks.


