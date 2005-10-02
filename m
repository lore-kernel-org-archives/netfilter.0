From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Redirect Packets From Interface in Promiscuous Mode
Date: Sun, 02 Oct 2005 20:56:07 +0200
Message-ID: <43402D47.3030004@chello.at>
References: <BAY103-F251017FCAC7E12DA438E6C968C0@phx.gbl>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F251017FCAC7E12DA438E6C968C0@phx.gbl>
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
Cc: Rodre Ghorashi-Zadeh <rodrico7@hotmail.com>



Rodre Ghorashi-Zadeh wrote:
> Hello List,
> 
> I have a problem that I am hoping someone can help me with. I am 
> currently conducting some load testing on a test MySQL server that is 
> destined to replace our current production MySQL server. What I want to 
> do is send our current MySQL traffic, in real time, to the test MySQL 
> server to measure the load in comparison with our current production 
> MySQL server.
> 
> What I have done so far is setup port mirroring on the switch that is 
> shared by the Production MySQL server, the test MySQL server, and my 
> Linux based management station, with the Linux based managment station 
> sniffing the mirrored port of the Production MySQL server.
> 
> I am able to see the MySQL traffic going to the production MySQL server 
> using tcpdump. For a next step what I want to be able to do is have 
> iptables sniff the port (I set the interface into promiscuous mode using 
> ifconfig), grab all packets that are destined for my Production MySQL 
> server from the mirrored port, rewrite the source IP address to be my 
> Linux based management stations IP address and rewrite the destination 
> address to be my Test MySQL Servers IP address. I don't really care 
> about the MySQL results returned to tthe Linux based management station, 
> they can go to /dev/null for all I care, but I want to see the queries 
> going through the Test MySQL server.
> 
> I am pretty familiar with iptables but the two problems that I 
> see/foresee are: getting iptables to grap traffic from the interface in 
> promiscuous mode that are not destined for the Linux based Management 
> station, and, properly setting up the TCP/IP sessions, between the Test 
> MySQL Server and the Linux Based Management Station.
> 
> If what I am doing is not possible can anyone give me some advice on how 
> to achieve what I am trying to do (send queries in realt time from my 
> Production MySQL server to my Test MySQL Server)?
> 
> ~Rodre

Hello,

I think there may be a way that would not require programming, and would 
be quite easy to setup. It's theoretical, so not tested, if it would 
really work.

All that is needed is an arp poisoning tool and a few iptables rules.
If you install an arp poisoning program i.e. ettercap at your testing 
mysql server, and use it to establish one way poisoning, traffic will go 
through your testing system and will be transparentely redirected to 
your production server. Now if you us the iptables MIRROR target (i 
think it's so called) on your testing server to redirect the mysql 
queries to localhost, your testing mysql db should receive exactly the 
same queries as the production one. This only works, if iptables  can 
match traffic which does not hat the local IP as destination. But i 
guess it should be able, or asking different, why not?
Now your production server answers all queries as normal, but the 
testing server will also answer. To face this, I think the best would be 
to use either ettercap filters, or to simply drop the packets from the 
testing server using an iptables rule with a source MAC address match.
The only disadvantage I can see is, that the testing server will only 
receive queries as fast as the production server, as clients can only 
reply when the production server answers.

I hope this is understandable and even more I hope it will work.

Regards
Mart

