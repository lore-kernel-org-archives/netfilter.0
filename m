From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Log incoming traffic
Date: Thu, 6 Oct 2005 00:04:24 -0500
Message-ID: <200510060004.24795.rob0@gmx.co.uk>
References: <006001c5ca30$0df88940$580110ac@HO.lippogeneral.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006001c5ca30$0df88940$580110ac@HO.lippogeneral.com>
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

On Wednesday 2005-October-05 23:40, Winanjaya - PBXSoftwares wrote:
> How to log incoming traffic to a file (ie. /var/log/incoming) .. ?
> I need advise

I give advice. Don't do it. :)

Really, what do you expect to see from all that? Anything you need to 
see (connections to running daemons) are logged anyway.

What exactly is your question here? Common logging targets include LOG 
(oddly enough) and ULOG. Both are described in "man iptables". Please 
review that before asking again, but whilst we're here I'll go ahead 
and explain that LOG logs to syslog and ULOG passes logs to userspace.

An important match extension commonly used with logging is -m limit. 
Just how important is it? If you logged all packets without --limit, 
you could easily crash your system, or at least your syslogd. If you're 
doing remote logging you could even create a loop ... every log entry 
generates another one, until memory runs out and syslogd dies.

Just a few days ago there was a similar discussion. Please review that 
too.

I get the feeling that you would be better served by a ready-made 
firewall script. There are many of them available. Did you try any of 
them? The one you're using, the default RH or Fedora firewall, is a 
very poor choice, which is why I lost my composure. :)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

