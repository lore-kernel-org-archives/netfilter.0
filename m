From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: Altering a packet's port
Date: Mon, 21 Mar 2005 15:43:44 -0500
Message-ID: <00c501c52e56$acbe6070$bf07a8c0@civicXp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all !

I have a quite "standard" setup as follow :

192.168.7.x/24 -> iptables/router  SNAT --to-source a.b.c.d  -> internet

What I want to do, is that if a packet originites from the local net 
(192.168.7.x) on tcp port 22, that the final destination of the packet would 
wtill be the same host, but on port 8022...

Like this :

Normal :

192.168.7.1 ssh to f.g.h.i on port 22

the connection is :

192.168.7.1:sport -> f.g.h.i:8022

Is it possible ?

I've tried with REDIRECT, but it afects the destination of the packet, but I 
don't want that...

Thanks,

Nicolas 


