From: Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.19 released
Date: Sat, 11 May 2013 00:18:19 +0100
Message-ID: <518D803B.5010702@googlemail.com>
References: <alpine.DEB.2.00.1305092214320.25002@blackhole.kfki.hu> <20130510123223.GQ8305@localhost> <alpine.DEB.2.00.1305101758420.27743@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=pZYPVG1zuftwnFOteEnspOmVBKEt4f9AMwWhrEsUhSs=;
        b=eC6MV7Ef/ZRw4/hDs9PeNsBdP+ISC24clnXp2GfnLG+YHpQq1P443O5+tWPmMUHYbl
         heZ/qTSdom6ciP+NYF4bw8ruyuXcl1JdbUS1QyLkjK+XcnMKqRDS+e6eZqNQQ9IdTtdw
         +Q3POtgPfKWOLrKpx0BUhty8V+l/nLFrP5g6/8e84/r1UiItCgBoPR2/Ocon8pG8WwM9
         z0fCJcpbDvoOlLk/891PA/lYJV5dkRY+J56hjXkzKcqi/B+Bcu3ob+UYuxgyPCGXGEZM
         poxDoR0En3Rm9YpZAMoL0O0KuDepv/W+OQA0Stm9F5Y/DZrOH2Z+sU1NY8ogmT6jNldf
         P/rA==
In-Reply-To: <alpine.DEB.2.00.1305101758420.27743@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org



Jozsef Kadlecsik wrote:
> Some examples:
>
> a. Traffic counting from clients
>
> # Create the set, fill with elements
> ipset n clients hash:ip counters
> ipset a clients ...
> # Match in a rule
> iptables -A ... -m set --match-set clients src -j ...
> # List regularly the set and process the counter values
> ipset l clients
>
> b. Combined time and traffic limiting
>
> # Create the set, fill with elements
> ipset n guests hash:ip counters timeout $((2*60*60))
> ipset a guests ...
> # Allow traffic up to a given a limit or until timeout
> iptables -A ... \
>   -m set --match-set guests src --bytes-lt $((8*1024*1024)) ...
>
> There are some subleties of course: if the set match rule is negated
>
>    .... -m set ! --match-set foo src
>
> that is independent from increasing the packet and byte counters for the 
> elements which matched the lookup in the set - the negation happens at 
> rule evaluation level.
>
> As the updated iptables-extensions manpage shows, there are new flags to 
> suppress updating the packet and byte counters at different levels if one 
> matches a set from multiple rules.
>   
Jozsef, where is this updated iptables-extensions manpage you speak of?

The latest released version of iptables is 1.4.18, which obviously does 
not include any of the above since it was released before ipset 6.19. 
I've just looked at the main iptables git repo and there aren't any git 
logs since that release with anything related to ipset. In the ipset 
sources, apart from the main ipset man page, there is nothing there 
which describes the above iptables match options.

