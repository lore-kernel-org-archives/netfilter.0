From: Feizhou <feizhou@linuxmail.org>
Subject: Re: over a 1,000,000,000 individual ips to block
Date: Mon, 28 Jun 2004 22:14:00 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E027A8.9080402@linuxmail.org>
References: <20040624145732.25300.qmail@team.outblaze.com>       <20040628064501.3bab3f3c@mgalepc.utilitran.com>    <42481.194.102.197.244.1088427899.squirrel@www.as.ro>    <40E01ED9.6050607@linuxmail.org> <45879.194.102.197.244.1088430724.squirrel@www.as.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <45879.194.102.197.244.1088430724.squirrel@www.as.ro>
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
To: Alex Sirbu <alex@as.ro>
Cc: netfilter@lists.netfilter.org

Alex Sirbu wrote:
>>Alex Sirbu wrote:
>>
>>>For blocking pourposes why don't you use blackholes ?
>>>I have a webserver that is permanently under DoS attacks , so I use blackholes.
>>>
>>>Routing table can have million of rules or static routes, so is not a problem .
>>>
>>>Let's say you want to block ip 11.22.33.44 . just type :
>>>
>>>#ip route add blackhole 11.22.33.44/32
>>>
>>>and all packets to 11.22.33.44  will be discarded.
>>
>>All packets to 11.22.33.44 is discarded...but will 11.22.33.44 be able
>>to generate a connection socket?
> 
> 
> if you put a blackhole to destination, all pakets to that ip addres will get "Network is
> unrecheable" so a TCP connection will never be established.

So if my problem was that 11.22.33.44 was taking up all my SMTP 
connections, doing ip route add blackhole 11.22.33.44/32 means that all 
my ACK's get discarded silently and if the blackhole was done locally 
the processes just get a EINVAL error. So basically MY processes have to 
wait for a timeout. What I'd rather achieve is that the SYN from 
11.22.33.44 not even get through.

Looks like it's still something for iptables.

