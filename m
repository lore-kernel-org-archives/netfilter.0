From: Nicole Haehnel <nicole.haehnel@epost.de>
Subject: Re: Ping and traceroute denied?
Date: Wed, 18 Feb 2004 11:43:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403341EE.7010803@epost.de>
References: <40332D1F.5010806@epost.de> <1077096635.2333.92.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077096635.2333.92.camel@raylinux.internal>
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

Hi,

it works!
Now I have to teach this fwbuilder.

Thanks!

Nicole


Ray Leach schrieb:

>On Wed, 2004-02-18 at 11:15, Nicole Haehnel wrote:
>  
>
>>Hi,
>>
>>I added this rules (with fwbuilder):
>>
>>$IPTABLES -A FORWARD -p icmp  -m state --state NEW  -j ACCEPT
>>$IPTABLES -A OUTPUT -p icmp  -m state --state NEW  -j ACCEPT
>>$IPTABLES -A INPUT -p icmp  -m state --state NEW  -j ACCEPT
>>
>>
>>Why was ping from an interface of my firewall-host denied?
>>Traceroute too.
>>
>>    
>>
>When the return packets come back, their state is not NEW, probably
>RELATED.
>
>  
>
>>What rule shall I add?
>>
>>    
>>
>$IPTABLES -A INPUT -p icmp  -m state --state NEW,RELATED  -j ACCEPT
>
>  
>
>>Thanks!
>>
>>Nicole
>>    
>>



