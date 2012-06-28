From: =?utf-8?Q?Stefan_Bauer?= <stefan.bauer@cubewerk.de>
Subject: general question about DNAT-rule
Date: Thu, 28 Jun 2012 18:55:12 +0200
Message-ID: <zarafa.4fec8c70.24ca.5dedba9b62c4a926@zarafa.cubewerk.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?utf-8?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>

Dear Users,

please help me to understand the processing of packages when a DNAT-rule is setup.
With DNAT on a Router the destination address is changed so a package with 
SRC: 1.2.3 and DST 4.5.6 
will become
SRC: 1.2.3 and DST 7.8.9

If the receiver answers it is

SRC: 7.8.9 and DST 1.2.3

so if this packages is arriving on 1.2.3 it will get dropped as the sender was talking to 4.5.6 and not 7.8.9.

Now to my question - is a SNAT-rule mandatory on the Router or is there some other process of "reverse-NAT" the answer packages to the initial sender?

I want to understand what is happening with the packages and answer-packages in detail.

thank you in advance

Stefan
