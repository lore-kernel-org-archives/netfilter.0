From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: a problem about NAT.
Date: Thu, 25 Sep 2003 22:11:02 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309252206510.3632@xena.cft.ca.us>
References: <DEEOLEFPFOLKFJHILOGBCEEOCAAA.ChenJ@yztech.com.cn>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DEEOLEFPFOLKFJHILOGBCEEOCAAA.ChenJ@yztech.com.cn>
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
To: Chen Jian <ChenJ@yztech.com.cn>
Cc: netfilter@lists.netfilter.org

On Wed, 24 Sep 2003, Chen Jian wrote:

> There are 3 machine behind the NAT server. When the 3 machine request the
> same Web server outside, NAT use 3 different source port to distinguish
> the 3 connection.

> My problem is when the 3 machine have the same source port , how
> netfilter handle it ? I also want to know where the handle code is .
> Thanks .

I can't help with the source code reference, but I can answer the first
question.  The three machines necessarily have different IP addresses.
Connections are identified by (IP address, port), so even if they happen to
all pick the same port, they are still uniquely identified.

Similarly for returning packets after NAT: conntrack uses the same IP
address but different ports for each connection, so it can identify which
connection the replies belong to, and rewrite the destination IP and port
correctly.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

