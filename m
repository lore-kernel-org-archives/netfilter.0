From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: Help in IPTABLES
Date: Tue, 14 Jan 2003 15:33:52 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3909.192.168.7.41.1042518832.squirrel@iw.k1k2.com>
References: <200301131530.14106.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301131530.14106.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> On Sunday 12 January 2003 03:01 am, Arnt Karlsen wrote:
> 
>> ..the wee point I was trying to make, is an iptables firewall is
>> vulnerable while it is being set up, so echo "0" first to stop
>> forwarding, set up the firewall, and echo "1" at the end of the
>> script to start forwarding again, a wee nit into your helpful
>> responses to him.
> 
> I do this myself in my script, but believe there is an additional 
> solution, at least for some distros:
> 
> I'm running RedHat 7.3, and so everything runs off SysV-Init.  I was 
> greatly bothered by the fact that the S07iptables startup link would
> get  run quite a bit (well, a few seconds at least :^) before my
> firewall  would.  Changing my firewall to a lower number in the
> sequence wouldn't  work easily, since I'm on a Dynamic IP at the moment
> and had to start up  ADSL to get the IP, since I use it 'statically' in
> SNAT.  It also would  need (or at least want) syslog up and running. 
> Couldn't easily move  ADSL up in the sequence, since it depended on
> networking in general.   Everything is pretty much fixed in the
> sequence it already starts in.
> 
> Then it occurred to me:  Modify the /etc/init.d/iptables script to set 
> DROP policies, instead of the horribly shortsighted ACCEPT default it 
> uses.  As soon as this occurred to me I changed it, and I feel much
> more  comfortable now, knowing that if the whole startup collapses
> right after  iptables and network scripts, I'm still not wide open.
> 
> My sequence now is 
> iptables->ip6tables->network->syslog->ADSL->firewall->ip6firewall-
>freenet
> (freenet is the startup for the IPv6inIPv4 tunnel)
> 
> I modified the /etc/init.d/iptables script to set DROP policies in both
>  the 'start' and 'stop' functions.
> 
> Despite being more comfortable with this, I'd like to hear if anyone
> sees  a hole in my reasoning.
> 
> j

Totally lacking in useful details but ...
I setup 2 client machines with RH7.3 back in August ...
I always modify the "network" script to run my own rc.firewall
(that's just how I do it ;-)
I used to do it before the interfaces came up, I've now changed
it to do so AFTER the interfaces come up
The reason is that 7.3 wouldn't forward packets to the internet
unless my firewall script was run after the interfaces started.
Internet connection using ADSL
(I liked the "before" option coz it avoided the short hole in
security while booting ... on ipchains)
I didn't go into the details of what was going on, but I worked it
out by reinstalling my own 6.2 firewall as 7.3 and then spotted the
solution to whatever problem I had caused (I never worked out
exactly what the problem was) by the fact that it worked if I AGAIN
ran my rc.firewall after it had finished booting
Anyway - just a hint if you happen to get the same problem with
your "iptables->ip6tables->network->syslog->AD
           SL->firewall->ip6firewall->freenet"
though it may never happen to you ...
I never did bother to work out the true cause :-)

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


