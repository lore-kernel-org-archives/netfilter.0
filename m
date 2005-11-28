From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: Howto redirect internet traffic from local machine back to local
 machine?
Date: Mon, 28 Nov 2005 14:02:56 +0530
Message-ID: <438AC0B8.5030603@india.tejasnetworks.com>
References: <20051128075525.GA11446@keksy.local>
	<33022.213.27.158.85.1133166020.squirrel@66.118.183.110>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 6C0C673D00; Mon, 28 Nov 2005 08:20:38 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id 22A11740C6; Mon, 28 Nov 2005 13:50:33 +0530 (IST)
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
To: ruben@ruben.cn
Cc: netfilter@lists.netfilter.org

also traffic from local machine doesn't pass through PREROUTING chain. 
add this rule to OUTPUT chain of NAT table.

ruben@ruben.cn wrote:

>   REDIRECT
>       This  target  is only valid in the nat table, in the PREROUTING and
>OUTPUT chains, and user-defined chains which are only called from
>those chains.
>       It alters the destination IP address to send the packet to the
>machine itself (locally-generated packets are mapped to the
>127.0.0.1 address).   It
>       takes one option:
>
>       --to-ports port[-port]
>              This  specifies a destination port or range of ports to use:
>without this, the destination port is never altered.  This
>is only valid if the
>              rule also specifies -p tcp or -p udp.
>
>- Ruben
>
>>Hi!
>>
>>Unfortunately i did not find a proper answer on the web although i googled
>>around for quite a lot of time:
>>
>>I want to analyse a malware on my computer. The malware connects to a
>>lot of sites on the internet (hard coded in the program but unfortunately
>>these IPs are encrypted).
>>
>>I know the port the program wants to connect to and i want to answer its
>>requests by a script on the same machine.
>>
>>I tried this for a test to catch connections to mail servers:
>>
>>echo 1 > /proc/sys/net/ipv4/ip_forward
>>iptables -t nat -F
>>iptables -t nat -A PREROUTING -p tcp -d ! 192.168.100.0/24 --dport 25 -j
>>DNAT
>>                --to 127.0.0.1:25
>>
>>But it does not work:
>>
>>$ telnet mail.gmx.net 25
>>Trying 213.165.64.21...
>>Connected to mail.gmx.net.         <--- of course, that's not my box
>>Escape character is '^]'.
>>220 {mp027} GMX Mailservices ESMTP
>>
>>I assume the problem has something to do that the packets are generated
>>on the "iptables-machine". Unfortunately, i only have this machine and
>>thus
>>i cannot send the packets through a second firewall-machine.
>>
>>I would be very happy if any kind soul could give me a hint!
>>
>>Thanks in advance,
>>Martin.
>>
>>
>
>
>
>


-- 
If you are good, you will be assigned all the work.  If you are real good, you will get out of it




