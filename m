From: "Paul M. Goorskis" <pmg@rimako.lv>
Subject: kernel oops in ip_refrag
Date: Mon, 30 Aug 2004 13:19:48 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4132FF44.4010000@rimako.lv>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

My box recently (about 2 months ago) started to fall into a "Kernel 
Oops!" state.
*EIP* points to the *ip_refrag* function.
Kernel version: 2.4.20, 2.4.21
Netfilter version: 1.2.7a

The box has run successfully for about half a year without any oops, but 
now it happens regulary.



