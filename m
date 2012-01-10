From: Jon Lewis <jlewis@lewis.org>
Subject: Re: Simplest failover solution for iptables firewall (router)
Date: Tue, 10 Jan 2012 16:12:10 -0500 (EST)
Message-ID: <Pine.LNX.4.61.1201101605190.24418@soloth.lewis.org>
References: <CAKywjPpp3xsP=Rkvnfxo_7T-5xcZZuuzqSWy6M8u4bqX0C-KOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPpp3xsP=Rkvnfxo_7T-5xcZZuuzqSWy6M8u4bqX0C-KOA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Anton Melser <melser.anton@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 9 Jan 2012, Anton Melser wrote:

> Now that I have my policy-based routing NAT FW working as expected
> (thanks for everyone's previous comments!), I would like it to be
> resilient. The more I think about it the less I want to bother with
> true HA (so keeping track of connections). My solution can handle
> 20-30 seconds of downtime with no real problems. And if on the odd
> occasion it went up to 2-3 minutes it wouldn't actually be that much

Heartbeat can do this.  You'll want to setup something (could just be a 
shell script either run by hand or by cron) to rsync certain things like 
the iptables config to the standby FW...and setup a cron job on the 
standby FW to restart iptables when necessary, i.e.

# has iptables been updated?
* * * * * root test /etc/sysconfig/iptables -nt /var/lock/subsys/iptables && service iptables restart

Setup properly, if FW1 dies or loses its uplink, etc., FW2 will take over, 
and open connections will be lost, but other than that, life will go on.

> Does anyone have experience with such a setup? It looks as though at a
> minimum there is keepalived and pacemaker+heartbeat. Is one
> better/worse for a specialised firewal box?

I've been using the old heartbeat (comes with CentOS/RHEL 4/5.x) for this. 
As of 6.x, heartbeat is deprecated and you're expected to use pacemaker 
instead.

----------------------------------------------------------------------
  Jon Lewis, MCP :)           |  I route
  Senior Network Engineer     |  therefore you are
  Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
