From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: minimal iptables ruleset for laptop
Date: Wed, 25 May 2005 12:18:52 +0300
Message-ID: <429442FC.8090700@hotpop.com>
References: <d6utcg$6hb$1@sea.gmane.org> <42930273.10208@hotpop.com>
	<d6v69t$3sc$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d6v69t$3sc$1@sea.gmane.org>
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

Volkm@r wrote:

>Georgi Alexandrov wrote:
>  
>
>>something like this:
>>
>>######################### start ###########################
>>
>>iptables -F
>>iptables -X
>>iptables -Z
>>iptables -t nat -F
>>iptables -t nat -X
>>iptables -t nat -Z
>>iptables -t mangle -F
>>iptables -t mangle -X
>>iptables -t mangle -Z
>>
>>iptables -P INPUT DROP
>>iptables -P FORWARD DROP
>>iptables -P OUTPUT ACCEPT
>>
>>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>iptables -A INPUT -i lo -j ACCEPT
>>iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT
>>iptables -A INPUT -p icmp --icmp-type 11 -j ACCEPT
>>iptables -A INPUT -p icmp --icmp-type 12 -j ACCEPT
>>iptables -A INPUT -p tcp --syn --dport 113 -j REJECT --reject-with tcp-reset
>>
>>############################# end #################################
>>
>>I think the above ruleset is sufficient. If you have any questions about
>>it - just ask.
>>
>>regards,
>>Georgi Alexandrov
>>
>>
>>    
>>
>
>Hi Georgi,
>Thanks a lot for your fast response. Now it looks much easier to
>understand. Now I have two more questions.
>
>1. What is the advantage of putting those "-p icmp" rules?
>2. How could I add logging (fore some time, to see what's going on)?
>
>Thanks again
>Volkm@r
>
>
>
>  
>
About the ICMP - it's good (my opinion) to let at least those three icmp 
types so we have proper network functions.
reference:  http://www.faqs.org/docs/iptables/icmptypes.html

About the logging - If you want for example to log all the auth requests 
(tcp/113) made to your machine, we will put the following rule above the 
-j REJECT one:

iptables -A INPUT -p tcp --syn --dport 113 -j LOG --log-prefix "Auth Request"
iptables -A INPUT -p tcp --syn --dport 113 -j REJECT --reject-with tcp-reset


This way we will have all auth requests logged and then rejected.
You can examine the example rc.firewall script at 
iptables-tutorial.frozentux.net for some more logging examples.

regards,
Georgi Alexandrov

