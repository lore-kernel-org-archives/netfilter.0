From: bdameron@tscnet.net
Subject: Packet forwarding.
Date: Wed,  7 Apr 2004 10:00:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081357206.4074339639b86@mail.tscnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

 I have 2 linux machines. One is accessable via the outside world (Internet
machine) the other has no outside connectivity (LAN Machine). I need to redirect
port 443 traffic to and from the LAN server via the Internet machine. Is this
possible with Iptables? I have setup packet forwarding but then the LAN server
tries to connect directly to the client machine instead of to the Internet
machine. Any direction appreciated.

-- 
Thank you,
Brad Dameron

