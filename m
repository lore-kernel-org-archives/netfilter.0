From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 4 May 2013 23:01:45 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305042255530.10339@blackhole.kfki.hu>
References: <51854232.1030306@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51854232.1030306@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Flex <aflexzor@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 4 May 2013, Alex Flex wrote:

> Ive been receiving lately two types of syn floods on an Intel Xeon 
> 2.4ghz + 4GB machine exclusively dedicated for this and the findings 
> have me very confused:
>  I have syn cookies enabled and checked to be working as per syslog.
> This machine has a 10gigabit uplink so I know that networking isnt a
> bottleneck here (bandwith or router hardware based).
> 
> SCENARIO 1: the first attack was: 105mbits @ 330,000 pps and it brought the
> machine to 100% CPU usage and over 50% packetloss Load average 12. At that
> time it had a simple iptables script that that had less then 5 blacklists of
> port 80 ips and then a ACCEPT On port 80, nothing fancy. I disabled iptables
> and load average went down immediately to 8 but there was still high packet
> loss so basically we where DoSed efficiently.

What about connection tracking? Did you rmmod the corresponding kernel 
module?
 
> SCENARIO 2: After that the attacker sent only a 30mbit synflood @ 70,000 pps
> .. Now i had less packet loss, and interestingly with iptables enabled it
> would create almost immediate packetloss. At this time I tried to explore
> installing conntrack-tools information about the state table. conntrack said
> that with iptables enabled and syncookies the maximum entries where 1300
> ONLY... and a CPU usage reported by HTOP of 40% on SI. After that I decided to
> drop iptables all together and immediately port 80 started flowing with normal
> traffic (we have less than 1mbit clean traffic) . No packetloss was present,
> because iptables was disabled conntrack did not report any entries and
> netstat-na |wc -l reported less than 300.

What do you mean exactly by "dropping iptables all together"?

Syncookies are not taken into account by conntrack, so it works as usual 
unless the module is unloaded. If you did not tune (increased) the hash 
size, it might be possible that conntrack or it's hashing was successfully 
attacked.

Best regards,
Jozsef 
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
