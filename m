From: "Miguel Amador L." <amador@puc.cl>
Subject: Re: How to block MSN messenger?
Date: Thu, 20 May 2004 02:39:26 GMT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040520023926.67738.qmail@smtp.puc.cl>
References: <1084999531.2868.109.camel@kenneth.intracol.net>
            <20040519173706.2be5532a@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040519173706.2be5532a@mgalepc.utilitran.com> 
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

blocking destination port 1863 you don't block all msn conections, you must 
be filter http conections, that have special mime-type called 
"application/x-msn-messenger"
(i don't remenber if just ), for this, you can use iptables string match (i 
don't be secure) or you can use Squid as transparent proxy for outgoing http 
conections (i be secure)
example of block of MSN with Squid (this block only http conections from 
MSN) 

acl mi_intranet src 192.168.1.0/255.255.255.0
acl msn req_mime_type -i ^application/x-msn-messenger
http_access deny mi_intranet msn
http_access allow mi_intranet 

with this and block dport 1863 you are with all right 


Sorry for my bad English
Best Regards
 Miguel 


Michael Gale writes: 

> 
> Make the wbe only accessible through squid and use a access rule that blocks
> gateway.dll request. 
> 
> Michael. 
> 
> 
> On Wed, 19 May 2004 15:45:32 -0500
> Kenneth Andresen <kenneth@cancun.net> wrote: 
> 
>> Hello all, 
>> 
>> I need to block MSN instant messenger, but so far without any luck. 
>> 
>> Anyone having a good iptable rule to stop MSN Instant Messenger to be
>> allowed through our server? 
>> 
>> Best regards, 
>> 
>> Kenneth 
>> 
>>  
>> 
>>  
>> 
>> 
>  
> 
> -- 
> Michael Gale
> Network Administrator
> Utilitran Corporation 
> 
 

