From: Tom Eastep <teastep@shorewall.net>
Subject: Re: cat /proc/ip_conntrack produces kernel panic
Date: Tue, 23 Mar 2004 09:53:04 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40607980.4090301@shorewall.net>
References: <405FFBF3.9060005@utanet.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <405FFBF3.9060005@utanet.at>
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
To: Leopold Aichinger <leai@utanet.at>
Cc: netfilter@lists.netfilter.org

Leopold Aichinger wrote:

> 
> What I am interested in:
> Is there anybody who had the same problem ?

There have been some reports of similar panics on the Shorewall Users 
mailing list. These are reported as panics from "shorewall show 
connections" which is a thin wrapper around "cat /proc/net/ip_conntrack".

The most recent reports were using RedHat kernels 2.4.20-28.7 and 
2.4.20-30.7

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



