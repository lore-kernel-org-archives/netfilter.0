From: Jarek Poplawski <jarkao2@o2.pl>
Subject: Re: Where the de-SNAT actually takes place?
Date: Wed, 23 Aug 2006 14:06:23 +0200
Message-ID: <echgam$1au$1@sea.gmane.org>
References: <44E74CA0.9080808@gazeta.pl> <echf05$tib$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <echf05$tib$1@sea.gmane.org>
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
To: netfilter@lists.netfilter.org

On 23-08-2006 13:43, Jarek Poplawski wrote:
> On 19-08-2006 19:38, longraider wrote:
>> Hi
> ...
> variant (so called BA - Before PREROUTING - After POSTROUTING), which in 

or rather:
variant (so called BA - Before nat in PREROUTING - After nat in 
POSTROUTING) ...

Jarek P.


