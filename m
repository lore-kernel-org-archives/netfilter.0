From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Firewall performance querry
Date: Tue, 09 Sep 2003 06:54:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5DB160.3080909@chrisbrenton.org>
References: <20030905062950.M87452@ahm.cmc.net.in> <20030909053404.M44692@ahm.cmc.net.in>
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
To: Pradeep Bhomia <pradeepbhomia@ahm.cmc.net.in>
Cc: netfilter@lists.netfilter.org

Pradeep Bhomia wrote:
> 
>  Before moving ahead I want to know what will be the load on the
> firewall. The configuration of firewall box is P4, ~1.8GHz, 256MB RAM, 
> Mandrake Linux 9.1, IPTables 1.2.7 and Shorewall 1.3.14. I will be having 
> aroung 300-400 concurrent users.

You didn't mention link speed. Really it comes down to concurrent 
sessions rather than total users that defines the amount of throughput 
you need. Knowing the link speed will help you figure out if the 
performance gate will be the firewall or the link.

With that said, I've pushed as much as 300 Mb though a similar box (1.2 
GHz w/512 MB RAM) and its worked great, ***provided*** you are not 
trying to log too much of the traffic. If you do, the log entries start 
getting truncated with only partial information getting recorded, and 
latency across the firewall starts to climb drastically. With this in 
mind, hardware with good disk and bus I/O becomes more important than 
CPU. I've found that Compaq/HP Proliant boxes outfitted with RAID seems 
to do the best job in keeping up, your mileage may vary.

<soapbox>
I *think* part of the reason why this is a problem is that iptables 
records more information about passing packets than any other packet 
filtering firewall (this is one of its strengths in my book). Recording 
more info means more of a performance hit. It would be nice if '-j LOG' 
supported a '--verbose' setting or something similar so the user could 
choose between detailed info like it products now, and minimal info more 
in lines with commercial products. That way you could at least be 
logging something at high speeds rather than nothing at all.
</soapbox>

> I plan to setup NATting. Can anybody help me 
> in this regard. Whether NATting will be sufficient to take care about this 
> load or some other method can be used ( Total load on firewall will be some 
> 1000 email accounts on sendmail server and around 400 clients for web 
> browsing).

SMTP is not too bad as its pretty efficient. HTTP is the one that kills 
you as it spawns a unique concurrent session for every object on a web 
page you try to view. For example a user visiting www.netfilter.org 
generates 6 unique sessions to view the homepage. Microsoft's homepage 
is 10 sessions, Security Focus is 70, you get the idea.

Max concurrent sessions on iptables is around 16K, but you can tweak 
this up if needed. Again, keep an eye on how much logging you are doing 
and life should be cool.

HTH,
C


