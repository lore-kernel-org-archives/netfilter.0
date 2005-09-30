From: "Rodre Ghorashi-Zadeh" <rodrico7@hotmail.com>
Subject: Re: Redirect Packets From Interface in Promiscuous Mode
Date: Fri, 30 Sep 2005 19:16:38 +0000
Message-ID: <BAY103-F1196E31E9B15B6E3F0E4E1968F0@phx.gbl>
References: <Pine.LNX.4.61.0509301422140.19019@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0509301422140.19019@filer.marasystems.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hno@marasystems.com
Cc: netfilter@lists.netfilter.org

Hi Henrik,

Thanks for your response. Going down the path of your recommendation b) 
below, it raises a few questions for me.

1) If I put the "sniffing" interface in promiscuous mode, can I not get 
iptables to grab traffic that is not destined for the host it is running on? 
For example, if the Production SQL servers IP address is 192.168.1.1, and my 
Linux based management station's IP address is 192.168.1.2, and the Test 
MySQL servers IP address is 192.168.1.3, can I not have a rule that say 
something like:

iptables -t nat -I PREROUTING -i eth0 -p tcp -d 192.168.1.1 --dport 3306 -j 
REDIRECT --to 192.168.1.3

I guess my question is how can I get iptables to grab traffic that is not 
destined for any of the IP addresses on the host system?

2) How am I going to stop the return traffic/SQL results from being returned 
to the original client?

Thanks again for your help.

~Rodre


>From: Henrik Nordstrom <hno@marasystems.com>
>To: Rodre Ghorashi-Zadeh <rodrico7@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: Redirect Packets From Interface in Promiscuous Mode
>Date: Fri, 30 Sep 2005 14:29:55 +0200 (CEST)
>
>On Thu, 29 Sep 2005, Rodre Ghorashi-Zadeh wrote:
>
>>I have a problem that I am hoping someone can help me with. I am currently 
>>conducting some load testing on a test MySQL server that is destined to 
>>replace our current production MySQL server. What I want to do is send our 
>>current MySQL traffic, in real time, to the test MySQL server to measure 
>>the load in comparison with our current production MySQL server.
>
>Ok. But not at all trivial to do.
>
>>What I have done so far is setup port mirroring on the switch that is 
>>shared by the Production MySQL server, the test MySQL server, and my Linux 
>>based management station, with the Linux based managment station sniffing 
>>the mirrored port of the Production MySQL server.
>
>Ok.
>
>>I am able to see the MySQL traffic going to the production MySQL server 
>>using tcpdump. For a next step what I want to be able to do is have 
>>iptables sniff the port (I set the interface into promiscuous mode using 
>>ifconfig), grab all packets that are destined for my Production MySQL 
>>server from the mirrored port, rewrite the source IP address to be my 
>>Linux based management stations IP address and rewrite the destination 
>>address to be my Test MySQL Servers IP address.
>
>This won't work. MySQL uses TCP and you can't mirror a TCP stream like 
>this.
>
>>I don't really care about the MySQL results returned to tthe Linux based 
>>management station, they can go to /dev/null for all I care, but I want to 
>>see the queries going through the Test MySQL server.
>
>Ok. This simplifies things somewhat.
>
>Can be done in two different manners. Both requires programming.
>
>a) By sniffing and using a TCP stream reassembly tool and when a MySQL 
>query has been reassembled from the TCP stream send it to the test server. 
>Drawbacks is that TCP stream reassembly is not always reliable (packets may 
>have been dropped and a number of other complications).
>
>b) Use a MySQL proxy via iptables REDIRECT and send each query to both 
>servers. This requires the intercepting box to be between the old server 
>and the network. Main drawback is that the source IP seen by the old server 
>will be changed to the address of the proxy.
>
>Regards
>Henrik



