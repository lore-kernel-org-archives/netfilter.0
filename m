From: James Stickland <jimmy@sympatico.ca>
Subject: reply messages
Date: Thu, 7 Nov 2002 21:39:20 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211072133140.159-100000@laptop.sympatico.ca>
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

A while ago, while simultaneously icmp pinging my isp's dns server and
viewing the tcpdump of the interface to which the icmp requests/replies
were going out/in from, i realised that my ISP's DNS server drops icmp
ping requests, and instead replies with a message visible to tcpdump
something along the lines like this: "This server does not allow ping
replies."

My question is, would there happen to be a jump i could do with netfilter
that would enable me to send out such a message for certain types of
packets coming in?


Thanks.
James Stickland, Scarborough Toronto Ontario Canada.



