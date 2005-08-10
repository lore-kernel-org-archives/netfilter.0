From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: event sequence: QoS + 2.6sec ?
Date: Wed, 10 Aug 2005 06:55:59 -0500
Message-ID: <20050810115559.GA12617@pog.tecnopolis.ca>
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

I'm using HTB QoS and 2.6sec (native 2.6 ipsec w/setkey) simultaneously. 
What is the sequence of events for an outgoing packet?  I'm thinking the
2.6sec gets applied dead last, after the QoS scheduling has been done?  Or 
does QoS get applied twice for a 2.6sec packet because it goes through 
egress twice?

I could find no documentation on this subject, and it's actually quite 
important when using both together.

