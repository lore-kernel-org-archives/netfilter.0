From: Kenneth Porter <shiva@sewingwitch.com>
Subject: No PREROUTING for OUTPUT?
Date: Sun, 17 Oct 2004 12:54:11 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <5FCB4E67C52322BD4ABBF882@[10.0.0.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users <netfilter@lists.netfilter.org>

Can anyone confirm that the PREROUTING chain is absent from the OUTPUT 
packet path? I wanted to tag my UDP packets with TOS Minimize-Delay so that 
they'd go in my high-priority traffic shaping queues, but if PREROUTING 
isn't used in the output path, the packets can't be tagged until after 
they've been through the shaper. (Isn't the shaper part of "routing 
decision" in the diagrams?)

