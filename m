From: Wenzhuo Zhang <wenzhuo@zhmail.com>
Subject: Re: internal host can not access hotmail
Date: Thu, 24 Feb 2005 14:09:51 +0800
Message-ID: <421D6FAF.8070207@zhmail.com>
References: <f7e5481105022104583d0d3b19@mail.gmail.com>	
	<421A9F1F.5080906@zhmail.com>
	<f7e5481105022306175a6b09dc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <f7e5481105022306175a6b09dc@mail.gmail.com>
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

Yuwen Dai wrote:
>>Probably you're encoutering the Path MTU Discovery problem. There are
>>serveral solutions to this problem.
>>
>>1. Lower the MTU of the network interface of your internal host.
>>
>>2. Use the clamp-mss-to-pmtu feature of iptables:
>>    # iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS \
>>         --clamp-mss-to-pmtu
> 
> 
> Thank you.  I used this rule to solved the problem.

You are welcome. Actually, the three methods are not really solutions; 
they are workarounds. The real solution is to fix the broken firewalls 
on the Internet, which incorrectly block vital ICMP traffic.

-- 
Wenzhuo Zhang <wenzhuo@zhmail.com>  GnuPG Key ID 0xBA586A68
Key fpr: 89C7 C6DE D956 F978 3F12  A8AF 5847 F840 BA58 6A68

