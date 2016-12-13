From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: nftables: masquerade sets wrong source address
Date: Tue, 13 Dec 2016 08:32:27 -0600
Message-ID: <20161213143227.GU8339@harrier.slackbuilds.org>
References: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Dec 13, 2016 at 01:28:41PM +0000, Tom Hacohen wrote:
> Removing the masquerade line, or changing it to: "oifname wlp1s0 
> masquerade" fixes it, but this is just a workaround that will fail 
> in more complex situations.

ISTM you'd always want to limit a MASQ/SNAT rule by outgoing 
interface.  I don't get why that was "ugly" (as you said in IRC) or 
likely to fail ... well, certainly if using that ruleset where the 
default gateway was on some other interface, but so what?  Adjust 
your rule to suit the situation.

In more complex situations, such as multiple Internet connections 
with policy routing, masquerade is not appropriate.  You'd have to 
use SNAT.

If you're doing NAT among RFC 1918 networks, YDIW.  Fix the routing.
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
