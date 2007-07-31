From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: getting iptables into embedded kernel
Date: Tue, 31 Jul 2007 09:57:13 +0200
Message-ID: <01a301c7d348$67dd9770$0b0ffe0a@NS006819>
References: <4244373FF2155241B4AEDE42D89F665DDB8430@MSGCELMBX.ent.bhicorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4244373FF2155241B4AEDE42D89F665DDB8430@MSGCELMBX.ent.bhicorp.com>
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

> How to get iptables into a ppc kernel (2.6, netfilter
> enabled) and where to store what to have functionality from the
> start?
> I used NO_SHARED_LIBS=1
> I am able to download start the kernel, but do not find iptables.

AFAIK you cannot.
Iptables is a *user*space utility to configure the Netfilter framework
and I don't see how you'd compile that into the kernel.


Rob



