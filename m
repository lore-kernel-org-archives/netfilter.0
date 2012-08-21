From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: old question revisited: can rely in 'iptables-restore' format?
Date: Mon, 20 Aug 2012 19:30:26 -0500
Message-ID: <20120821003026.GD3672@harrier.slackbuilds.org>
References: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
 <20530.51137.458307.357243@tree.ty.sabi.co.UK>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20530.51137.458307.357243@tree.ty.sabi.co.UK>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Aug 21, 2012 at 12:26:57AM +0100, Peter Grandi wrote:
> Perhaps it is useful to ask again an old question:
> 
> Is the format of files produced by 'iptables-saved' and consumed
> by 'iptables-restore' still considered an internal, undocumented
> format that may change at any time?
> 
> How stable is in practice that format?
> 
> Because I reckon that format has been stable for at least 10
> years, and I wonder whether it may be desirable to write
> firewall configurations directly in it, rather than using long
> 'iptables' command shell scripts.

I can't say why there's no official iptables-save(5) manual page, 
but I can definitely say that it IS desirable and recommended to
use iptables-restore rulesets in your boot sequence. Most major 
distros that provide rulesets do use iptables-save and 
iptables-restore, and this has been the case for many years.

The main benefit is that iptables-restore is atomic. All changes
are committed in one pass. Any error in the ruleset means your 
existing ruleset is not replaced.

iptables OTOH has to read and rewrite the entire ruleset for each 
command given, and there is a potential for race conditions if a 
script is triggered to run before the previous run completed.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
