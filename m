From: Andrew Beverley <andy@andybev.com>
Subject: Re: Connlimit and linux-2.6.17
Date: Wed, 19 Jul 2006 23:45:27 +0100
Message-ID: <44BEB607.3000408@andybev.com>
References: <44BEA42B.3000304@andybev.com>
	<Pine.LNX.4.64.0607200026310.4015@bizon.gios.gov.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0607200026310.4015@bizon.gios.gov.pl>
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
To: Krzysztof Oledzki <olenf@ans.pl>
Cc: martin.bene@icomedias.com, netfilter-devel@lists.netfilter.org, netfilter@lists.netfilter.org, kraxel@bytesex.org

>> I (and others, see netfilter list) are having trouble compiling kernel 
>> 2.6.17.4 and iptables-1.3.5-20060508 to use connlimit. Once compiled 
>> in and I run:

<snip>

> Yes, the API was changed in 2.6.17, so small fixes are required to allow 
> extensions to work. I'm currently traveling a lot so connlimit & TARPIT 
> is still on my TODO list. I'm going to finish it ASAP but with limited 
> GPRS/EDGE access it is not so simple.

Many thanks. I do not envy you working through GPRS - very tedious!

Will it still be a patch or is it possible to get it in the stable kernel?

Andy Beverley


