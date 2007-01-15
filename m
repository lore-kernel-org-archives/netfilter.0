From: Anil Gunturu <anil@mistletoetech.com>
Subject: tcp conn tracking
Date: Sun, 14 Jan 2007 21:14:21 -0800 (PST)
Message-ID: <29495170.198881168838061557.JavaMail.root@smtp1.mistletoetech.com>
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
Does the tcp connection tracking reorder and reassemble the tcp data. I am particularly interested in how ip_conntrack_ftp works, if the tcp data for port commnad comes in two different out-of-order segments.
Thanks,
-Anil

