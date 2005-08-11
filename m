From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Rules in config file
Date: Thu, 11 Aug 2005 07:55:54 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508110755370.28320@yvahk01.tjqt.qr>
References: <20050810141804.e0876506@freedom.alpha-force.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050810141804.e0876506@freedom.alpha-force.net>
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
To: Lists <lists@alpha-force.net>
Cc: netfilter@lists.netfilter.org

>Hi
>
>Would it be possible to somehow disable changing iptables rules from scripts 
>and enable changing only from config file, which loading would be protected 
>by special password defined in kernel? Or even better, your could preset 
>iptables rules in kernel. That rules would be unchangeable.

Just remove CAP_NET_RAW and CAP_NET_ADMIN from your capability set ;-)


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

