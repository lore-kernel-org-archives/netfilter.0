From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Parsing conntrack entries
Date: Thu, 01 Jan 2015 23:14:38 +0100
Message-ID: <54A5C6CE.6090409@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I'm trying to write a small python script that creates some statistics
from the current conntrack entries of a system. The problem I've run
into is that I cannot find a good description of the output format of
the conntrack tool and while I initially though the format is reasonably
straightforward to deduce I ran into some snags.

The format of a line not only changes with protocol and entry state but
even entries with the same protocol and state seem to have different
formats:

tcp      6 3 CLOSE src=<IP1> dst=<IP2> sport=X dport=Y src=<IP2>
dst=<IP1> sport=Y dport=X mark=0 use=1

vs

tcp      6 3 CLOSE src=<IP1> dst=<IP2> sport=X dport=Y src=<IP2>
dst=<IP1> sport=Y dport=X [ASSURED] mark=0 use=1

Why does one entry contain the [ASSURED] but the other does not?

Also for some connections I see the [ASSURED] near the end of the line
but for others I see an [UNREPLIED] in the *middle* of the line and no
flag near the end of the line.

What is the meaning of the "use" field?

What is the best way to parse this information in a reliable way?

Regards,
  Dennis
