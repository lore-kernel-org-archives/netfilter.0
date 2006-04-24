From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: one rule to create per IP connlimits?
Date: Mon, 24 Apr 2006 03:41:16 +0200
Message-ID: <444C2CBC.7010804@gmx.net>
References: <5cc9c8f90604211201keda9583yf0026180cbfe9a75@mail.gmail.com>	<006201c665f5$00205670$0e01050a@CyberAdmin>
	<876ef97a0604220615g530bd141uffe611fec9759a8e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a0604220615g530bd141uffe611fec9759a8e@mail.gmail.com>
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
To: Toby DiPasquale <codeslinger@gmail.com>
Cc: robee <mlody@elpec.com>, netfilter@lists.netfilter.org

Hi,

Toby DiPasquale schrieb:
> To do this, the connlimit module would have to keep track of
> individual conntracks, not just aggregate numbers. It doesn't right
> now, but it could be made to do so.

Do you have any plans to change that? If no, do you know if anybody
is maintaining connlimit right now?

I'd like a combination of hashlimit and connlimit which also works
for UDP so I can limit the number of simultaneous connections per
IP to avoid overflowing the conntrack table of upstream firewalls.


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

