From: Udo Schneider <Udo.Schneider@homeaddress.de>
Subject: conntrack/state with QUEUE target
Date: Fri, 27 Nov 2009 16:05:02 +0100
Message-ID: <heoprj$dpr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

All,

I'm a little confused whether the combination of conntrack/state with 
QUEUE targets is supported.

I have a usermode app which processes packets via libNFQ which works 
fine. Up to know we had a very simple setup like

-t mangle -A FORWARD -p tcp --dport 80 -j QUEUE
-t mangle -A FORWARD -p tcp --sport 80 -j QUEUE

This worked fine. Now however we have the requirement for more granular 
"stateful" Rules. I though it should be possible to combine 
state/conntrack with the QUEUE target ... but this doesn't seem to work.

-t mangle -A FORWARD -p tcp --dport 80 -m state --state NEW,ESTABLISHED 
-j QUEUE

However using this rule no (http) connection goes through.

Any pointers?

CU,

Udo

