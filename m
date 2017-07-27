From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: recent module in nftables
Date: Thu, 27 Jul 2017 16:46:26 -0500
Message-ID: <20170727214626.GB25160@harrier.slackbuilds.org>
References: <20170727155959.758138ab@lustre.ryper.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170727155959.758138ab@lustre.ryper.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Jul 27, 2017 at 03:59:59PM -0500, Perry Thompson wrote:
> It may be way to early to ask this question, but I thought I might 
> as well see if anyone has any information on it.
> 
> Will the "recent" module or an option with a similar function be 
> introduced into nftables in the future? Are there any plans to 
> create something like this? It has always been a very good tool
> for keeping bad IPs from touching my system.

I don't know nftables yet, but I do know that ipset(8) and the set 
match and the SET target can accomplish the same things recent does.
Also, I believe a set functionality exists in nftables.
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
