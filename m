From: brian.adamson@nrl.navy.mil
Subject: Only the "first" netfilter_queue process receives the packets?
Date: Wed, 4 May 2011 16:13:40 -0400
Message-ID: <D5367974-2E4B-49C5-A4DF-738F0A05673E@nrl.navy.mil>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have created an app that is now using netfilter_queue to get packets from iptables (the app used ipqueue previously).

The first instance of the app installs an OUTPUT chain rule like:

target		prot	opt	source			destination
NFQUEUE	all	--	anywhere	BASE-ADDRESS.MCAST.NET/4 NFQUEUE num 1

and it receives the packets fine and sets an NF_ACCEPT verdict and the packets go merrily along their way ...

BUT, when I launch a second instance of the app which installs the same rule but with a _different_ --queue-num,:

arget		prot	opt	source			destination
NFQUEUE	all	--	anywhere	BASE-ADDRESS.MCAST.NET/4 NFQUEUE num 2

The second instance doesn't see any packets _until_ the first instance of the app exits.

However, if I set up each app to filter for a different set of destination addresses, then each instance does receive its exclusive matching packet sets.

Is this just a limitation of how iptables works or is there something additional I need to do so that two different process can each get the same packets?


Brian Adamson
brian.adamson@nrl.navy.mil





