From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Memory leak problem
Date: Fri, 27 Sep 2002 18:07:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D948244.1040407@fugmann.dhs.org>
References: <7F2740B50D94FD4B9EAF9AAC33016C3C45382C@lascar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jean Cantarutti <jcantarutti@subtel.cl>
Cc: netfilter@lists.netfilter.org

Jean Cantarutti wrote:
> Hi, im using iptables 1.2.5 on a HP machine working like firewall, it 
> has 512 MB of RAM and every 30 seconds eats 6 kb of RAM, in 48 hours 
> only left 8300 kb of available RAM.
Do remember that unused ram is used for disc cache and buffers, so 
watching top does not give nessesarly an accurate picture of how ram is 
used.

Could you please describe why you think that iptabels/netfilter has a 
memory leak? Also printouts og memory usage would help us understand 
what is happening.

Btw. What kernel are you using?


Regards
Anders Fugmann



