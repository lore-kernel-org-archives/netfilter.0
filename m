From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd daemon stops: is conntrackd running?
Date: Thu, 15 May 2008 16:07:59 +0200
Message-ID: <482C43BF.2040300@netfilter.org>
References: <482838EA.7080003@cica.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482838EA.7080003@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Florencio <pabloflorencio@cica.es>
Cc: netfilter@vger.kernel.org

Pablo Florencio wrote:
> Hi to everyone.
> 
> First of all, I apologize for my english.

Your English is just fine.

> I have installed conntrackd in my high availability firewall cluster and
> I found one problem that I can't resolve. The installation was ok, I
> used Heartbeat instead of Keepalived for set up the virtual ips and the
> conntrackd script and it seems to work fine- I have checked that both
> nodes can dump the internal and external cache correctly.

This report doesn't help that much, what do the log file says? Please,
also include the version of the software that your using, including the
libraries.

> The problem comes when tried to use conntrackd a few minutes later since
> the daemon has started, for example, if I want to dump statistics
> collected by daemon I found this error message:
> 
>>conntrackd -s
>>can't connect: is conntrackd running? appropriate permissions?
> 
> The commands -c -f -R -k, etc, give the same result. If I try to restart
> the dameon I get this message:
> 
>>conntrackd -d
>>lockfile `/var/lock/conntrack.lock' exists, perhaps conntrackd already
> running?

Apparently, it seems that it is crashing but I need more information to
give you a hand.

> If I look for the conntrackd process ( ps -ef | grep conntrackd ) I
> found that it has disappear, so I have to delete the .lock file to be
> able to start ir again.
> 
> Is there any problem using heartbeat instead of keepalived? I can see it
> working fine for a few minutes but after that I mysteriously found this
> error in both nodes.

Not really, I truly prefer keepalived but it's up to you.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
