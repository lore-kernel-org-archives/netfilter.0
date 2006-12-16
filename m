From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: is it possible to nat to the routed IP?
Date: Sat, 16 Dec 2006 09:05:35 +0100
Message-ID: <000f01c720e8$f75b5d50$0202fea9@tanjian>
References: <ad41208c0612152147n28f6cf31lf7da7da68a1a0565@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ad41208c0612152147n28f6cf31lf7da7da68a1a0565@mail.gmail.com>
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

>> Packet arrives at 210.153.22.y.
>> Packet is DNAT-ed to 192.168.2.208.
>> Gateway sends packet to 192.168.5.202.
>> Router at 192.168.5.202 routes packet to 192.168.2.208.
>> 
>> Example, http:
>> 
>> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>> $ipt -A FORWARD -m state --state NEW -d 192.168.2.208 \   -p tcp
>> --dport 80 -j ACCEPT 
>> 
>> $ipt -t nat -A PREROUTING -d 210.153.22.y -p tcp --dport 80 \   -j
>> DNAT --to 192.168.2.208 
>> 
>> 
>> Grts,
>> Rob
> 
> Now another issue is pop up:
> 
> 210.153.22.x is Internet gateway IP, 210.153.22.y is a public ip for
> publish 192.168.3.208. ofcs, from Internet traffic to 192.168.3.208,
> is go through 210.153.22.y. But in the another hand all the traffic
> from 192.168.3.208 to outside, it will go to 210.153.22.x, could it
> be a possible go via 210.153.22.y under some protocols? How to
> configure? 

That would depend on your rules at the gateway.

Taking http as example again.
A http connection is made to the server at destination port 80/tcp. This
is a grep of what it looks like using netstat -ant:

Proto Recv-Q Send-Q Local Address    Remote Address   State
tcp        0      0 172.16.2.254:80  172.16.2.1:1191  ESTABLISHED 
tcp        0      0 172.16.2.254:80  172.16.2.1:1190  ESTABLISHED 

So, return packets are coming from source port 80/tcp.
I think this is what you want:

$ipt -t nat -A POSTROUTING -s 192.168.2.208 -p tcp --sport 80 \
  -j SNAT 210.153.22.y
$ipt -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT 210.153.22.x

Packets from 192.168.2.208:80 are SNAT-ed to 210.153.22.y and all other
packets are SNAT-ed to 210.153.22.x.


Gr,
Rob


