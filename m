From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Susefirewall2 redirecting
Date: Tue, 23 Aug 2005 08:39:57 -0500
Message-ID: <1124804397.23443.141.camel@localhost.localdomain>
References: <200508231520.08360.chadley@ngn.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508231520.08360.chadley@ngn.co.za>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> Any ideas as to how I can force this to work?

silly question: have you provisioned your box to forward?

# cat 1 > /proc/sys/net/ipv4/ip_forward

edit /etc/sysctl.conf for a permanent solution.

-matt zagrabelny


