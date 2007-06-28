From: Bryan Christ <bryan.christ@hp.com>
Subject: Re: How can I forward ICMP packages?
Date: Thu, 28 Jun 2007 10:13:13 -0500
Message-ID: <4683D009.40609@hp.com>
References: <4682DE75.5040301@hp.com>
	<20070628102819.GB29575@outback.rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070628102819.GB29575@outback.rfc2324.org>
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

I think the rule below is what I needed.

Thanks Max.

Maximilian Wilhelm wrote:
> Am Wednesday, den 27 June hub Bryan Christ folgendes in die Tasten:
> 
>> I can't seem to find a rule to do this.
> 
> What exactly is your problem?
> If you actived routing or build a bridge icmp packages should be
> forwarded if you did not filter them away.
> 
> Maybe you are looking for something like this:
>  iptables -I FORWARD -p icmp -j ACCEPT
> 
> Ciao
> Max

