From: David Harel <hareldvd@ergolight-sw.com>
Subject: Re: How to block sending mail from local network.
Date: Sun, 08 Feb 2004 11:39:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <402603BA.1060006@ergolight-sw.com>
References: <4024C335.7080705@ergolight-sw.com> <20040207201511.GA2097@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040207201511.GA2097@zion.homelinux.com>
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

Thanks,

This works great.

Sven Schuster wrote:

>Hi David, 
>
>On Sat, Feb 07, 2004 at 12:51:33PM +0200, David Harel told us:
>  
>
>>Hi all,
>>
>>
>>I tried a command:
>>$IPTABLES -A OUTPUT -p TCP -i $LAN_IFACE -s $LAN_IP_RANGE --dport smtp 
>>-j DROP
>>but it did nothing.
>>    
>>
>
>This will only stop traffic generated on your gateway. To stop traffic
>going _through_ the gateway you will need to put this rule in the
>FORWARD rule instead of OUTPUT, so replace OUTPUT with FORWARD, you
>might try something like this:
>
>$IPTABLES -A FORWARD -p tcp --dprt 25 -i $LAN_IFACE -o $EXT_IFACE \
>	-j REJECT --reject-with tcp-reset
>
>HTH
>
>Sven
>
>  
>
>>What can I do to block those messages sending attempts?
>>
>>-- 
>>Thanks.
>>
>>David Harel,
>>
>>    
>>
>
>  
>

-- 
Thanks.

David Harel,

==================================

Home office +972 4 6921986
Fax:        +972 4 6921986
Cellular:   +972 54 534502
Snail Mail: Amuka
            D.N Merom Hagalil
            13802
            Israel
Email:      hareldvd@ergolight-sw.com



