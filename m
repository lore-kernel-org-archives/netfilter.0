From: Aaron Sethman <androsyn@ratbox.org>
Subject: problems with ip6tables on sparc64 with 2.4.19
Date: Wed, 25 Sep 2002 14:43:01 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209251442420.13560-100000@squeaker.ratbox.org>
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


Basically ip6tables pretty much doesn't work...I get the following error:

# ip6tables -L
ip6tables v1.2.7a: can't initialize ip6tables table `filter': Table does
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

After a bit of investigation I enabled the #define DEBUG_IP_FIREWALL_USER
in ip6_tables.c and got the following upon trying to load the
ip6tables_filter.o module:

translate_table: size 856
Bad offset 0000000140020074

Any clues or ideas on how to resolve this issue?

Regards,

Aaron



