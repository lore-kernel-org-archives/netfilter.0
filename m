From: "Barry A Rich" <barich@trisectrix.com>
Subject: UDP stream load balancing across multiple uplinks
Date: Thu, 24 Jul 2008 21:23:52 -0400
Message-ID: <000501c8edf5$19903230$4cb09690$@com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've configured a kubuntu 8.04 PC as router with one LAN interface and three
Internet uplinks. A UDP stream is being produced on the LAN. I'd like the
UPD packets from the stream to be load balanced across the uplinks.
Currently, the UDP stream is tracked as a single connection and all the UPD
packets are sent to the same uplink. What's the best way to accomplish this?


