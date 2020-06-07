From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Documentation.
Date: Sun, 7 Jun 2020 23:23:47 +0200
Message-ID: <20200607212347.GA24054@salvia>
References: <alpine.DEB.2.21.2006061631470.11442@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006061631470.11442@piplus.local.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Cc: netfilter@vger.kernel.org

Hi,

On Sat, Jun 06, 2020 at 06:09:22PM +0100, G.W. Haywood wrote:
[...]
> Ideally I'd like to know which process ID is using which connection.
> Because there may be simultaneous connections, if I don't know which
> one is which, then I have to wait for all of them to go away before
> cleaning up, and this can sometimes take hours.  When a connection is
> first created I could mark it from user space.  Then I can look for
> the mark when it's time to clean up, but I'd prefer not to have to do
> that if there's a way of identifying it which does not involve this
> separate marking operation.  Is there such a way?
> 
> Secondly, I wanted to get conntrackd to log via syslog using facility
> 'mail'.  It won't do it.  It will log using 'local0' etc., but claims
> that facility 'mail' is not a known syslog facility (even though I am
> using it extensively in my milters).  This is my configuration, it is
> only very slightly edited from the Debian original:
> 
> 8<----------------------------------------------------------------------
> mail6:/etc/conntrackd# >>> cat conntrackd.conf
> General {
>         HashSize 8192
>         HashLimit 65535
> 
>         Syslog mail
> 
>         LockFile /var/lock/conntrackd.lock
> 
>         UNIX {
>                 Path /var/run/conntrackd.sock
> #               Backlog 20
>         }
> 
>         SocketBufferSize 262142
>         SocketBufferSizeMaxGrown 655355
> 
>         # default debian service unit file is of Type=notify
>         Systemd on
> }
> 
> Stats {
>         LogFile on
>         Syslog mail
> }
> 8<----------------------------------------------------------------------
> mail6:/etc/conntrackd# >>> service conntrackd restart
> [....] Stopping conntrackd[Sat Jun  6 17:22:07 2020] (pid=6268) [warning] 'mail' is not a known syslog facility, ignoring
> [Sat Jun  6 17:22:07 2020] (pid=6268) [warning] 'mail' is not a known syslog facility, ignoring.
> . ok [....] Starting conntrackd[Sat Jun  6 17:22:09 2020] (pid=6292)
> [warning] 'mail' is not a known syslog facility, ignoring
> [Sat Jun  6 17:22:09 2020] (pid=6292) [warning] 'mail' is not a known syslog facility, ignoring.
> . ok
> 8<----------------------------------------------------------------------
> 
> The man page is not clear on what facilities I can use; if I change
> facility 'mail' (for example) to 'local1' the warnings go away, but of
> course I don't want to do that.  It isn't a show-stopper, I can do it
> some other way, but it's a nuisance.

Probably you may use ulogd2 instead for this use-case? Use the NFLOG
input driver which includes the process UID and GID. You could match
on the first packet new packet based on the conntrack information.

conntrackd only supports a limited number of syslog facilities (only
daemon, local0 to local7), although it should be relatively easy to
extend it to support for other facilities.

> Thirdly, it seems that
> 
> http://conntrack-tools.netfilter.org/
> 
> and
> 
> http://conntrack-tools.netfilter.org/manual.html
> 
> haven't been updated since 2012.  Am I expected to be reading these,
> or is there something else more recent which replaces it?  The latest
> release of conntrack-tools mentioned on the site is 1.4.0, although my
> version of conntrack is 1.4.5 (- and it's a Debian package! -) and the
> man page does refer me to the conntrack-tools.netfilter.org Website.

The manual mostly focuses on conntrackd for state synchronization (high
availability) and the userspace conntrack helper mode.

> Examples in chapter 5, "Using conntrack: the command line interface":
> 
> [QUOTE]
> # conntrack -U -p tcp --dport 3486 --mark 10
>  tcp      6 431982 ESTABLISHED src=192.168.2.100 dst=123.59.27.117\
>  sport=34846 dport=993 packets=169 bytes=14322 src=123.59.27.117\
>  dst=192.168.2.100 sport=993 dport=34846 packets=113 bytes=34787\
>  [ASSURED] mark=1 secmark=0 use=1
> conntrack v0.9.7 (conntrack-tools): 1 flow entries has been updated.
> [/QUOTE]
> 
> (1) The mark in the command line is '10', not '1'.
> (2) The dport in the example is '993', not '3486' and not '34846'.

Fixed upstream, thanks.

> Point (2) applies to other examples in the same section.  All give me
> the impression of having been hand-crafted, rather than cut-n-pasted,
> for example because on updates and deletes the tool does not print the
> text "has been deleted"; it prints "have been deleted".
> 
> If the documents I'm reading are obsolete, I would suggest that they
> should be taken down, and that the man pages for conntrack, conntrackd
> and conntrackd.conf should be updated.  I'd be very happy to produce a
> few patches if I can get the right information.

I made a quick revamp:

http://git.netfilter.org/conntrack-tools/log/

There is information which is not included in the manpage,
specifically for the state synchronization (HA) and the userspace
connection tracking helpers.

The statistics mode, which is the one you're interested in, is not
documented there though.

Thanks.
