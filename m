From: Jason Opperisano <opie@817west.com>
Subject: Re: Problems with connection
Date: Mon, 13 Sep 2004 17:18:49 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095110328.1899.26.camel@wolfpack.ljm.dom>
References: <20040913210115.54459.qmail@web50202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040913210115.54459.qmail@web50202.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-09-13 at 17:01, Giancarlo Boaron wrote:
> 11:22:09.252058 IP_client.2611 > IP_server.3456: S
> 9014409:9014409(0) win 8192 <mss 1460,nop,nop,sackOK>
> (DF)
> 11:22:09.327363 IP_server.3456 > IP_client.2611: S
> 1138155720:1138155720(0) ack 9014410 win 65535 <mss
> 1460,nop,nop,sackOK> (DF)
> 11:22:09.327650 IP_client.2611 > IP_server.3456: . ack
> 1 win 8760 (DF)
> 11:22:09.410734 IP_server.3456 > IP_client.2611: P
> 1:140(139) ack 1 win 65535 (DF)
> 11:22:09.559431 IP_client.2611 > IP_server.3456: . ack
> 140 win 8621 (DF)
> 11:22:09.565804 IP_client.2611 > IP_server.3456: P
> 1:140(139) ack 140 win 8621 (DF)
> 11:22:09.656090 IP_server.3456 > IP_client.2611: P
> 140:154(14) ack 140 win 65396 (DF)
> 11:22:09.656516 IP_client.2611 > IP_server.3456: F
> 140:140(0) ack 154 win 8607 (DF)

note:  the client machine is the one initiating the closing of the
connection here.

> 11:22:09.737150 IP_server.3456 > IP_client.2611: . ack
> 141 win 65396 (DF)
> 11:22:09.737357 IP_server.3456 > IP_client.2611: F
> 154:154(0) ack 141 win 65396 (DF)
> 11:22:09.737471 IP_client.2611 > IP_server.3456: . ack
> 155 win 8607 (DF)
> 
> It means that my client can reach the server, a
> connection is established, they send some data but
> they close the connection very fast.
> Besides, it repeats this traffic about 10 times, with
> the client application changing its source port
> number, and then it returns the error messages.
> 
> Does it mean that the server is trying to start a new
> back connection to the client and my DROP policy is
> applied? (since I don't permit new incoming
> connections?)

well--if you're logging those DROP-ed packets--the logs will tell the
tale...

  iptables -A INPUT -j LOG --log-prefix "FW DROP IN: "
  iptables -A OUTPUT -j LOG --log-prefix "FW DROP OUT: "
  iptables -A FORWARD -j LOG --log-prefix "FW DROP FWD: "

(make sure those are the *last* rules in each chain)

> I read the application documents and it only says that
> I must allow outgoing traffic to and from
> X.Y.0.0/16:3456 using TCP protocol.
> 
> So, what do you think about some HELP!!!!!!!! :)

1)  log the packets you drop--it's the only way to know if you are the
problem...

2)  try doing a tcpdump on the outside interface and capture the packet
data as well:

  tcpdump -i $OUTSIDE -s 1500 -w output.cap host $SERVER_MACHINE

then open that capture file (output.cap) in something (ethereal is
nice), and if the protocol exchanges data in clear text--you may gain a
better grasp of what's going on...

-j

-- 
Jason Opperisano <opie@817west.com>


