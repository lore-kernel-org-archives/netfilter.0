From: Feizhou <feizhou@linuxmail.org>
Subject: Re: over a 1,000,000,000 individual ips to block
Date: Tue, 29 Jun 2004 19:43:30 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E155E2.5010306@linuxmail.org>
References: <20040629110452.30056.qmail@team.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040629110452.30056.qmail@team.outblaze.com>
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
To: Timothy Webster <timothyw@outblaze.com>
Cc: Michael Gale <michael.gale@utilitran.com>, netfilter@lists.netfilter.org


>  
> Limited maximum connections and a simple accept established 
> help, but we need more. Currently looking into modify 
> the set patch to handle this large number. 
> If not iptables then openbsd pf. 

that's why you are looking into ipset....i asked a similar question a 
while ago...need to check to see if there is a 2.6.x version out now.
>  
> We do get up to 100 smtp connections from a simple ip during peak times. 
>  
> 
>>	If you allow a simple IP to make a 100 smtp connections to your 
> 
> mail server 
>  
> 
>>then you have other problems. Why you would allow any IP to make more 
> 
> then 10-15 
> 
>>connections is beyond me. Also .. if you set a error limit (example 
> 
> mine is 5) 
> 
>>when that limit is reached the smtp and tcp connection are dropped.  

postfix does not have per ip connection limiting and this goes for 
sendmail (if you've got a ruleset for that please post) and for 
tcpserver (qmail-smtpd)
> 
>  
> 
>>I am not saying that you should not block abusive IP's or network's at 
> 
> the 
>  
> 
>> 
>>Also what about ESTABLISHED connections ??? If you do not use a 
> 
> ESTABLISHED 
> 
>>state -j ACCEPT at the top ... then each IP would then in theory have 
> 
> to match 1 
> 
>>million rules every time it came in. 
>> 
>>I am sure there is a better answer then to create 1 million iptable 
> 
> rules.  
> 

Which is why Timothy is asking about ipset/ippool functionality.

