From: Zoilo <zoilo@xs4all.nl>
Subject: PREROUTING traffic counters
Date: Wed, 03 Sep 2003 23:32:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F565DF5.2000601@xs4all.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

OK, only the first packet of a new connection passes through the 
PREROUTING chain.

So what does the byte counter in that chain actually count? Is it only 
the amount of bytes in the first packets (that travelled through the 
chain), or is it the total amount of bytes?

Z.


