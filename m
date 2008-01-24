From: "Roberto Baldessari" <Roberto.Baldessari@nw.neclab.eu>
Subject: Can I queue non-IP packets and get the to userspace?
Date: Thu, 24 Jan 2008 16:59:04 +0100
Message-ID: <5F6519BF2DE0404D99B7C75607FF76FF44EBA1@mx1.office>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi all,

I have a quick question. Is is possible to use netfilter/iptables to queue non-IP packets and process them in userspace, including verdict assignment?
I guess nfnetlink_queue was designed to be more general than ip_queue and ip6_queue. Does it mean that it can be used for non-IP too?

Thanks in advance,

Best regards

Roberto
