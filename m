From: Bgs <bgs@bgs.hu>
Subject: Re: syn DDoS attack solution
Date: Fri, 01 Jun 2007 17:37:06 +0200
Message-ID: <46603D22.4020608@bgs.hu>
References: <465EF582.4070904@bgs.hu> <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
	<465FEA82.709@bgs.hu> <007101c7a45d$bc50e380$34f2aa80$@COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <007101c7a45d$bc50e380$34f2aa80$@COM>
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
To: Ric Messier <kilroy@WasHere.COM>
Cc: netfilter@lists.netfilter.org


Sorry if my first mail was misleading, I only slept about 5-6 hours this 
week in all :/

>> How is the handling of ESTABLISHED connections implemented in the
>> TCP/IP
>> stack?
> 
> There is likely a timer somewhere to time out connections that are just
> hanging around doing nothing. You'd have to dig around to find it and turn
> it down. You could also use something like tcpkill to get rid of them for
> you. 

What I'd like to achieve is different from the normal tcp timeouts. I 
only want a different (quite short in terms of everyday tcp traffic) 
timeout for connections that have not sent any data after the tcp 
handshake. The connections that did any traffic would become normal or 
'legitimate' and the usual tcp timeouts would apply.


About the netlink approach, here is what I was thinking about. I have 
never coded in the netlink/netfilter space so I'm completely in the dark 
if this can be done at all or not:

Client sends SYN to server. It arrives to the firewall. An info is sent 
to the userspace portion and the SYN packet is DROPed. The user space 
program logs the SYN packet and sends out an appropriately constructed 
SYN/ACK to the client. Client sends the ACK. The info is sent to util 
which logs the packet and puts the connection in allowed state as it 
knows from it's own db that the tcp handshake was ok. At this point it 
either starts the next phase or waits for the first data packet and 
starts the next phase then (allowing the data packet after it). The next 
phase is: userland replays the SYN handshake with the server thus making 
it receptive to the tcp stream to come. Through netlinks firewall part 
it would allow all subsequent traffic.

The main point is almost identical to the syn proxy thingie in bsd and 
ios, the main difference would be the ability to add some policy about 
when and how to let the traffic through to the server. For example with 
delayed replay, connections in ESTABLISHED state but without data would 
be dropped from the replay db stopping the culprit at the firewall.

Just a thought... can it be done (technically) or should I simply go to 
bed :)

Regards
Bgs




