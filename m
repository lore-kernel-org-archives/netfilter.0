From: "Joshua D. Drake" <jd@commandprompt.com>
Subject: Correctly logging MAC address
Date: Fri, 30 May 2003 10:00:54 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305300959110.32316-100000@hosting.commandprompt.com>
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


Hello,

 I have a small problem. I need to log all the MAC addresses
that come into a firewall from the outside world. The firewall
is performing NAT.

 The problem is prerouting doesn't log the correct MAC address,
Forward doesn't log a MAC address. The only one that seems to
correctly log a MAC address is INPUT. However, I can't seem
to write an INPUT rule that will then pass to a prerouting rule for NAT.
Any ideas?


Sincerely,

Joshua Drake


-- 
Co-Founder
Command Prompt, Inc.
The wheel's spinning but the hamster's dead


