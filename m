From: seberino@spawar.navy.mil
Subject: why good to drop *these* TCP flag settings...?....
Date: Mon, 4 Apr 2005 23:25:53 -0700
Message-ID: <20050405062553.GA13645@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Why are these flag combos in iptables rules good to drop???



# Is the explanation for these because SYN starts a
# connection and it doesn't make sense to reset (RST)
# or terminate (FIN) at the same time your initiating (SYN)???
   --tcp-flags SYN,RST SYN,RST -j DROP
   --tcp-flags SYN,FIN SYN,FIN -j DROP

# Is this obvious in that you can't finish (FIN) and
# reset (RST) at the same time?
   --tcp-flags FIN,RST FIN,RST -j DROP

# Can these be explained by simple fact that *ALL* packets
# must have ACK set after connection established?? Is that right?
# (if yes, could we add 'ACK,RST RST' to drop list as well?)
   --tcp-flags ACK,FIN FIN     -j DROP
   --tcp-flags ACK,PSH PSH     -j DROP
   --tcp-flags ACK,URG URG     -j DROP

What would DROP rule look like to protect against Xmas tree scan?
You'd want to drop packets with FIN, PSH and URG /all/ set right?

Thanks!

Chris

