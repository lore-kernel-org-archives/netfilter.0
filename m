From: "Jeff Cordova" <jqcordova@yahoo.com>
Subject: POSTROUTING, ROUTING, & Traffic Control
Date: Sun, 16 Feb 2003 21:06:52 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PPENJEBLIPFFNCAMFNJKEEAJCIAA.jqcordova@yahoo.com>
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
To: netfilter@lists.netfilter.org

I have 2 machines (A & B) behind a Linux Firewall (FW).
I have 2 ethernet cards on the FW - eth0 talks to the internet, eth1 talks
to machines A & B.
Machine A has lots of inbound & outbound traffic while machine B doesn't.
It seems reasonable that I could add 2 new ethernet cards (eth2 & eth3) to
the FW and by configuring iptables and/or routing tables force traffic on A
to be handled by eth0/eth1 and traffic for B to be handled by eth2/eth3.

Can I do this? If possible, please give explicit details.

Thankyou,

Jeff Cordova


