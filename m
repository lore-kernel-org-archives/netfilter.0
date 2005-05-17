From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: udp connection tracking
Date: Tue, 17 May 2005 11:53:41 -0500
Message-ID: <428A2195.8090308@riverviewtech.net>
References: <005b01c55af6$1db40980$3c01a8c0@ts.communitytrust.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005b01c55af6$1db40980$3c01a8c0@ts.communitytrust.ca>
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

> 1.) first the client will choose any random port over 1064 to use for the
> outgoing connection, lets use 1379 for this example.
> 2.) the client will send a udp packet from port 1379 to the listening port
> on the server which is always 5739.
> 3.) the server receives the packet, then chooses a random available port of
> its own, lets use 1184 for this example.
> 4.) the server sends a single udp packet with a src port of 1184 to the dst
> port 1379 of the client.
> 5.) after this single packet described in step 4, all the traffic between
> the client and server happen between ports 2222 and 5739.

This is an interesting problem.

> Now, my problem is when i want to connect as a client, i have no way of
> knowing what port the server will choose to send that single packet (step 4
> above).  I also can't guess what port my client will use (step 1 above). All
> the other packets are fine because i can always expect a src or dst port
> with 5739.  This single packet is causing all my connection attempts to
> fail.

What?  Is your psyche not working?  :P

> Is there anything i can try besides forwarding all udp traffic to the
> client?

Maybe....

I think that you might be able to do something with the recent match extension.  Seeing as how I don't have the WSWE8 game I can't test this for you.  But the idea behind it is to add the destination (IP) address of your initial packet to the server on UDP port 5379 to a recent set named WSWE8.  Subsequently any inbound UDP traffic will be checked against the recent set named WSWE8 to see if the source address is that of the server that you sent to less than 60 seconds ago.

iptables -t filter -A FORWARD -i ${LAN} -o ${INet} -p udp --sport 1024:65535 --dport 5379 -m recent --set --name WSWE8 --rdest -j ACCEPT
iptables -t filter -A FORWARD -i ${INet} -o ${LAN} -p udp -m recent --rcheck --seconds 60 --name WSWE8 --rsource -j ACCEPT

Seeing as how this one packet is the one that is troubling you I think you should fairly easily be able to integrate these rules in to your existing firewall.  Give these rules a try and see if they work for you.  If they do work for you (A - please let me know) try replacing the "--rcheck" parameter in the 2nd rule with "--remove" as this will remove the source IP from the WSWE8 recent set thus preventing any one else from doing any funny business with you.  :)



Grant. . . .

