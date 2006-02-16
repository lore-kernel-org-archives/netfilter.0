From: ulisses <ulisses.alonso@rediris.es>
Subject: stateless UDP DNAT/REDIRECT in 2.6 possible?
Date: Thu, 16 Feb 2006 10:58:10 +0100
Message-ID: <20060216095810.GA12287@tux.rediris.es>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello

is there a way to do stateless DNAT or REDIRECT in linux kernel 2.6?
(in my case I'm using 2.6.8)

I have an unidirectional UDP flow I would like in which I would like
to unconditionally rewrite destination port. I think my current
DNAT/REDIRECT trials have not been sucessfully because of the
statefull nature of netfilter.

Any comment or suggestion will be greatly appreciated

Thanks in advance

	Ulisses



