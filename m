From: aoliva <aoliva@it.uc3m.es>
Subject: Packet change in OUTPUT mangle table and not being rerouted
Date: Thu, 05 Oct 2006 12:34:15 +0200
Message-ID: <4524DFA7.7050806@it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I have been trying to change the src and dst address of a packet by 
jumping to QUEUE target and modifying it via libipq (using OUTPUT chain 
in mangle table). Later this packet is accepted and I was expecting it 
to be rerouted through the correct interface but it is not, it continues 
be sent by the old interface.
Any help please?

Regards
Antonio

