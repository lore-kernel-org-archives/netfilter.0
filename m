From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Dropping SYN with FIN flag set
Date: Tue, 21 Oct 2003 16:35:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F959889.8040507@Loudoun-Fairfax.com>
References: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com>	 <1066754393.1557.29.camel@valhalla>  <3F95721F.2050905@Loudoun-Fairfax.com> <1066762574.1557.62.camel@valhalla>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066762574.1557.62.camel@valhalla>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Chris Brenton wrote:

>On Tue, 2003-10-21 at 13:51, Jeffrey Laramie wrote:
>  
>
>>Hey Chris -
>>    
>>
>
>Greetings! :)
>
>  
>
>>I've taken a rudimentary stab at these kinds of rules with mixed success 
>>and your post brings up a couple of questions:
>>
>>Here are the rules I'm using now:
>>
>># Chain to trap bad packets before they enter the system.
>>$iptables -A Bad_Packet -p tcp -m state --state INVALID -j LOG 
>>--log-level debug
>>$iptables -A Bad_Packet -p tcp -m state --state INVALID -j DROP
>>    
>>
>
>On the up side, this combo should catch all the stuff I mention in my
>rules far more efficiently as you are only using a single rule. On the
>downside, you'll see a lot of false positives (like state table
>time-outs during the FIN/ACK exchange) and it does not categorize the
>flag combo for easy review later (as mine does). 
>  
>

I only wish I had time to review my logs in that kind of detail. If I'm 
blocking the bad stuff, I'm happy!

>Also, are you trying to use --log-level to increase the amount of
>detail? If so, that switch actually sets the Syslog facility level. You
>can try using the IP or TCP options switch instead to get more detail.
>
>  
>

Actually it was a couple of previous posts, including one of your's, 
that got me thinking about logging. There were several questions about 
directing the iptables logs from /var/log/messages to a different file 
and the difficulty in splitting out the other kernel traffic. You 
answered one post described your system for handling logs and someone 
else (Jim from UCLA maybe?) answered another similar question by showing 
how to use log levels to split out iptables output from most other 
kernel logging. Not really knowing what I was doing, I thought, and I 
hacked , and I fixed what I hacked, and I thought some more, until I 
came up with my own system:

WARNING!  I have no clue! I mean it! Do not try this on a system you 
care about!

1.  I changed my sylog.conf to split off kernel.debug level messages to 
the iptables.log file. I chose debug level since a production kernel 
rarely uses it and I get (almost) pure iptables entries this way:

    # Iptables messages
    kern.=debug            -/var/log/iptables.log

    # save the rest in one file
    *.*;mail.none;news.none;kern.!=debug    -/var/log/messages

2.   In my filters I've created a separate rule for each of the major 
violations just like you've done. The only difference is I don't log the 
entry before dropping it. I already know what these entries are and I 
wouldn't know what to do with the logs anyway.

3.  I run:  iptables -L -n -v -x -Z > /var/log/iptables.report in a 
daily cron script.

4.  I modified my logrotate script to mail me the messages and 
iptables.log file each day before rotating the logs.

# Custom log rotation scripts.
/var/log/messages /var/log/iptables.log {
    rotate 7
    missingok
    daily
    mailfirst
    mail ServAdmn@Trans-Star.net
    create 0644 root root
    postrotate
        /etc/init.d/syslog reload
    endscript
}

Result:
I have 3 files to review each morning. The /var/log/messages file has 
pure kernel entries in it. If things are going ok this file is pretty 
short and boring. If there's a kernel problem it's real obvious. The 
iptables.report shows all the traffic by rule. This tells me what rules 
are catching the most crap and which rules aren't used at all. I don't 
have the detailed log that you get, but I have the metrics and that 
tells me if there's any unusual activity. What's left in the 
iptables.log file is the interesting stuff I want to look at: usually 
scans, packets that should be getting through but aren't, and an 
occasional bit of internal mischief   :-p

>  
>
>>2.  I tried applying rules like these with -p all and I ended up 
>>trapping all kinds of local ICMP traffic and broke lots of things. 
>>    
>>
>
>Humm. TCP is the only protocol (that I'm aware of) that actually uses
>flags, so this would be hard to do with other transports. For example
>you can't identify state with UDP, just direction and port. The problem
>with logging all invalid this way is that you end up throwing everything
>that does not hit a permitted port into the same bit bucket. For
>example:
>
>iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 1024:65535 -d 0/0
>--dport 1433:1434 -j LOG --log-prefix " MS_SQL "
>iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 1024:65535 -d 0/0
>--dport 1433:1434 -j REJECT --reject-with icmp-host-unreachable
>iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 500 -d 0/0 --dport 500
>-j LOG --log-prefix " IPSEC_SCAN "
>iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 500 -d 0/0 --dport 500
>-j REJECT --reject-with icmp-host-unreachable
>iptables -A FORWARD -i eth0 -p udp -d 0/0 --dport 135:139 -j LOG
>--log-prefix " MS_CRAP "
>iptables -A FORWARD -i eth0 -p udp -d 0/0 --dport 135:139 -j REJECT
>--reject-with icmp-host-unreachable
>
>Again, this just allows me to segregate all my traffic based on specific
>patterns so its easier to review. I use grep to extract these entries in
>a similar fashion to what I described about. 
>
>To give you an idea how effective this is, on an average day I generate
>70-80 MB worth of firewall log entries. Its not uncommon to have all of
>this traffic, except for maybe 100 KB, extracted into its own file. This
>means that I go from having 80 MB to 100 KB of log files that I actually
>have to put my thinking cap on to review. The rest is done
>automagically.
>
>As for breaking ICMP and others, could be you ended up letting through
>established traffic, but not related (related being ICMP type 3's, 4's,
>5's and 11's). A quick review of your rules should show you if this is
>the case.
>
>  
>
I'll take a look, thanks.

Jeff


