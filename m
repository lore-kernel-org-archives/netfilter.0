From: Ruslan Spivak <alienoid@is.lg.ua>
Subject: Re: MARK and ! question
Date: Thu, 26 Jun 2003 18:11:19 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFB0D17.8030601@is.lg.ua>
References: <3EFAF50E.3050200@is.lg.ua> <3EFB0886.9060000@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFB0886.9060000@gmx.de>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org

Sven Schuster wrote:

>
> What about using a user-defined chain like this:
>
> iptables -t mangle -N setmark
> iptables -t mangle -A setmark -s ! 193.220.70.0/27 -d 193.220.70.32/27 \
>         -j RETURN
> iptables -t mangle -A setmark -s ! 193.108.240.0/22 -d 193.220.70.32/27 \
>         -j RETURN
> iptables -t mangle -A setmark -j MARK --set-mark 107
> iptables -t mangle -A POSTROUTING -j setmark
>
> Hope this helps
>
> Sven

Thanks for your reply.
And can you describe how packet traverses such chain?
Thanks in advance,
Ruslan

>
>
> Ruslan Spivak wrote:
>
>> Hello.
>>
>> I need to mark with value 107 packets that are going NOT from the 
>> 193.220.70.0/27 network and NOT from the 193.108.240.0/22 network.
>> Is it possible?
>>
>> Below two lines seem not to work properly because second rule won't 
>> be reached.
>>
>> iptables -t mangle -A POSTROUTING -s ! 193.220.70.0/27 -d 
>> 193.220.70.32/27 -j MARK --set-mark 107
>>
>> iptables -t mangle -A POSTROUTING -s ! 193.108.240.0/22 -d 
>> 193.220.70.32/27 -j MARK --set-mark 107
>>
>> Your help is very, very appreciated.
>>
>> Best regards,
>> Ruslan
>>
>>
>>
>



