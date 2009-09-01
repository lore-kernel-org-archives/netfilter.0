From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Hot to design syn-flood protection based on ip ?
Date: Tue, 1 Sep 2009 10:12:16 +0200
Message-ID: <20090901101216.06ced847@catlap>
References: <4A967DE2.2060601@infoservices.in>
	<4A9CBF27.1070600@infoservices.in>
	<20090901085801.428359f0@catlap>
	<4A9CCF5C.8050100@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9CCF5C.8050100@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Hello,

>Thanks a lot, what about this ruleset ?
>iptables -A INPUT -p tcp --syn  -m hashlimit \
> --hashlimit 1/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000
>\ --hashlimit-mode srcip --hashlimit-name testlimit -j ACCEPT
>iptables -A INPUT -j DROP
>The concept here the blocked ip doing the syn-flood will be blacklisted
>for 5 min and will be checked again after that interval.

I think it won't work as a blacklist just drop syns that are above
1/sec. Option htable-expire is not for blacklisting but for setting
timeframe in which hashlimit is operating (eg. it won't work well if you
set htable-expire to 300s and have hashlimit set to 20/hour). To obtain
desired effect you can use recent module (great work by Stephen Frost
by the way):

iptables -A INPUT -m recent --name blacklist --rcheck --seconds 300 \
-j DROP
iptables -A INPUT -p tcp --syn  -m hashlimit \
 --hashlimit 1/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000\
 --hashlimit-mode srcip --hashlimit-name testlimit -j ACCEPT
iptables -A INPUT -m recent --name blacklist --set -j DROP

You can find more information about recent here:
- http://snowman.net/projects/ipt_recent/
- and in manpage;

Best regards,
Marek
