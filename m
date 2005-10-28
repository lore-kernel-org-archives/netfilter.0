From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: why can't use connlimit ??
Date: Fri, 28 Oct 2005 19:15:52 +0200
Message-ID: <20051028172106.ABA796A8D7@smtp.sterenborg.info>
References: <200510281133.14216.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510281133.14216.rob0@gmx.co.uk>
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

>> I also find it strange that you do have a .so, but not a .ko file.
> 
> The .so is iptables(8)'s library (SO="shared object). The .ko
> is a kernel 2.6.x kernel module. Never having compiled

Yes I knew that (although I didn't mention this).
I just think it's strange that compiling iptables would produce a .so
file when compiling the kernel does not produce an accompanying .ko file
(except maybe when ipt_connlimit is not compiled as module, but that is
something we don't know ;-))


Gr,
Rob


