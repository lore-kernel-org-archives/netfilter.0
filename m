From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: I need some clarification about multiple ISPs...
Date: Fri, 01 Sep 2006 10:06:23 -0500
Message-ID: <44F84C6F.8080506@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello, a colleague and I are at a minor disagreement that I believe NetFilter Mailing List subscribers will be able to clarify.

The situation is I have a client who has (will once they are activated) two internet connections through two different providers.  Either connection will work just fine by it's self.  I also believe that I can use both connections simultaneously with client initiated traffic just fine.  What I perceive as a problem will be if someone (myself) initiates an inbound connection (SSH) to either of the connections.  If the system is configured to use ISP 1 as the default and the connection is targeted at the IP for the ISP 2 interface, where will the connections traffic go back out from?  I am of the opinion that I will need to mark the traffic that comes in on at least one of the interfaces to make sure that said marked traffic goes back out the correct interface.

More specifically I suspect that  will have two (sub) routing tables in addition to the main routing table.  Have the system use the main routing table for all client side initiated out bound (and related) traffic.  Mark traffic that comes in the interface for ISP 1 such that the returning outbound traffic will be directed to use the ISP 1 routing table.  Mark traffic that comes in the interface for ISP 2 such that the returning outbound traffic will be directed to use the ISP 2 routing table.

Any thought(s) / opinion(s) / suggestion(s) are welcomed and appreciated.



Grant. . . .

