From: Chris Len <sniper@apu.edu>
Subject: how to construct rule to match multiple non-sequential ipv4 addresses
Date: Fri, 18 Oct 2002 09:22:42 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210180916130.26320-100000@home.apu.edu>
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

Is there any way to accomplish something like the following?
iptables -t filter -A INPUT -s (!192.168.0.2 || !192.168.0.3) -j DROP
Thanks in advance for the help :)

-Chris Len
sniper@apu.edu
Student Systems Manager
Information & Media Technology
Azusa Pacific University


