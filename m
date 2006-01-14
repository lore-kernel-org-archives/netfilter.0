From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: How to disable mIRC Chat
Date: Sat, 14 Jan 2006 20:59:56 +0200
Message-ID: <43C94A2C.4050901@gmail.com>
References: <20060114182550.35278.qmail@web60913.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060114182550.35278.qmail@web60913.mail.yahoo.com>
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

Gabriel wrote:

>On Sat, 14 Jan 2006 15:17:33 +0200, Myanmar Linux Boy
>wrote:
>
>  
>
>>Dear All,
>> I am new to linux.
>> I want to disable chat with iptables so that nobody can
>>    
>>
>use chat with
>  
>
>>mIRC with   LAN. Because every students are chatting all
>>    
>>
>the time.
>  
>
>> I am using Red Hat 9 and Squid.
>> They use port 443 and 6667 to chat with mIRC
>> How can I write firewall rules.
>>    
>>
>
>iptables -A FORWARD -p tcp --dport 6660:6669 -j DROP would
>do, but, considering IRC servers also run on other ports,
>you should do:
>
>iptables -A FORWARD -p tcp -m multiport --destination-port
><insert random ports separated by comma here>
>
>443 is used by https, so I don't think you should block it.
>An IRC daemon would not normally run on that port.
>
>
>  
>
Maybe best match will be achieved with l7-filter.sf.net

