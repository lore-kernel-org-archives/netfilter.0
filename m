From: Scott Johnson <sjohnson@maillist.edina.k12.mn.us>
Subject: SNAT help
Date: Wed, 9 Apr 2003 10:47:01 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304091046430.19561-100000@eccweb1.edina.k12.mn.us>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I apologize if this message appears twice... I got a bounce on it the 
first time.

I'm new to iptables so I very much appreciate any help I can get.

I've been digging through information for about 1.5 weeks now and got most 
things to work, however I'm stumped on one thing...

I've got masquerading going on for the 3000+ work stations I have in 
house.  In addition, I've got some good basic firewalling going on, I'm 
still working on the rules, but I'm happy they're working as well as they 
are.

Now, I've got a few PC's that need a different public IP address from the 
masses.  So I'm trying to assign a static NAT to these.  When I assign the 
static nat rule, it never gets used.

For example:

eth0 - internal
eth1 - dmz
eth2 - external

iptables -t nat -A POSTROUTING -s 10.1.3.35/32 -o eth2 -j SNAT --to 
1.2.3.4
(where 1.2.3.4 is the public address that I'm assigning)
ip address add 1.2.3.4 dev eth2

creates a rule that looks like:

   0     0 SNAT       all  --  *      eth2    10.1.3.35            
0.0.0.0/0          to:1.2.3.4

When I go check my ip address at an external site, I keep getting the 
public interface IP address.

Again, any and all help is MUCH appreciated.

Thanks!
  Scott 




