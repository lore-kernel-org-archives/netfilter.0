From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: TC QoS for different sources/destinations
Date: Sun, 6 Jun 2010 18:04:47 +0100 (WEST)
Message-ID: <3833.213.228.140.150.1275843887.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Howdy People,

I'd like to know it something like this is possible using TC:

-I'd like to define a rate for download, but for each connection IP/source
(whatever the name is), instead of defining a rate for the interface.
 This way i could guarante a fixed rate for each destination.

Is this possible?

Jorge,

