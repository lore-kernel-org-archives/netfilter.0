From: Doug Yeager <doug@mortonfarms.com>
Subject: snooping port 25 packets
Date: Mon, 04 Oct 2004 18:07:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4161C991.1070705@mortonfarms.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

i would like to use netfilter to snoop SMTP packets on my firewall.
has anybody done this?  is it possible?
i was leaning in the direction of trying to use the QUEUE target for 
user space processing.....but i'm not sure if that is the way to go.
once i send the packet to the QUEUE target, how do i put it back on the 
wire?
what i really want is a copy of each packet to port 25 sent to a user 
space program.

thx,
doug


