From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: Logging default drop
Date: Thu, 8 Apr 2004 19:02:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040408170259.GL10272@home.manuelm.org>
References: <200404072134.30328.Antony@Soft-Solutions.co.uk> <000a01c41d86$ee20b2c0$0464a8c0@stu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000a01c41d86$ee20b2c0$0464a8c0@stu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Stuart Lamble <stu@gateway10.homeip.net>  8. Apr 04:
> Hi All

Hello,

> iptables -A INPUT -j LOG --log-prefix "IN-DEfault-drop "
> 
> I then tail my messages file and get a LOT of the following....
> 
> [logged packet]
> 
> The SRC address is ofter different.

This is normal.

> What does this mean?

Congratulation, you catched a ping.  For complete description read
<URL:http://logi.cc/linux/netfilter-log-format.php3>.  And please, don't
toppost.

HTH,
 regards, Frank.
-- 
Sigmentation fault

