From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: where should logs go??
Date: Mon, 08 Sep 2003 06:36:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5C5B97.1050805@chrisbrenton.org>
References: <200309080812.NAA08173@WS0005.indiatimes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: akshaysalkar <akshaysalkar@indiatimes.com>
Cc: netfilter@lists.netfilter.org

akshaysalkar wrote:
> i was going throught eh iptables tutorial etc.
> and regarding logging... i am quite confused.
> it says somehwere in the tutorial that specifaction of iptables should be
> iptables -A FORWARD -p tcp -j LOG --log-level debug

I think this is a personal choice kind of thing. I prefer to use 
info-level as it keeps the entries off of the console. That can be quite 
annoying if you are tweaking the firewall from the terminal.

> i'm confused.
> i tried kern.warn
> and the logs do go to /var/log/iptables (the file i created for itpables logs) but then quite a lot go to /var/log/messages also.> 
> i want to avoid the messages going to /var/log/messages

Again, I think this is also a personal choice as some people want the 
firewall logs in a separate file, while others (like myself) prefer to 
leave it in messages.

I leave it in messages for a couple of reasons. To start, I use Swatch 
to generate alerts based on patterns I've defined. You have to run a 
unique instance of Swatch for every log file you want to monitor, so 
fewer logs means fewer copies of Swatch to keep track of as well as less 
of a chance for conflicts (like 2 different copies of Swatch trying to 
dial-out through the attached modem to send a pager alert).

The other reason has to do with how I review my logs. I have a ton of 
rules written like this:

iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j LOG 
--log-prefix " SYNFINSCAN "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j REJECT 
--reject-with icmp-host-unreachable

iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN -d 0/0 --dport 
1433:1434 -j LOG --log-prefix " MS_SQL "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN -d 0/0 --dport 
1433:1434 -j REJECT --reject-with icmp-host-unreachable

So all of my log entries get written with a prefix that describes the 
attack pattern being logged. Then what I do is I have a shell script 
that kicks off every morning that looks something like this:

cp /var/log/messages.1 /root/logcheck/full_firewall.log
cd /root/logcheck
grep gw1 full_firewall.log > cb.txt

These three lines grab the messages log from the day before and extract 
all the log entries for the host gw1 which is my primary firewall (this 
script obviously runs on my logging host).

Then I do this:

grep -v ntpd cb.txt > cb1.txt
grep -v crond cb1.txt > cb2.txt

This removes all the log files I expect to see on gw1 that are not 
related to the firewall log entries. After that, I parse the firewall logs:

grep  INBOUND_SSH cb2.txt >inbound_ssh.txt
grep -v  INBOUND_SSH cb2.txt > cb3.txt
grep  SYNACK cb3.txt > syn-ack.txt
grep -v SYNACK cb3.txt > cb4.txt
grep PING cb4.txt > ping.txt
grep -v PING cb4.txt > cb5.txt
grep SYNFINSCAN cb5.txt > synfin-scan.txt
grep -v SYNFINSCAN cb5.txt > cb6.txt

Note that the value I'm grepping for is the log prefixing I defined 
above. This continues until I've extracted every pattern and put it into 
its own unique file. Then with the leftovers I do a:

mv cb37.txt interesting-stuff.txt

Now, the first thing I hit in the morning is 'interesting-stuff.txt' for 
two reasons. #1, it has all the traffic patterns I have not previously 
defined so I like to see if someone has tried something I have not 
thought of yet. #2, if someone has whacked my firewall and Swatch missed 
it, the tell tale log entries will end up in this file. Granted I'm 
reviewing packet logs at this point, but if someone whacked the firewall 
and I've missed it so far I want to know about it. Note this works 
because I started by removing all non-firewall related log entries that 
I _expected_ to see. So what I'll get here is the unexpected.

Other nice thing about this process is that you don't have to even look 
in every file, just check file sizes. For example I can tell you that on 
a normal day I see about 10K worth of FTP scans. If I look at the file 
size and its around 10K or less, I can probably ignore it. If its 500K, 
its worth checking out the file to see why. If its due to FTP probes 
from lots of different IP addresses, then there is probably a 0-day FTP 
exploit making the rounds and I should closely check my FTP servers as 
well as check Bugtraq, PacketStorm, and other places to see what is 
vulnerable.

Other nice thing about this process is its great for catching the slow 
scanners. For example if one of the people looking for FTP service is 
trying to be stealthy by only sending a probe packet every 2 hours, this 
will still stick out like a sore thumb as its all in the same (smaller) 
file.

So in my case, leaving the log entries in /var/log/messages is actually 
a "feature" and makes my life much easier. Your mileage may vary. ;-)

BTW, for those of you reading this post thinking "hey just use Perl 
instead of grep and you could do that in like 5 lines", you are 
absolutely correct. I teach the perimeter track for SANS and one of the 
things I teach in class is my log review process. I can teach students 
how to use grep in 5 minutes so they can start creating scripts that are 
appropriate for their own environment. Teaching Perl would take a bit 
longer. ;-)

HTH,
C


