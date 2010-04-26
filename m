From: "Tim Evans" <tkevans@tkevans.com>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 10:19:17 -0400
Message-ID: <677ceca0469ab502a71c228b68e103f3.squirrel@login.hostmonster.com>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Zieseniss <peter@zconsulting.net>
Cc: netfilter@vger.kernel.org


Peter Zieseniss wrote:

> My question, therefore, is this:
> Is it wise to use a 4000-line long block-list for iptables? Or will doing
> so bring my server to a crawl (which it already is because of these darn
> brute-force ssh attacks) because for each TCP packet it has to spend 5
> minutes going through the entire list?
> Should i just forget about Australia and Japan, and block all APNIC
> countries with just a 40-line list instead?

Why not use denyhosts? http://denyhosts.sourceforge.net/

Works with tcp wrapper; auto-updates /etc/hosts.deny; sends and accepts
new bad hosts back to the mothership.
-- 
Tim Evans, TKEvans.com, Inc.    |   5 Chestnut Court
UNIX System Admin Consulting    |   Owings Mills, MD 21117
http://www.tkevans.com/         |   443-394-3864
http://www.come-here.com/News/  |   tkevans@tkevans.com


