From: Kiran Kumar Immidi <immidi@spymac.com>
Subject: Re: Simple sk_buff question
Date: Tue, 30 Nov 2004 09:17:41 +0530
Message-ID: <200411300917.41815.immidi@spymac.com>
References: <09BEF1EC-41A1-11D9-B8CC-000A957B2B6C@inf.ufrgs.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <09BEF1EC-41A1-11D9-B8CC-000A957B2B6C@inf.ufrgs.br>
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
To: Roberto Jung Drebes <drebes@inf.ufrgs.br>, netfilter@lists.netfilter.org

On Monday 29 November 2004 06:23, Roberto Jung Drebes wrote:

> Should I call kfree_skb(clone_skb) after the ip_rcv(), or will the
> cloned sk_buff be freed when it reaches upper level protocols?

  I cant vouch for it, but IMO, the socket buffers get queued into the 
appropriate socket, and is freed only when it has been read(). So, you wont 
have to kfree_skb().

-- 
Regards,
Kiran Kumar Immidi


