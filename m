From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: conntrackd daemon stops: is conntrackd running?
Date: Mon, 12 May 2008 16:16:15 +0200
Message-ID: <20080512141615.GA19262@outback.rfc2324.org>
References: <482838EA.7080003@cica.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <482838EA.7080003@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Pablo Florencio scripsit:

Hi!

> I have installed conntrackd in my high availability firewall cluster and 
> I found one problem that I can't resolve. The installation was ok, I 
> used Heartbeat instead of Keepalived for set up the virtual ips and the 
> conntrackd script and it seems to work fine- I have checked that both 
> nodes can dump the internal and external cache correctly.

> The problem comes when tried to use conntrackd a few minutes later since 
> the daemon has started, for example, if I want to dump statistics 
> collected by daemon I found this error message:

[conntrackd dies after some time]
> Is there any problem using heartbeat instead of keepalived? I can see it 
> working fine for a few minutes but after that I mysteriously found this 
> error in both nodes.

I'm running conntrackd with heartbeat wihout a problem for a while now.
Most probably you hit the same bug in libnetfilter-conntrack than I
did some weeks ago.

See http://marc.info/?l=netfilter-devel&m=120942089523985&w=4 for
details.

Ciao
Max
-- 
	Follow the white penguin.
