From: "Freitas Freitas" <casfre@gmail.com>
Subject: iptables 1.3.7 - match multiport requiring module ip_tables -built
	in- in kernel 2.6.19.2
Date: Fri, 2 Feb 2007 12:13:49 -0200
Message-ID: <aaef12150702020613n1f2df9b9xc8d05181dea6c0bd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

     I am using Slackware 10.2 and updated kernel to 2.6.19.2, because
I need suport to pptp NAT.
     Kernel configured and compiled OK. Almost all NETFILTER built-in.
     Iptables 1.3.7 compiled OK.
     All my rules, including other matchs (state) than multiport
worked fine, but, lines using multiport returned FATAL: no ip_tables
module. There is no ip_tables because it is compiled in, I thought.
     Only way to solve: mark everything ( didn't test one by one )
about netfilter as Module and recompiled the kernel.
     This way, iptables 1.3.7 working with my rules.

     Please, did I miss something?

     Really thank you for your attention.

Regards,

Freitas
(Poor english)

