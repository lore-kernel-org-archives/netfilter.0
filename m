From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: Q:when ip6tables should be used instead of iptables ?
Date: Thu, 04 Aug 2011 17:12:36 +0100
Message-ID: <4E3AC4F4.2080908@tolaris.com>
References: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D1399BD@hasmsx502.ger.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D1399BD@hasmsx502.ger.corp.intel.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Olshvang, LevX" <levx.olshvang@intel.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2011-08-04 15:54, Olshvang, LevX wrote:
> Or in another terms which of iptable command are IPv4/v6 neutral?

None of them. iptables is an IPv4 filter. ip6tables is an IPv6 filter.
Yes, you must maintain two sets of firewall rules, or use a firewall
rules generator tool that does this for you.

Regards,
Tyler

--=20
"Offending fundamentalists isn't my goal =96 but if it is an inevitable
side-effect of defending human rights, so be it."
   -- Johann Hari
