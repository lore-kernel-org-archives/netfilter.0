From: Ruslan Spivak <alienoid@is.lg.ua>
Subject: Re: MARK and ! question: one more question
Date: Fri, 27 Jun 2003 12:52:15 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFC13CF.6050502@is.lg.ua>
References: <Pine.LNX.4.44.0306271035100.28942-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0306271035100.28942-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

Chris Wilson wrote:

>Hi Ruslan,
>
>  
>
>>Can you help me to construct logic: (from src1 OR from src2) AND 
>>dst=some_dst_addr THEN mark packet with 108
>>Possible form: (from src1 OR from src2 OR from src3 OR ... and so on) 
>>AND dst=some_dst_addr THEN mark packet with 108
>>    
>>
>
>That's easy:
>
>iptables -
>
>iptables -t mangle -N setmark
>iptables -t mangle -A setmark -j MARK --set-mark 107
>iptables -t mangle -A POSTROUTING -s src1 -d dst1 -j setmark
>iptables -t mangle -A POSTROUTING -s src2 -d dst1 -j setmark
>iptables -t mangle -A POSTROUTING -s src3 -d dst1 -j setmark
>
>  
>
>>Can you give me an example with above networks? - i mean packets with
>>(src=193.220.70.0/27 or with src=193.108.240.0/22) and 
>>dst=193.220.70.32/27 will be marked with 108.
>>    
>>
>
>Just substitute whatever addresses you want into the above.
>
>Cheers, Chris.
>  
>
Do below lines the same? :

iptables -t mangle -N setmark
iptables -t mangle -A setmark -s src1 -d dst1 -j MARK --set-mark 107
iptables -t mangle -A setmark -s src2 -d dst1 -j MARK --set-mark 107
iptables -t mangle -A setmark -s src3 -d dst1 -j MARK --set-mark 107
iptables -t mangle -A POSTROUTING -j setmark

Thanks in advance,
Ruslan





