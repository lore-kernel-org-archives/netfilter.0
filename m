From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: delete NAT conntrack entry.
Date: Thu, 10 May 2007 14:48:19 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705101442020.32349@yvahk01.tjqt.qr>
References: <000a01c792d2$3e07e240$8f0ba8c0@swparkt1>
	<Pine.LNX.4.61.0705101150510.32349@yvahk01.tjqt.qr>
	<20070510111403.GA27624@animx.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070510111403.GA27624@animx.eu.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wakko Warner <wakko@animx.eu.org>
Cc: netfilter@lists.netfilter.org


On May 10 2007 07:14, Wakko Warner wrote:
>
>If it were possible that when a rule like that is deleted, all
>active conntrack entries that this rule causes would be removed.

Problem 1: We would have to record in a ct entry what rule caused
the ct to come alive. What if we have an empty ruleset? Conntracking
still runs even when no iptables rules are in position.

Problem 2: If I wanted to move a rule inside a chain,
deleting/reinserting it would kill the ct entry and - given some
ruleset* (there are many more that would apply) - stops all
connections immediately.

  -P INPUT DROP
  -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
  -A INPUT -m conntrack --ctstate NEW -p tcp --syn -j ACCEPT



	Jan
-- 

