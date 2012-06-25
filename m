From: richard lucassen <mailinglists@lucassen.org>
Subject: netmask 255.248.255.0
Date: Mon, 25 Jun 2012 12:45:45 +0200
Message-ID: <20120625124545.273ae920b609bc0b0da20e9b@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I want access to 8 different /24 networks:

10.32.0.0/24
10.33.0.0/24
10.34.0.0/24
10.35.0.0/24
10.36.0.0/24
10.37.0.0/24
10.38.0.0/24
10.39.0.0/24

This can of course be achieved by adding 8 seperate rules using a /24
netmask. I tried to catch it in 1 rule and indeed, this seems to work
well:

10.32.0.0/255.248.255.0

but AFAIK this is not documented anywhere. Is this a legitmate way to
do this?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
