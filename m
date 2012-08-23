From: pg@netf.list.sabi.co.UK (Peter Grandi)
Subject: Re: old question revisited: can rely in 'iptables-restore' format?
Date: Thu, 23 Aug 2012 20:20:04 +0100
Message-ID: <20534.33380.922012.499011@tree.ty.sabi.co.UK>
References: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
	<20530.51137.458307.357243@tree.ty.sabi.co.UK>
	<20120821003026.GD3672@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120821003026.GD3672@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux netfilter <netfilter@vger.kernel.org>


>> Is the format of files produced by 'iptables-saved' and consumed
>> by 'iptables-restore' still considered an internal, undocumented
>> format that may change at any time?

>> How stable is in practice that format?
   ======================================

>> Because I reckon that format has been stable for at least 10
>> years, and I wonder whether it may be desirable to write
>> firewall configurations directly in it, rather than using long
>> 'iptables' command shell scripts.

> I can't say why there's no official iptables-save(5) manual page, 
> but I can definitely say that it IS desirable and recommended to
> use iptables-restore rulesets in your boot sequence. Most major 
> distros that provide rulesets do use iptables-save and 
> iptables-restore, and this has been the case for many years.

That's a misunderstanding of the question I asked, which was not
at all whether using 'iptables-restore' is desirable or common.

The question is whether the syntax accepted by 'iptables-restore'
format is going to be stable, so that one might invest in
generating rulesets from programs other than 'iptables-save',
rather than running many 'iptables' commands, then 'iptables-save'
and then 'iptables-restore'.

The only "guarantee" that I have seen is that whatever is output
by 'iptables-save' will be accepted by 'iptables-restore', and
that the syntax may be changed at any time.

However in practice the syntax accepted by 'iptables-restore' has
not substantially changed for many years.
