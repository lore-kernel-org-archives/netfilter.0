From: "David S. Miller" <davem@redhat.com>
Subject: Fw: problems with ip6tables on sparc64 with 2.4.19
Date: Wed, 25 Sep 2002 13:23:37 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020925.132337.93583635.davem@redhat.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
 boundary="--Next_Part(Wed_Sep_25_13:23:37_2002_688)--"
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
To: netfilter@lists.netfilter.org

----Next_Part(Wed_Sep_25_13:23:37_2002_688)--
Content-Type: Message/Rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Return-Path: <linux-net-owner@vger.kernel.org>
Received: from localhost (IDENT:davem@localhost.localdomain [127.0.0.1])
	by pizda.ninka.net (8.9.3/8.9.3) with ESMTP id EAA15609
	for <davem@localhost>; Wed, 25 Sep 2002 04:07:24 -0700
Received: from localhost
	by localhost with POP3 (fetchmail-5.3.1)
	for davem@localhost (single-drop); Wed, 25 Sep 2002 04:07:24 -0700 (PDT)
Received: from int-mx1.corp.redhat.com (int-mx1.corp.redhat.com [172.16.52.254])
	by devserv.devel.redhat.com (8.11.6/8.11.0) with ESMTP id g8PBGl904739;
	Wed, 25 Sep 2002 07:16:47 -0400
Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id g8PBGlf28439;
	Wed, 25 Sep 2002 07:16:47 -0400
Received: from vger.kernel.org (vger.kernel.org [209.116.70.75])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id g8PAwpi07243;
	Wed, 25 Sep 2002 06:58:51 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id <S261955AbSIYLLJ>; Wed, 25 Sep 2002 07:11:09 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org
	id <S261957AbSIYLLJ>; Wed, 25 Sep 2002 07:11:09 -0400
Received: from squeaker.ratbox.org ([207.188.202.227]:40064 "EHLO
	squeaker.ratbox.org") by vger.kernel.org with ESMTP
	id <S261955AbSIYLLI>; Wed, 25 Sep 2002 07:11:08 -0400
Received: by squeaker.ratbox.org (Postfix, from userid 1000)
	id BB714301A6; Wed, 25 Sep 2002 07:16:21 -0400 (EDT)
Date: Wed, 25 Sep 2002 07:16:21 -0400 (EDT)
From: Aaron Sethman <androsyn@ratbox.org>
To: linux-net@vger.kernel.org
Subject: problems with ip6tables on sparc64 with 2.4.19
Message-ID: <Pine.LNX.4.44.0209250711320.1183-100000@squeaker.ratbox.org>
X-GPG-FINGRPRINT: 1024D/D4DE2553 0E60 59B5 60DA 2FD3 F6F5  27A3 6CD2 21AD D4DE 2553
X-GPG-PUBLIC_KEY: http://squeaker.ratbox.org/androsyn.asc
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-net-owner@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-net@vger.kernel.org


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

-
To unsubscribe from this list: send the line "unsubscribe linux-net" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


----Next_Part(Wed_Sep_25_13:23:37_2002_688)----

