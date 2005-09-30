From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Redirect Packets From Interface in Promiscuous Mode
Date: Fri, 30 Sep 2005 23:14:44 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0509302303200.31223@filer.marasystems.com>
References: <BAY103-F1196E31E9B15B6E3F0E4E1968F0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F1196E31E9B15B6E3F0E4E1968F0@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Rodre Ghorashi-Zadeh <rodrico7@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 30 Sep 2005, Rodre Ghorashi-Zadeh wrote:

> Hi Henrik,
>
> Thanks for your response. Going down the path of your recommendation b) 
> below, it raises a few questions for me.
>
> 1) If I put the "sniffing" interface in promiscuous mode, can I not get 
> iptables to grab traffic that is not destined for the host it is running on? 
> For example, if the Production SQL servers IP address is 192.168.1.1, and my 
> Linux based management station's IP address is 192.168.1.2, and the Test 
> MySQL servers IP address is 192.168.1.3, can I not have a rule that say 
> something like:
>
> iptables -t nat -I PREROUTING -i eth0 -p tcp -d 192.168.1.1 --dport 3306 -j 
> REDIRECT --to 192.168.1.3

With some additional tricks you can do this, but it won't accomplish what 
you are trying to do. This will either result in a lot of extra network 
traffic, or total failure to communicate.

> I guess my question is how can I get iptables to grab traffic that is not 
> destined for any of the IP addresses on the host system?

Use ebtables or divert to make make the packets directed to the host. 
Iptables will then pick them up.

> 2) How am I going to stop the return traffic/SQL results from being returned 
> to the original client?

You won't even get that far. Either the TCP setup will fail completely, or 
only the production server will decode it properly.

What you describe above is NOT alternative 'b'.

>> b) Use a MySQL proxy via iptables REDIRECT and send each query to both 
>> servers. This requires the intercepting box to be between the old server 
>> and the network. Main drawback is that the source IP seen by the old server 
>> will be changed to the address of the proxy.
>>

To clarify:

To do 'b' the network needs to look like

                                   /--- test server
                                  /
[clients] -> Intercepting box --x
                                  \
                                   \--- production server


On the interception box you use a custom written mysql proxy which not 
only sends the received query to the production server but also echoes it 
to the test server. iptables REDIRECT is used to deliver the requests 
received from the clients to the proxy instead of the production server.



In alternative 'a' the situation is slightly differetn

             (mirror port)
                  /--- Sniffer -> Test server
                  |
[clients]  -> Switch -> Production server


On the sniffer you need to run some sniffing software which does stream 
reassembly of the MySQL traffic and then resends these as MySQL queries to 
the test server. iptables is not involved at all.



In both cases some programming is required. It is not just a simple case 
of making the corret iptables rule.


Regards
Henrik

