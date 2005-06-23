From: radu <radu@adm.utm.md>
Subject: Re[2]: Help!!!
Date: Thu, 23 Jun 2005 16:06:41 +0300
Message-ID: <1759161889.20050623160641@adm.utm.md>
References: <14209331.20050623145054@adm.utm.md>
	<200506230714.24471.rob0@gmx.co.uk>
Reply-To: radu <radu@adm.utm.md>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506230714.24471.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello /dev/rob0,

ok.
      I modify the rule
>> iptables -I FORWARD -i eth1 -o eth0 -m state
>> --state ESTABLISHED,RELATED -j ACCEPT      
      in
>> iptables -I FORWARD -i eth1 -o eth0 -d 192.168.50.0/24 -m state
>> --state ESTABLISHED,RELATED -j ACCEPT      
     and this don't work...

[23/Jun/2005 16:00:34] "Network" action = 'denied',
descr = 'Unopened port', proto = 6, laddr = 192.168.50.101,
raddr = 217.132.77.214, lport = 2276, rport = 4662,
direc = 'in', ruleId = 0, proc = 'N/A'
     
     Q. why rule don't work ?
     Q. why this packages with flag ESTABLISHED come to me?





Thursday, June 23, 2005, 3:14:24 PM, you wrote:

dr> On Thursday 23 June 2005 06:50, radu wrote:
>> why I'm receiving on my PC  packages  with external ip on
>> 4690,4544,4581.. ports???

dr> That would be me. I was trying to lure you into posting something on
dr> this list. ;)

>>   Internet -> linux box -> My PC(192.168.50.101)
>>
>>   linux box
>>   eth0 local 192.168.50.0/24
>>   eth1 Internet
>>
>>   my iptables config:
>>
>> iptables -P FORWARD DROP

dr> good

>> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 4662 -j DNAT
>> --to 192.168.50.101

dr> 4662/tcp packet arriving at the external interface should have their
dr> destination changed to Radu's computer ...

>> iptables -I FORWARD  -d 192.168.50.101 -p tcp 
>> --dport 4662 -j ACCEPT

dr> ... and those packets should be accepted.

>> iptables -I FORWARD -i eth1 -o eth0 -m state 
>> --state ESTABLISHED,RELATED -j ACCEPT

dr> Any replies to established or related connections arriving at the 
dr> external interface, destined to the internal interface, should be 
dr> accepted.

dr> This is surely the rule letting those in. Check the connection tracking
dr> table when you see them come in.



-- 
Best regards,
 radu                            mailto:radu@adm.utm.md


