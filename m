From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: MARK and ! question
Date: Thu, 26 Jun 2003 17:19:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFB0EF8.3080909@gmx.de>
References: <3EFAF50E.3050200@is.lg.ua> <3EFB0886.9060000@gmx.de> <3EFB0D17.8030601@is.lg.ua>
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
To: Ruslan Spivak <alienoid@is.lg.ua>
Cc: netfilter <netfilter@lists.netfilter.org>


1. Paket arrives at mangle/POSTROUTING
2. Paket jumps from POSTROUTING chain to setmark chain
3. When the the pakets' source is _not_ 193.220.70.0/27 the paket
   will return to mangle/POSTROUTING and continue traversal.
4. When the the pakets' source is _not_ 193.108.240.0/22 the paket
   will return to mangle/POSTROUTING and continue traversal.
5. So now we have pakets neither coming from 193.220.70.0/24
   nor from 193.108.240.0/22. And those pakets are MARKED with
   the value 107.

Hope this is enough for you ;-)

Have a nice day

Sven



Ruslan Spivak wrote:

> Sven Schuster wrote:
>
>>
>> What about using a user-defined chain like this:
>>
>> iptables -t mangle -N setmark
>> iptables -t mangle -A setmark -s ! 193.220.70.0/27 -d 193.220.70.32/27 \
>>         -j RETURN
>> iptables -t mangle -A setmark -s ! 193.108.240.0/22 -d 
>> 193.220.70.32/27 \
>>         -j RETURN
>> iptables -t mangle -A setmark -j MARK --set-mark 107
>> iptables -t mangle -A POSTROUTING -j setmark
>>
>> Hope this helps
>>
>> Sven
>
>
> Thanks for your reply.
> And can you describe how packet traverses such chain?
> Thanks in advance,
> Ruslan
>


