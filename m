From: Martin <martin@balkanboy.net>
Subject: Incoming netmeeting through NAT?
Date: Sun, 16 Mar 2003 00:16:45 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303160010501.1789-100000@balkanboy.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all. I compiled Mr. Kadlecsik's H323 NAT/conntrack module (I'm not sure
why he calls it "ALPHA" when the thing has been out and working for a
while now :), and got my NetMeeting from behind RedHat Linux 8.0 NAT box
to work for outgoing calls.

I am curious, is it also possible to set up iptables to also receive 
NetMeeting calls and route them to the internal LAN PC that has NetMeeting 
running(listening) for incoming calls? Does anyone have these rules as 
they are on his PC and could you please post them or send them to me 
privately?

Thank you in advance,
Martin


