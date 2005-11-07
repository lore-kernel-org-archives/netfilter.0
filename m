From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: would like advice on paranoid host-based iptables rules
Date: Mon, 7 Nov 2005 07:47:20 -0600
Message-ID: <200511070747.20396.rob0@gmx.co.uk>
References: <BAY108-F34E600F7B51506D9C1E859DE600@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY108-F34E600F7B51506D9C1E859DE600@phx.gbl>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 2005-November-04 17:41, amir amire wrote:
> I need to run the script again after the ip-address supplied by
> the cablemodem is changed to the comcast address.

I have Comcast, and my IP is for all practical purposes, static. It 
changed in May when my old server died, and I had the previous IP 
address at least 2 years. I think I'm on my 4th IP address since 2002.

> Is there a way to 
> supply the new address automatically? Besides that is works OK.

This would be a feature of your DHCP client, or possibly of some DHCP 
frontend scripts provided by your distro.

> What would be the most paranoid host based iptables ruleset you
> can have and still get access to the web and dhcp and whatever
> else those two things need?

I hate to answer such a question. I would rather suggest that you 
consider your threat model and design intelligent rules to match. If 
you're running a Linux workstation, not routing traffic for a LAN, 
there's not much cause for worry in A.D. 2005. Keep it updated with 
security patches.

Carefully consider if you want to have services open. Having none open 
(as your script indicates) gives you even less cause for worry.

This is not MS Windows! Sure, there are automated exploits crawling 
along, but the only ones I know of for Linux are targeting vulnerable 
sshd's and perhaps looking for exploitable apache/php's. Oh, and of 
course the SMTP open relay bots.

If you want to open sshd, know the issues concerning that. The bots try 
to guess passwords for common accounts. If you only allow secret key 
authentication, problem solved! If you want to allow passwords, make 
and enforce a good password policy. And of course do not allow root 
logins; it's never necessary. sudo(1) and su(1) are your friends.

If you want to open an apache httpd, your main worry will be with any 
php or other executable content you offer. Static HTML on a recent 
apache release should be safe enough.

And so it goes for any other service. Subscribe to your distro's 
security announcement mailing list and to announcements for any open 
services you choose. Act when they tell you to act. Sleep well.

If you don't want to have any services open, simply don't use root for 
things other than actual system administration. Keep backups of your 
$HOME in case of mistakes. Unix/Linux is not immune from the kind of 
problems which plague MS Windows, but through use of non-privileged 
accounts the damage can be contained.

> $IPT -P OUTPUT DROP

This is indeed paranoid. Much pain, little if any gain. I rarely use 
OUTPUT filtering. I think anyone who needs to ask about it here should 
never consider it.

> $IPT $IN $STATE INVALID,NEW $BLOCK
> $IPT $IN $STATE ESTABLISHED -i eth0 -d $EXTADDR -s ! $EXTADDR $ALLOW
> $IPT $IN $BLOCK
> $IPT $OUT $STATE INVALID $BLOCK
> $IPT $OUT $STATE NEW,ESTABLISHED -o eth0 -s $EXTADDR  -d ! $EXTADDR
> $ALLOW
> $IPT $OUT $BLOCK 

That should work. It's not as restrictive as you said you want, but my 
advice is not to worry about that.

Paranoia is defined as irrational fears, fears which have no rational 
basis. It doesn't make you safer, quite the contrary, because fussing 
over evil which does not exist is likely to blind you to real evil.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

