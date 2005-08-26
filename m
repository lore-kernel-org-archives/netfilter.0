From: Damon Gray <dgray@internap.com>
Subject: Re: Limit
Date: Fri, 26 Aug 2005 17:24:42 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0508261722430.14997@dgray-test.acs.internap.com>
References: <20050826145640.A122EA5CAC9@smtp.orbitel.bg>
	<002d01c5aa7e$191a1c70$0300a8c0@office>
	<430F842A.8060501@riverviewtech.net> <430F8983.5000006@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430F8983.5000006@lopsch.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Daniel Lopes <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org


There is a way with connlimit to limit from all IPs, add a 
--connlimit-mask 0


On Fri, 26 Aug 2005, Daniel Lopes wrote:

> Taylor, Grant schrieb:
>> Take a look at the connlimit match extension.
>> 
>> iptables -t filter -A INPUT -i ${WAN} -d ${WANIPAddress} -p tcp --dport 
>> 3333 -m connlimit --connlimit-above 10 -j DROP
>> 
>> 
>> 
>> Grant. . . .
>> 
>> Lyubomir Louisov wrote:
>> 
>>> So how can i limit the number of connections on port 3333 to no more than 
>>> 10
>>> at a time with iptable?
>>> Is it posible?
>> 
>> 
>> 
>> 
> I first thought about the same thing. But that will allow more than 10 
> connections in total. It will allow only 10 connections per IP but afaik in 
> total it can then be alot more than 10 depending on the IPs connecting. Don't 
> know how you can limit it to 10 connections in total but there must be a way 
> with so much options being available for iptables ;). Please correct me if I 
> am wrong.
>
>
>

