From: Ruprecht Helms <rhelms@mayn.de>
Subject: Understandingproblem within firewallscript
Date: 25 Jun 2003 11:53:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056534812.11039.6.camel@linux.local>
Reply-To: rhelms@mayn.de
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

Hi,

I've difficulties in understanding a part within a examplescript. For
what is the last part used in these lines.

iptables -N SPECIALPORTS

iptables -A SPECIALPORT -p tcp --dport 6670 -j LSPECIALPORT
...

I found nothing before were LSPECIALPORT is defined. The rule
works within the chain SPECIALPORT   I know.

Thanks for help.

Regards,
Ruprecht



