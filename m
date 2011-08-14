From: "J. Zeidler" <jonatan_zeidler@gmx.de>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines SSH-Tunnels
Date: Sun, 14 Aug 2011 03:28:20 +0200
Message-ID: <4E4724B4.7040200@gmx.de>
References: <4E44F1DC.3090605@gmx.de> <1313142433.3060.2.camel@ns014530.dcyb.net> <4E44FF86.60904@gmx.de> <1313145305.3060.11.camel@ns014530.dcyb.net> <4E45A576.7030301@gmx.de> <20110813015732.GH14195@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110813015732.GH14195@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

sorry. i dont want to bother you! i read the man.

If i do with PREROUTING nothing happens.
Now i tried it this way:

     sudo iptables -A OUTPUT -t nat -p tcp -d 65.18.193.12 -j REDIRECT 
--to-ports 15000

and

     sudo watch -n 5 iptables -L -v -t nat

shows me

     Chain OUTPUT (policy ACCEPT 55 packets, 3889 bytes)
     pkts bytes target     prot opt in     out     source               
destination

     1    60 REDIRECT   tcp  --  any    any     anywhere             
wesnoth.wesnoth.org redir ports 15000

so it seems that one package is redirected. But the program tells me:

     "remote host disconnected"

I hope you can help me!
