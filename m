From: "DeWet van Rooyen" <dewet@cyberdawn.co.za>
Subject: Firewall help
Date: Wed, 11 Dec 2002 21:49:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c2a14e$7733f510$0114a8c0@CyberDawn.Net>
Reply-To: <dewet@cyberdawn.co.za>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I installed a machine with Redhat 8 and are trying to set up a iptables
firewall with 2 internal segments (DMZ and internal network).
My machine have 3 Network cards.
 
 Is this possible ?
 
 I can seem to get all the segments to see each other. Can you give me an
 idea on how to do this. Is it just a question of routes / Nat and Arp
 entries ?
 
DMZ - 192.168.1.0 / 255.255.255.0
Internal Network / 192.168.2.0 / 255.255.255.0
For the external interface, I have 64 ip addresses - 255.255.255.192

