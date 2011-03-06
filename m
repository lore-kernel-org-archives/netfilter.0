From: Pandu Poluan <pandu@poluan.info>
Subject: --state for NOTRACK packets?
Date: Sun, 6 Mar 2011 23:27:24 +0700
Message-ID: <AANLkTimV6b_Ov6AX2nUKFzhthFDeB-auDCkevc4OQOEY@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

If a packet got NOTRACK-ed in raw/PREROUTING, what would its
--state/--ctstate be in the other PREROUTING chains?

The reason I'm asking because I have a quite complex mangle/PREROUTING
chain, and would like the NOTRACK-ed packets to just bypass that chain
with a -j ACCEPT at the start of the chain.

Rgds,


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
