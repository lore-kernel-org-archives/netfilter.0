From: Brian Atkins <batkins@tlcdelivers.com>
Subject: Http connections left in FIN_WAIT1...
Date: Wed, 25 May 2005 11:19:48 -0700
Message-ID: <4294C1C4.3090307@tlcdelivers.com>
References: <4294256F.2060007@konabi.de>
	<20050525124104.GA16703@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050525124104.GA16703@bender.817west.com>
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

I am in the process of testing connectivity through my firewall.  I have 
a server on my inside network that is being natted at the firewall from 
a public address to our internal, private address space (rfc1918).  
Using a box from the outside (www), I am able to connect to the server 
(ala links2).  The data transfer starts and I get the message "Received 
0 B of 1.4 kB, avg 0 B/s ...", but it times out after a couple of 
minutes.  On the server side, I see the connection being established, 
but stops at FIN_WAIT1.  Internally, the page displays just fine on a 
box very similar to the external box.

Iptables, at the moment, only has rules to allow specific ports (80,443) 
from the outside with a state of NEW, ESTABLISHED, or RELATED. Going 
back the other way, pretty much everything is allowed with an 
ESTABLISHED, or RELATED state.  I don't have any rules doing tcp resets, 
only accept or log/reject.

Brian

