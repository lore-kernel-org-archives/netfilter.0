From: Nguyen Dinh Nam <64vn@cardvn.net>
Subject: new values in conntrack
Date: Tue, 18 Jan 2005 15:08:31 +0700
Message-ID: <41ECC3FF.2040800@cardvn.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've just upgraded to 2.6.10, and I see that conntrack is now tracking 
"packets" and "bytes" of connections. It's very cool, but I don't know 
how to use these values with iptables because both connrate and 
connbytes POM can't apply, and connlimit used to work fine with 2.6.8.1 
but with 2.6.10, it applied cleanly but can't compile. There are few 
other problems with various POMs,  most of them are mentioned in the 
2004 workshop
http://www.netfilter.org/documentation/conferences/nf-workshop-2004-summary.html
so I just want to know the schedule - when they'll be available to the 
users?


