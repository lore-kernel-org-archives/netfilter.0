From: Jason Opperisano <opie@817west.com>
Subject: Re: Dynamic DNS
Date: Wed, 9 Mar 2005 14:34:11 -0500
Message-ID: <20050309193411.GA26880@bender.817west.com>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<103901c524bb$0eedffd0$b000a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <103901c524bb$0eedffd0$b000a8c0@cybergeneration.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Mar 09, 2005 at 10:17:07AM -0500, Maxime Ducharme wrote:
> 
> Hello Sebastian
> 
> Suggestion :
> 
> 1. create script for this :
> 
> 
> check_ssh_dyndns.sh
> ##############################
> # delete rule (if it existed)
> iptables -t filter -D CHECK_SSH_DYNDNS
> 
> # re-create rule
> iptables -t filter -N CHECK_SSH_DYNDNS
> 
> # read the DynDNS ip
> theHost=`host a.dyndns.org |awk '{print $4}'`
> 
> # Add it to allowed SSH
> iptables -t filter -A CHECK_SSH_DYNDNS -p tcp --dport 22 -s $theHost
> ##############################
> 
> 
> In your firewall script call this script
> ./check_ssh_dyndns.sh
> 
> 
> 
> In crontab, run this script every 5 mins (default
> DynDNS TTL). It will keep your dyndns host in the
> rules up to date.
> 
> *** note that this script may need adujstement, i didnt
> tested it, I'm sending an idea

the theory is there--the implementation is missing some fine points:

in the normal iptables script file:

  iptables -N DynSSH
  iptables -A INPUT -i $EXT_IF -p tcp --syn --dport 22 -j DynSSH

none if the above needs to ever change.

now--in the cronjob:

  {logic to detect a change in the src host's IP address}
  iptables -F DynSSH
  iptables -A DynSSH -s $DYNHOST -j ACCEPT

HTH...

-j

--
"My cat's breath smells like cat food."
        --The Simpsons

