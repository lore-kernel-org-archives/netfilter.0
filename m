From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Fedora Core 2. Port Forwarding Problems (nfcan: addressed to exclusive sender for this address)
Date: Sun, 25 Jul 2004 19:48:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040725234837.GA11886@salty>
References: <4101D6BD.8040904@mail.ru> <200407241555.16611.Antony@Soft-Solutions.co.uk> <4102C2A3.5090007@mail.ru>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4102C2A3.5090007@mail.ru> (from "=?UTF-8?B?0JLQsNGB0LjQu9C40Lkg0KHQstC40YDQuNC00L7Qsg==?=  - netspider@mail.ru<+nfcan+jimlaur+c1d788382f.netspider#mail.ru@spamgourmet.com> <netspider@mail.ru>Organization" on Sat, Jul 24, 2004 at 16:12:19 -0400)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="utf-8"
To: netfilter@lists.netfilter.org

On 2004.07.24 16:12, "=?UTF-8?B?0JLQsNGB0LjQu9C40Lkg0KHQstC40YDQuNC00L7Qsg==?=   
- netspider@mail.ru<+nfcan+jimlaur+c1d788382f.netspider#mail.ru@spamgourmet. 
com> <netspider@mail.ru>Organization" wrote:
> 
>> On Saturday 24 July 2004 4:25 am, Василий Свиридов wrote:
>>  
>>> I've installed fedora core 2 and tried to reuse my old settings i
>>> retained from redhat9 system.
>>> 
>>> Masqeurading works fine, but when i try to do port forwarding like this
>>> iptables -t nat -A PREROUTING -p tcp -d <domainname.com> --dport 80 -j
>>> DNAT --to 192.168.20.40:80
>>> rule adds itself fine, but port 80 is not accessible from outside.
>>  
>>> when i try to connect from outside it doesn't say connection refused, it
>>> dies after a timeout.
>>> /proc/net/ip_conntrack doesn't show any presence of connection, I tried
>>> to send it to -j LOG & ULOG but both end up empty.
>>>
>>
> iptables -L -nvx doesn't contain any rules yet.

Vasily, you have not told us what the default polity for the filter
table is. In the absence of any rules, the default policy controls
the behavior. Might this policy be DROP?
Perhaps the default policy has changed between versions.

Hope this helps.

Jim

