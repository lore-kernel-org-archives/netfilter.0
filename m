From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables enough to handle brute force attacks?
Date: Tue, 5 Apr 2011 08:52:29 -0500
Message-ID: <20110405135229.GA32551@cardinal>
References: <pvplp6t1hsoea6n5sriuna0375k5s79pmm@4ax.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <pvplp6t1hsoea6n5sriuna0375k5s79pmm@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Apr 05, 2011 at 12:02:38PM +0200, Gilles wrote:
> I need to connect an Asterisk server to the Net so that 1) remote
> users can register and 2) Internet users can ring any extension on
> the server.
> 
> I'll use iptables to prevent hackers from trying to register.
> 
> I was wondering what solution to use to block brute force attempts:
> 
> - just rely on iptables since it offers a way, eg. "iptables -I INPUT
> -p udp --dport 5060 -m state --state NEW -m recent --update --seconds
> 600 --hitcount 2 -j DROP"

2 in 600 might be low for --hitcount, high for --seconds. NEW is just 
wrong, because attacks will be ESTABLISHED. See also:
    http://www.spinics.net/lists/netfilter/msg49598.html
    http://www.spinics.net/lists/netfilter/msg49660.html
    http://www.spinics.net/lists/netfilter/msg49676.html

My ruleset is working, at least to block the SIP attackers, but I 
still don't know if a non-whitelisted Internet SIP user could ring 
extensions. From discussion with a SIP expert, I think even my 
--hitcount of 9 in 30 or 18 in 45 might still be too low.

But no more log floods, which is good, my main goal.

> - add Brute Force Detection (BFD), which is a shell script that is
> called by CRON (ie. every minute at most)
> www.rfxn.com/projects/brute-force-detection/
> 
> - add SSHGuard, which is apparently a stand-alone binary program that
> doesn't rely on CRON
> www.sshguard.net
> 
> This is on an embedded Linux, so there isn't enough RAM to run
> Python-based fail2ban.

On an embedded system, I would use a remote syslog server anyway. Let 
your log parsing be done on a less-restricted machine, and have it 
ssh in and sudo to do what needs to be done.

> If you have installed Asterisk and iptables, which solution did you
> end up using?

But as mentioned in one of the links above, I don't like log parsing 
in general. Just experiment with the -m recent rules and try some 
calls.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
