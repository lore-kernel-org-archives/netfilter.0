From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: excellent rule archive
Date: Mon, 22 Dec 2003 07:37:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072096662.2076.323.camel@grendel>
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
To: netfilter <netfilter@lists.netfilter.org>

Greets all,

I figure Bill is too shy to point out all the excellent work he's done,
but I thought list members would find it interesting. ;-)

Check out Bill's firebrick project:
http://www.stearns.org/firebricks/

Firebrick is a set of independent modules that are designed to plug-in
to an iptables firewall. Some of the cooler modules:

* Filter legal but unallocated source IPs (common in spoof attacks)
* Identify probing based on inbound scan patters as well as outbound
unreachables
* Check/record/drop odd packet sizes (like non-terminal fragments
smaller than 512 bytes).
* Filter out all loose and strict source route packets
* When suspicious patterns are detected, drop and log all traffic from
that IP for 30 seconds
* Log SSH traffic using non-stand ports (other than 22/TCP)
* Record internal servers by monitoring outbound SYN/ACKs

There are others, but you get the idea. IMHO there are some extremely
useful tweaks up there that people can use.

HTH,
C

 


