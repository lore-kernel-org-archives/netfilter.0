From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: Is using a blacklist in iptables a good strategy?
Date: Wed, 07 Dec 2005 09:47:44 +0200
Message-ID: <439693A0.2060008@eccotours.dyndns.org>
References: <DGEJKHJNFFKAGKLEMOPJMEEACAAA.netfilter@leangen.net>
Reply-To: bclark@eccotours.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <DGEJKHJNFFKAGKLEMOPJMEEACAAA.netfilter@leangen.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Leangen <netfilter@leangen.net>
Cc: netfilter@lists.netfilter.org

David Leangen wrote:
>>>I don't know why, but I'm getting a little fed up with break-in
>>>attempts happening every single day.
>>>
>>>Do I just have to accept this as a fact of life?
>>
>>What sort of attacks are these?  Are they against services you're
>>running or just port scans and similar?
> 
> 
> Well, generally they are mostly port scans and similar.
> 
> These have been going on for some time, but it seems that there are an
> increasing number of attempts to break into my system via port 22.

Hi

I too have been having the same problems, etc, but what I did was a range of things for e.g.

My working hours about between 7am and 6pm, so what I did was have two scripts, one open port 22 script and one close 22
script (and a few other like ftp etc)

so in my crontab I have the following:

0 6 * * 1-6 root sh -c /root/FIREWALL.OPEN > /dev/null 2>&1
59 16 * * 1-6 root sh -c /root/FIREWALL.CLOSE > /dev/null 2>&1

The other thing is, I run debian, for my adduser.conf, I set it so

mail:~# cat /etc/adduser.conf

# /etc/adduser.conf: `adduser' configuration.
# See adduser(8) and adduser.conf(5) for full documentation.

# The DSHELL variable specifies the default login shell on your
# system.
DSHELL=/bin/false

So yeah you can have the password, but you cant ssh in with that account.

If a user needs to have a shell access look at things like bash with the --restricted (the other is rbash) option, other 
wise there is chroot.

And then last, but not least is Grant Taylor's brilliant netfilter / ssh brute force stopper.

$IPT -N SSH_Brute_Force
$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
$IPT -A SSH_Brute_Force -s $myipaddress -j ACCEPT
$IPT -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j ACCEPT
$IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
$IPT -A SSH_Brute_Force -p tcp -j DROP

A while ago I was at a security conference, and the speaker, said security needs to be like an onion (layers).
The more layers (obsticles), the better.

HTH

Kind Regards
Brent Clark

