From: Martijn Lievaart <m@rtij.nl>
Subject: Re: How to combine a few  addresses?
Date: Tue, 11 Sep 2007 14:01:43 +0200
Message-ID: <46E683A7.70604@rtij.nl>
References: <643555.29298.qm@web60319.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <643555.29298.qm@web60319.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly <vitaly_il@yahoo.com>
Cc: netfilter@lists.netfilter.org

Vitaly wrote:
> How I can combine a few addresses in one rule? For
> example, I'd like to add two IPs 10.10.10.1 and
> 10.10.10.2 to the same rule.
>
>   

Either use ipset (needs a patched kernel), or iprange (if the addresses 
are consecutive) or use a subchain, e.g:

-A -s 10.10.10.1 -j CUSTOM
-A -s 10.10.10.2 -j CUSTOM
-N CUSTOM
-A CUSTOM <rest of rule>


HTH,
M4


