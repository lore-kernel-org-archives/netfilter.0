From: David Graves <dgraves@go2guys.com>
Subject: Source-based routing and DNAT
Date: Fri, 14 Jun 2002 16:31:35 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0A7CD7.2000204@go2guys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Ok, first of all, I know that this question has been asked before, and 
I've seen some of the workarounds, but as far as I have read, this 
problem apparently remains unsolved.

I have a firewall with two internet connections. I use source-based 
routing as described in the section 4.2.1 of the Advanced Routing & 
Traffic Control HOWTO to ensure that the correct next-hop is chosen for 
outgoing packets. This much works well.

The problem arises when I use a DNAT'ed connection to an internal 
webserver. Using tcpdump I see that the syn+ack packet from the 
webserver is un-NAT'ed correctly, but sent to the wrong next hop. 
Something happens that prevents my "ip rule" from triggering.

Please do not reply and tell me that I can simply use a different 
internal IP address to correspond to the different external IP address. 
This is the "common workaround" and it is not acceptable for my purposes.

Does anyone have the right answer to this? Does "PREROUTING" not mean 
pre-routing? Or is the ip rule that selects a route table run before 
PREROUTING?

Even if the answer is, "it can't be done", can anyone definitively say 
so and why?

Thanks for your great work guys!
-David Graves




