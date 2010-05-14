From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Fri, 14 May 2010 02:06:34 +0200
Message-ID: <hsi46a$sro$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org>	 <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>	 <hshf0k$ine$1@dough.gmane.org>	 <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>	 <hshhcg$rl3$1@dough.gmane.org> <AANLkTilx7Gimy8RwVszEx1ijkR4mx2Q70HKJO72fAhTK@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilx7Gimy8RwVszEx1ijkR4mx2Q70HKJO72fAhTK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Thanks for your help,

I changed this at this afternoon today, because otherwise my server is
not reachable. I changed line 132 and 133 from "state NEW" to the
iptables argument "--syn".

I have no idea why NEW does not work but --syn.

@Curby
The packets will not dropped in the INPUT chain, see the LOG of my friend.
https://debianforum.de/forum/pastebin.php?mode=view&s=34615
All packets will only dropped in the attacksinput chain. I made this log
with <grep SRC=84.141.159.142 /var/log/syslog>, so it contains all
dropped packets from my friend.

When the packets with DPORT=80,443 goes back to the INPUT chain it will
be ACCEPTED, see line 241 to 247. But as i said the packets will only be
dropped in my atttacksinput chain and i don't know why.

The first dropped packet of my friend has the DPT=443 (Redirection from
80 to 443) and SYN flag set with TCP protocol. So i asume that the first
packets with DPORT=80 were accepted. The next packet (singular) with
DPT=443 was dropped at <attacksinput(NEW,INVALID)>, so it went over the
rule in line 133. Line 133 says clearly to catch all NEW packets with
DPT=443. Because it didn't so, the packet was not NEW, and because it
was catched by <attacksinput(NEW,INVALID)>, it has to be INVALID !

Question, is a packet still marked as NEW, after it is redirected from
80 to 443 ???

regards Markus


