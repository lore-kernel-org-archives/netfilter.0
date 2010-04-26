From: Peter Zieseniss <peter@zconsulting.net>
Subject: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 16:09:28 +0200
Message-ID: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
Mime-Version: 1.0 (Apple Message framework v1078)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hello All,

This is my first time posting; i am rather new to iptables, so please e=
xcuse the ignorance in my question.

My personal CentOS-based webhost is under constant ssh attack from an i=
nterminable list of different IP addresses (just to give you an idea, m=
y latsb data file grows by ~100MB every week!!).
i've noticed that they all seem to come from East-Asia (mainly China, T=
aiwan, Malaysia, Korea--both).

i found this website which provides a list of IP addresses on a per-cou=
ntry basis:
http://ipinfodb.com/ip_country_block_iptables.php

it seems quite reliable, but the list, for just the countries above, is=
 about 3700 lines long..
on the other hand, i found a list of just 40 lines for *all* of the APN=
IC countries (http://bgp.potaroo.net/ipv4-stats/allocated-apnic.html).

i'd rather use a per-country list so as to not block non-offending coun=
tries like Japan and Australia. Indeed, my Mom, Dad, and i use this web=
host for our small businesses, and although we've never had interlocuto=
rs from APNIC countries, i'd rather not block Australia outright, just =
in case someone has their webhost there and tries to send us email...

My question, therefore, is this:
Is it wise to use a 4000-line long block-list for iptables? Or will doi=
ng so bring my server to a crawl (which it already is because of these =
darn brute-force ssh attacks) because for each TCP packet it has to spe=
nd 5 minutes going through the entire list?
Should i just forget about Australia and Japan, and block all APNIC cou=
ntries with just a 40-line list instead?


Again, i apologize for the long, and probably lame question, but i woul=
d *greatly* appreciate any help you might provide..

Thank you in advance!
Be Well,
Peter




--

"My candle burns at both ends;
It will not last the night;
But ah, my foes, and oh, my friends
It gives a lovely light!"
 =97 Edna St. Vincent Millay

--=20

Peter Zieseniss
Principal
http://www.zconsulting.net
peter@zconsulting.net

