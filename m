From: "Andrew St. Jean" <ast.000@sympatico.ca>
Subject: trying to get oddball setup to work
Date: Sat, 26 Jul 2003 09:18:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F227FBC.6000403@sympatico.ca>
Reply-To: "Andrew St. Jean" <ast.000-dated-1059657524.a03b81@sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I'm hoping someone can tell me if what I'm trying to do is possible and 
if so, how.

Here's a picture of my network topology:

machine x-------internet---------machine y-----private LAN----host a/b/c

Machine x has one interface with a public static IP.
Machine y has two interfaces, one with a public dynamic IP and the other 
with a private static IP.

Both machines x and y have iptables installed and running.
I have an ipsec tunnel (using FreeS/Wan) working between machines x and 
y. With this tunnel I can ping any of the hosts on my private LAN from 
machine x. I can also mount a shared partition from, say, host b onto 
machine x. I include this just to show that the ipsec tunnel is working.

What I want to do is use NAT to forward certain ports on machine x to 
machines on my private LAN. Right now, if I open a port in iptables on 
machine x, I can connect to machine x from the internet on that port. If 
I try to forward the port to host c, packets seem to disappear on 
machine x. I can see the packets arrive at machine x using tcpdump but 
nothing goes out again.

Thanks for any help provided.

Andrew

