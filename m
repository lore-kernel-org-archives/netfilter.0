From: "Sebastian Vieira" <sebvieira@gmail.com>
Subject: Re: multiprimary conntrackd setup
Date: Wed, 25 Jun 2008 23:02:50 +0200
Message-ID: <279239c70806251402gd39c854ua943c88b43e426ef@mail.gmail.com>
References: <279239c70806170402j47f89251s2379d0909c1bca0e@mail.gmail.com>
	 <48590828.2060206@netfilter.org>
	 <279239c70806222346r834dd7bpa6e260794237cdba@mail.gmail.com>
	 <485F6849.7030606@netfilter.org>
	 <279239c70806230542h1f68765eha99fb21721a9ca6c@mail.gmail.com>
	 <48611B92.3060200@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=PupYNf1uuCsW5NsNTA+U3yL0Dd7V0rLykVfLh6DqkDE=;
        b=o/kid0W7Qfm7KpVX8uqioN7N9de9WwBJJX945iKSE+4Qh8rFMlbCyoM0U2US0mq/fb
         38/5oRkYzEs5vZhmvGUTJNV/rDGJc4eGgp6LdVxgeG7JGwVdoocKY++m/YgcMlL3kSH9
         83YSwxoCwFyowq4wnWyD/Jvlq3lnFl7z3jB30=
In-Reply-To: <48611B92.3060200@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Tue, Jun 24, 2008 at 6:06 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Actually, the nodes must use a dedicated link, otherwise you risk to
> leak state information. And please, elaborate your setup a bit more.

Hm, the hardware lacks a dedicated link at the moment so i send mcast
traffic over the least used link. I'll see if i can add an extra NIC
to get the dedicated link up.

I'll try to describe the setup better:

There are two firewalls, both configured as BGP routers using quagga.
Right now we have configured it so that traffic leaves through one
node and comes back through the other. There is no HA software
configured for this, only for the floating IP (main gateway ip). It
was my understanding that connection updates would be inserted
immediately, not depending on a HA manager script.

Also, since this is a production environment and we can't really
'experiment' too much with it, the way we're similating the
active-active setup now is by adding a static route to some external
host via the inactive firewall so the packet route is as follows:

[our host in dmz] -----> [fw02] -----> [external host] -------->
[fw01] ------> [our host in dmz]

But i guess that the ACK to our external host, and the SYN/ACK
response from it, is faster that the conntrackd synchronization
between fw01 and 02. Am i right in that assumption?


> If you're using NOTRACK, the nodes do not seem to be in sync as the
> number of internal cache entries in node1 must be equal to node2's in
> the external cache. I guess that you've been testing the failover
> several times before posting this results. BTW, which HA manager are you
> using? The HA manager is required to assist conntrackd as it invokes
> several important commands (see the scripts).

See above. Did i understand the working of conntrackd incorrectly?

We have somewhat come to the conclusion that a multiprimary firewall
setup is maybe impossible to accomplish due to the latency and that it
might be better (read: easier) to split the routers from the firewalls
(they are now one and the same physical machine), have only 1 firewall
active at the time and add the HA manager to sync conntrack tables
upon failover.

regards,


Sebastian
