From: "Jesse Gordon" <jesseg@nikola.com>
Subject: IP port over 65535 ?!
Date: Wed, 26 Apr 2006 17:18:06 -0700
Message-ID: <013701c66990$0e9cc500$5e00800a@printserver>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter <netfilter@lists.netfilter.org>

I sometimes see a port number like this in Tcpdump:

10.0.0.76.2049 > 64.x.x.5.796094310: reply ERR 394

64.7.197.5.791752241 > 10.0.0.76.2049: 1460 proc-170106..

Ever seen anything like this?

I'm a small natting ISP -- all of the above looks good except that port 
number of 791752241..

Thanks!

-Jesse Gordon


Nikola Engineering Inc.
224 W. Washington St.
Suite 104
Sequim, WA 98382-3371
Tel  (360)582-1051
Fax (360)582-1104




