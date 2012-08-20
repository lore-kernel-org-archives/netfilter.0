From: pg@netf.list.sabi.co.UK (Peter Grandi)
Subject: old question revisited: can rely in 'iptables-restore' format?
Date: Tue, 21 Aug 2012 00:26:57 +0100
Message-ID: <20530.51137.458307.357243@tree.ty.sabi.co.UK>
References: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: list Linux netfilter <netfilter@vger.kernel.org>

Perhaps it is useful to ask again an old question:

Is the format of files produced by 'iptables-saved' and consumed
by 'iptables-restore' still considered an internal, undocumented
format that may change at any time?

How stable is in practice that format?

Because I reckon that format has been stable for at least 10
years, and I wonder whether it may be desirable to write
firewall configurations directly in it, rather than using long
'iptables' command shell scripts.
