From: =?ISO-8859-1?Q?J=F6rg_Esser?= <jackfritt@boh.de>
Subject: Re: length match problem
Date: Thu, 09 Jan 2003 08:53:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1D2A66.6040503@boh.de>
References: <3E1CA2BF.6050707@boh.de> <200301091039.44259.fabrice@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301091039.44259.fabrice@netfilter.org>
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
To: netfilter@lists.netfilter.org



Fabrice MARIE wrote:

>Hello Joerg,
>
>On Thursday 09 January 2003 06:14, Jackfritt wrote:
>  
>
>>Ok I have the following problem.
>>iptables -A OUTPUT -o ppp0 -p tcp -m length --length :40 -j MARK --set-mark 10
>>That should mark all ACK's or not ?
>>When I try to do this I get the error:
>>iptables: Invalid argument
>>[...]
>>So now my question is what am I doin wrong ?
>>    
>>
>
>Typically when the only error message from iptables
>is 'Invalid Argument', the actual error message would
>be most of the time in the kernel log.
>i.e. If I run your command above, it tells me
>
># dmesg
>MARK: can only be called from "mangle" table, not "filter"
>  
>
Hmm forget to look there (Just a newbie ;)

>So, you should be using a -t mangle in front..
>  
>
Thx that did it.

>Have a nice day,
>  
>
You too.



