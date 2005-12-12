From: "Gene Dellinger" <gene@poh.com>
Subject: RE: FORWARD Chain Question
Date: Mon, 12 Dec 2005 11:46:09 -1000
Message-ID: <BOEKIIIKCIBKDMDMHHLLAEHGDFAA.gene@poh.com>
References: <BOEKIIIKCIBKDMDMHHLLEEHFDFAA.gene@poh.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BOEKIIIKCIBKDMDMHHLLEEHFDFAA.gene@poh.com>
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

To All:
I got some helpful information, thanks to those who responded, I am still a
bit fuzzy though.
A packet coming in ETH0 destined for a system connected to ETH1, will that
packet begin in the PREROUTING
chain on ETH1(sample 1) and then out or go to the FORWARD chain(sample 2)
and then out.

ETH0:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |	           |            |
       INPUT  	     |         OUTPUT
         |	          \|/	      |
      Local Process    |         Local Process
		           |
	   ----<---<-----|
	   |
        \|/
ETH1:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |			            |
       INPUT  		          OUTPUT
         |			            |
      Local Process		   Local Process

sample 1
_________________________________________________________

ETH0:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |	           |            |
       INPUT  	     |  	   OUTPUT
         |	          \|/	      |
     Local Process     |         Local Process
		           |
		           |
		           |
		          \|/
ETH1:PREROUTING---->FORWARD---->POSTROUTING---->OUT
         |			            |
       INPUT  		          OUTPUT
         |			            |
     Local Process		 Local Process

sample 2
_________________________________________________________


Thanks Again
Gene D.


-----Original Message-----
From: Gene Dellinger [mailto:gene@poh.com]
Sent: Friday, December 09, 2005 2:40 PM
To: netfilter@lists.netfilter.org
Subject: FORWARD Chain Question


On a multi-homed machine being used as a firewall, if
a packet is forward'd from one interface to another.
Does the packet enter the in at PRE-ROUTING portion of iptables
chain again for that interface? It may seem obvious but
I just want to make sure I am clear on that aspect of the
chain traversal.

Thanks
Gene D.

