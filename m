From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd synchronisation at startup
Date: Thu, 15 May 2008 16:03:36 +0200
Message-ID: <482C42B8.6010500@netfilter.org>
References: <20080515145035.ecbpgmdr8cg0o80o@webmail.ionblast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080515145035.ecbpgmdr8cg0o80o@webmail.ionblast.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Painchaud <dash@ionblast.net>
Cc: netfilter@vger.kernel.org

Christophe Painchaud wrote:
> Hello,
> 
>  I managed to create a cluster of 2 firewalls that share their conntrack
> tables ; but I've got a little problem/question:
> 
>  When I restart a node to simulate a failure, it won't request existing
> connections, it will only get news ones. I am forced to do a 'conntrackd
> -n' to resync it all. I tried to start conntrackd with 'conntrackd -d
> -n' or 'conntrackd -dn' . No success here. Is there a proper way to do
> this ? should I create a startup script that run -d command line, and
> then -n ?

conntrackd does do this by itself, it needs the help of a failure
detector manager, eg. keepalived. You have to include the conntrackd -n
in your scripts when the node hits backup state. Have a look at the doc/
directory inside the conntrack-tools.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
