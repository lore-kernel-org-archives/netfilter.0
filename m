From: Paolo Rossi <paolo_76@inwind.it>
Subject: SNAT multicast packet
Date: Mon, 07 Feb 2005 09:46:10 +0100
Message-ID: <42072AD2.4090509@inwind.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,


I have a trouble with netfilter. I need to perform a SNAT to outgoing multicast packet. Multicast packet come from 
private network and i can't annunce this private source network in my routing domain. Because my network manage 
multicast traffic with PIM-SM protocol and PIM perform RPF (reverse path forwarding), the clients can't see the 
multicast traffic. I've read that netfilter don't support multicast SNAT, why?

Is there someone can hel me?


Thanks


Best wishes


Paolo

