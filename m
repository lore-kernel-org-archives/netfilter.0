From: Gianni Pucciani <gp.puccio@tin.it>
Subject: Re: opening connection for Tomcat
Date: Thu, 08 Apr 2004 19:55:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40759205.4000005@tin.it>
References: <40756C19.3010606@tin.it> <006f01c41d86$c82d6d60$51a2fea9@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006f01c41d86$c82d6d60$51a2fea9@heretic>
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
To: Alexis <alexis@tpys.com.ar>, netfilter@lists.netfilter.org


Alexis wrote:

>you must change to OUTPUT the first rule at least. you're filtering all
>outgoing packets.
>  
>
? The output chain has the ACCEPT policy, no packets are filtered, isn't it?

Gianni

>
>----- Original Message ----- 
>From: "Gianni Pucciani" <gp.puccio@tin.it>
>To: <netfilter@lists.netfilter.org>
>Sent: Thursday, April 08, 2004 12:13 PM
>Subject: opening connection for Tomcat
>
>
>  
>
>>Hi all,
>>I was in trouble opening a port for services with tomcat:
>>Is this rule right? I'm behind an adsl router that forward every
>>connection on port 8080 to <myprivateip>.
>>
>>iptables -P INPUT DROP
>>iptables -P OUTPUT ACCEPT
>>iptables -P FORWARD DROP
>>
>>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>iptables -A INPUT -p tcp -d <myprivateip> --dport 8080 -s 0.0.0.0 -m
>>state --state NEW -j ACCEPT
>>
>>
>>
>>
>>    
>>
>
>
>
>  
>


