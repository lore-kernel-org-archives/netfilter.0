From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: ipset loading to/from file
Date: Tue, 3 Oct 2006 10:07:34 +0000 (UTC)
Message-ID: <011501c6ff2f$49546010$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Date: Fri, 3 Nov 2006 18:03:18 +0800
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


Shell scripts are slow, when it has to iterate over hugh
amount of data. Is there a way to load ipset data to/from files 
( as a binary blob perhaps ) so that it can be loaded quickily into the 
memory when the system re-starts ?

Cheers.






