From: "Ben Lentz" <BLentz@channing-bete.com>
Subject: IPSEC + Bridging + NAT
Date: Fri, 17 Feb 2006 20:58:00 -0500 (EST)
Message-ID: <3381.67.20.144.224.1140227880.squirrel@webmail.channing-bete.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greetings list,
I've got an IPSEC connection between two gateways, where bridging is used
on one of the gateways. It seems that when traffic is recieved over the
IPSEC tunnel by the gateway using bridging, the packets do not traverse
the POSTROUTING chain. If I remove bridging from the picture, everything
works exactly as expected.

Packets not coming over the IPSEC tunnel are processed by POSTROUTING.

Is this a known bug? Is the answer to my problem "don't do that"?

It's understandable that the system is getting confused over what is
local, what is layer 2, and what is layer 3. I believe I've read that the
bridging code and the netfilter code are pretty well patched together,
but where does the ipsec stuff live in the stack?

I believe I'm having the same problem as this gentleman:
http://www.ussg.iu.edu/hypermail/linux/kernel/0407.3/0986.html

kernel 2.6.11-1.14 (Fedora Core 3)
ipsec-tools 0.5
iptables 1.2.11-3.1



