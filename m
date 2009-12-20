From: Scott Shambarger <scott-netfilter@shambarger.net>
Subject: Re: Returning nat packets vanishing after mangle:PREROUTING and conntrack
 processing
Date: Sun, 20 Dec 2009 12:43:29 -0800
Message-ID: <11be91d1da3dc8853975cdcda341cd26@localhost>
References: <7ad63010a18944d3264b5ba158c236df@localhost> <4B2CD13D.504@plouf.fr.eu.org> <40efba0ec31032f27b200a4da7b17ae9@localhost> <4B2D1DF7.1060105@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B2D1DF7.1060105@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


On Sat, 19 Dec 2009 19:39:51 +0100, Pascal Hambourg

<pascal.mail@plouf.fr.eu.org> wrote:

> (Searching in kernel changelogs...)



Guess I need to read those more closely to catch subtle but important

changes in kernel behavior :)



> changing rp_filter type from boolean to integer and assigning the value

> 2 to the new loose mode (see Documentation/networking/ip-sysctl.txt for

> details).

[...]

> Notes :

> 1) "Loose" reverse path filtering may be a bit better than no reverse

> path filtering and should work with your setup.



Tried "loose" and it worked great on my multi-homed setup, thanks for the

tip.



> 2) Reverse path filtering in kernel 2.6.32 uses the mark as in policy

> routing, so strict reverse path filtering may work better in multihomed

> setups like yours.



Looking forward to it, I'll give it a try once I upgrade to .32



Cheers,

Scott


