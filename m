From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: quick question re: natting
Date: Fri, 21 Nov 2003 10:58:44 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57A69@OST_EXCH_USR5>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there

I've got ADSL ppp0 facing the net, at x.x.x.47 [as part of a x.x.x.46/29
subnet], and I want to do static NAT for hosts 48,49 and 50.

I have a quick question, and my Ziegler book is at home at the moment.  Back
in the days when I worked with Checkpoint, I would have had to have ARPed
48, 49 and 50 onto the external interface via the operating system, for the
one-to-one static NAT to work.  Do I need to ARP the IP addresses onto ppp0
under Linux / iptables also?

This is a Linux RH9 / ADSL WAN connection / iptables situation.

Thanks in advance for any answers!

Steve


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


