From: hamann.w@t-online.de
Subject: ipset question
Date: 18 Sep 2011 08:10:52 -0000
Message-ID: <wolfgang-1110918101052.A045344@amadeus3.local>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org



Hello,

I am trying to add ipset to an old system (kernel 2.6.16)
So I downloaded the old ipset and built it in a separate directory.
There was a little changes necessary, indicating that the distro had some stuff
backported into the kernel, but eventually it succeeded. I can create ipset,
add addresses to it and list them.

Now, when I try to add iptables rule, I get error about missing libipt_set.so
I have tried to recompile iptables on the machine (version 1.3.5 like the installed one),
but that does not build the missing file.
It seems that include/linux in iptables does not contain files from include/linux in ipset.
Would it make sense to just copy over these files? Are there any other changes necessary?

Regards
Wolfgang Hamann

