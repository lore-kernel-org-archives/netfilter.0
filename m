From: Lane Powers <lpowers@mis.net>
Subject: Re: kernel 2.6 IPsec and netfilter
Date: Mon, 29 Mar 2004 07:36:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40681861.1030704@mis.net>
References: <4068040C.AA93F507@india.hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4068040C.AA93F507@india.hp.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Well, it might not be perfect, but here is what I do, and it 'works for me'

In my ipsec.conf I use the updown script functionality of pluto, i.e. in 
my conn default I put
         leftupdown=/usr/local/bin/updown.sh


and then that script is responsible for setting netfilter rules for that 
ip while the tunnel is up, i.e.

#!/bin/bash
if [ "$PLUTO_VERB" == "up-client" ] || [ "$PLUTO_VERB" == "up-host" ] ; then
         iptables -N $PLUTO_CONNECTION;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 22 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 23 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 80 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 443 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 3389 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p tcp --dport 5900 -j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p icmp --icmp-type echo-reply 
-j ACCEPT;
         iptables -A  $PLUTO_CONNECTION -p icmp --icmp-type echo-request 
-j ACCEPT;
         iptables -A $PLUTO_CONNECTION -j ACCEPT
         iptables -I INPUT -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         iptables -I FORWARD -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         exit 0;
elif [ "$PLUTO_VERB" == "down-client" ] || [ "$PLUTO_VERB" == 
"down-host" ] ; then
         iptables -D INPUT -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         iptables -D FORWARD -s $PLUTO_PEER -j $PLUTO_CONNECTION;
         iptables -F $PLUTO_CONNECTION;
         iptables -X $PLUTO_CONNECTION;
         exit 0;
fi
         exit 0;

obviously if you needed different rules per tunnel you could just move 
the updown into the individual conn and define a seperate script per 
connection with different rules.  all of the $PLUTO_... stuff is set in 
the ENV while the connection is being built... obviously for me, my 
FORWARD chain is a default drop, so I am just inserting at the top and 
allowing what I want for the duration of the tunnel.

Hope that helps.

Lane

Devaraj Das wrote:
> Hi,
> I wanted to know whether there is a working solution for the issue that
> was discussed sometime back:
> http://www.spinics.net/lists/netfilter/msg22099.html
> In short is there any solution to enable blocking selective ports in a
> machine running Linux 2.6.0 + in-kernel ipsec.
> I would be very helpful if I can get a working solution or some
> information on a possible solution.
> Thanks,
> Devaraj.
> 
> 

