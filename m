From: Alessandro Vesely <vesely@tana.it>
Subject: Re: can we design a modified fail2ban ?
Date: Mon, 19 Apr 2010 17:18:12 +0200
Message-ID: <4BCC7434.6020200@tana.it>
References: <4BC7E028.8050209@infoservices.in> <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr> <4BC9DB51.6000407@tana.it> <alpine.LSU.2.01.1004171956030.10627@obet.zrqbmnf.qr> <4BCB0D3C.3060006@tana.it> <alpine.LSU.2.01.1004181841450.9840@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1271690292; bh=aQKOeVxyemdjp9cHoLxvc+3E3r1CjLsfdhnsSS/ef78=;
	l=2845;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=PDxc8GIF/y9GFE2A8BKJeUad199FAtDU1bqBETnCiVFSAOw5gPbkR+1lApXDQad54
	 +aOi9WzN9Bv4b6cKDpkDizrTA3o+mXEf2WDg4QG5yJmAt8uHdPLKphrwLMPXHsnxU2
	 A85lz8m6fZWeMzquUsjVYMxITfhvjHODo7Fh7+sg=
In-Reply-To: <alpine.LSU.2.01.1004181841450.9840@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 18/Apr/10 18:44, Jan Engelhardt wrote:
> On Sunday 2010-04-18 15:46, Alessandro Vesely wrote:
>>  actionban = iptables -I fail2ban-<name>  1 -s<ip>  -j DROP
>>  actionunban = iptables -D fail2ban-<name>  -s<ip>  -j DROP
>>
>>  I don't know whether fail2ban uses some other storage to remember frequently banned IPs.
>
> If you are using iptables for actionban, it would not need to.

Right, but rather than deleting by number, it uses the same IP to 
issue the unban command. If the IP is remembered even after unbanning 
it, then it is possible to increase its next ban-period, in case it is 
caught again.

>>  How would you compare iptables and netfilter?
>
> Like you compare a tree with soil?

Yeah, my question was short, but not formally sound...

I heard about some not better characterized performance degradation 
that would occur when successively issuing a huge number of "iptables 
-I" commands. How huge is "huge"? Where is this topic expounded?

>>  I mean fail2ban actions versus looking up a b-tree file,
>
> Where does that btree file come from, and what should it be useful for?

A b-tree can be used to store IPs: One has to remember them, at least 
for some time, one way or another, if different IPs are to be treated 
differently. One can use an "at" command for unbanning, and avoid 
structured storage. Alternatively, one could use ipset, e.g. iptrees 
with timeouts. As yet another alternative, one can use netfilter and 
user-space storage. I mentioned b-trees because I use Berkeley DB with 
the my netfilter daemon. MySQL or anything similar offer similar 
functionality and performance.

When I started to use my daemon, I was afraid that accessing the disk 
on each packet would have been a bottleneck. So, I only filtered new 
connections. Later on, I added a rule to filter all packets, in order 
to also terminate existing connections. Two rules, actually: a 
netfilter rule to set a mark and another one to reject those packets, i.e.

   iptables -t raw -A OUTPUT -p tcp ! --syn -m multiport --sports $X \
      -j NFQUEUE --queue-num 4
   iptables -A OUTPUT -p tcp ! --syn -m mark --mark 4 \
      -j REJECT --reject-with tcp-reset

(For udp and --syn connections, a single netfilter rule is enough.)

The time taken for issuing verdicts used to be much less than that for 
parsing the log file. The former has jumped to about the double of the 
latter, after those additional two rules. Perhaps, I should have stuck 
to using netfilter for new connections only. Existing connections can 
be terminated with short-lived iptables rules, or by calling 
nids_killtcp() or "ngrep -K" directly. In hindsight, that looks fairly 
obvious. However, the above quoted fail2ban's actions don't seem to be 
concerned with such kind of optimizations. Thoughts?
