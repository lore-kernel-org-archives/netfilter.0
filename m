From: Robert White <rwhite@pobox.com>
Subject: Ingress by adapter group ID instead of just adapter?
Date: Sun, 12 Nov 2017 04:41:52 +0000
Message-ID: <7197f7d4-a0c7-a5d5-8109-11a509733f61@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Howdy,

So ingress chain are attached to adapters, but it would be nice if they
could be attached to adapter group IDs as well as individual adapters.
That way I don't have to instantiate a chain for every adapter, I can
just have the one.

In the syntax [device] would be [device | "group" number].

In particular I use group 1 for all external interfaces, which includes
several ethX interfaces and all the pppX interfaces as well. I keep a
"Bad Actor" list and I've been looking at tossing their packets before
connection tracking and all that with an ingress chain.


Better still would be less than or greater than matching on groups.

All this can be done in other rules and other ways, but a simple and
fast numeric match just seems so much cleaner.
