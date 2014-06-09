From: Alin Dobre <alin.dobre@elastichosts.com>
Subject: Re: [RFC][PATCH] net: Allow xt_owner in any user namespace
Date: Mon, 09 Jun 2014 22:00:29 +0100
Message-ID: <5396206D.2090607@elastichosts.com>
References: <537B7FF6.9050103@elastichosts.com>	<877g5eg7wy.fsf@x220.int.ebiederm.org> <537D706D.4010303@1h.com> <87vbsus3wb.fsf_-_@x220.int.ebiederm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87vbsus3wb.fsf_-_@x220.int.ebiederm.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Eric W. Biederman" <ebiederm@xmission.com>, Marian Marinov <mm@1h.com>
Cc: containers@lists.linux-foundation.org, netfilter@vger.kernel.org, Jan Engelhardt <jengelh@medozas.de>

Unfortunately, applying this patch now makes iptables return EINVAL both
on host and container.

Cheers,
Alin.
