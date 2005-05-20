From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables
Date: Fri, 20 May 2005 08:26:00 +0200
Message-ID: <20050520062444.028A38EDCEB@smtp.sterenborg.info>
References: <20050520060303.34BE88EDCEB@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050520060303.34BE88EDCEB@smtp.sterenborg.info>
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
To: 'Netfilter' <netfilter@lists.netfilter.org>

>> Would it be safe to set the OUTPUT default policy to ACCEPT?
>> Every time I set it to DROP I get locked out, I suppose it
>> has to do with the fact that I have no rules for the OUTPUT chain.
> 
> A lot of people set OUTPUT policy to ACCEPT.
> You can always do something like :

Forgot an important rule.. :

> $ipt -P OUTPUT DROP

$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

> $ipt -A OUTPUT -p tcp --sport 1024: -j ACCEPT
<...>


Gr,
Rob


