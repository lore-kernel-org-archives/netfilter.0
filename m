From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: patch netlink
Date: Fri, 25 Oct 2002 12:36:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c27c12$61563390$0401000a@robbysan.org>
References: <004d01c27be9$9ff51270$0814a8c0@yy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004d01c27be9$9ff51270$0814a8c0@yy>
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
To: netfilter@lists.netfilter.org

>     I use kernel 2.4.18,patch-o-matic-20020825.I patch the
> kernel with netlink and nfnetlik-ctnetlink-0.11 successful.
> Then I install the iptabel-1.2.7a successful. When I make a
> new kernel image: make bzImage, the error is occured. It said:

I too had problems (not specifically this one, but still) using the
2.4.18 kernel, but not when I used the 2.4.19 kernel. If you're bold,
try a 2.4.20pre kernel, but not for a production kernel.
Maybe the problem goes away if you switch to 2.4.19 (do you *need*
2.4.18 ?).


Rob


