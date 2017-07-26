From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: User defined chains to reduce/make more readable
Date: Wed, 26 Jul 2017 11:22:09 -0500
Message-ID: <20170726162209.GM32555@harrier.slackbuilds.org>
References: <aa7cbc43bc58207ef3867861ecaa0169.1501056202@squirrel.mail>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <aa7cbc43bc58207ef3867861ecaa0169.1501056202@squirrel.mail>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Jul 26, 2017 at 10:03:22AM +0200, Walter H. wrote:
> I define this chain:
> 
> -N RESTRICT-HOST

(For iptables-restore(8) the user chains are in the chain subsection 
just under the built-in chains.)

> -A RESTRICT-HOST -p icmp -j ACCEPT
> -A RESTRICT-HOST -p udp --dport 123 -j ACCEPT
> -A RESTRICT-HOST -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT
> -A RESTRICT-HOST -j LOG --log-prefix "xxx: " --log-level 7
> -A RESTRICT-HOST -j REJECT
> 
> and would use it like this:
> 
> -A FORWARD -i eth0 -o eth1 -s 192.168.1.1 -j RESTRICT-HOST
> -A FORWARD -i eth0 -o eth1 -s 192.168.11.11 -j RESTRICT-HOST
> -A FORWARD -i eth0 -o eth1 -s 192.168.111.111 -j RESTRICT-HOST
> 
> where eth0 is the LAN port and eth1 the WAN port of the router
> 
> is there a possibility where I can change these rules similar to these:
> 
> -A FORWARD -i eth0 -o eth1 -s 192.168.1.1 -j RESTRICT-HOST "game-pc: "
> -A FORWARD -i eth0 -o eth1 -s 192.168.11.11 -j RESTRICT-HOST "office-pc: "
> -A FORWARD -i eth0 -o eth1 -s 192.168.111.111 -j RESTRICT-HOST "tablet-pc: "
> 
> and a rule in the chain takes "game-pc: " instead of this "xxx: " 
> as given above?

That would be a cool feature, to basically set a variable in a rule 
and [possibly] subsequently use it in a LOG or other rule later.

AFAIK that feature does not exist.  (Yet? :) )
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
