From: Chris Gniady <gniady@ecn.purdue.edu>
Subject: nat hangs the system
Date: Tue, 17 Sep 2002 13:55:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D877A87.701@ecn.purdue.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,
I am trying to setup iptables in linux 2.3.99 running on strongarm. I 
have compiled the modules and the iptables modules load fine. When I try 
to load the nat module it hangs my system. I am not setting any rules at 
this point simply loading a module. If the network cable is 
disconnected, no network traffic, it works but as soon as it sees about 
50 messages the nat module hangs my system. Any idea what is wrong and 
how to fix it.
Thank you,
Chris


