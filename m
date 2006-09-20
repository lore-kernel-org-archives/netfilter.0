From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Simple question about ipset
Date: Wed, 20 Sep 2006 14:54:04 +0800
Message-ID: <022d01c6dc81$8ff1d3c0$0100a8c0@newlife>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I have been reading ipset from http://ipset.netfilter.org/features.html
quite a few times but still do not understand what does it mean
by this :-

    iptables -A FORWARD -m set --set servers dst,dst -j ACCEPT

My question is why the flag is dst,dst ?

And similarly what is the significance if it is src,dst ?
What if it is src,dst,dst and so on ?

Regards





