From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Apache virtualhost not working behind firewall.
Date: Fri, 20 Dec 2002 00:33:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212200033.33488.netfilter@newkirk.us>
References: <3E0274C5.7080000@CyberWolf.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E0274C5.7080000@CyberWolf.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Chip Upsal <Chip@CyberWolf.com>, netfilter@lists.netfilter.org

On Thursday 19 December 2002 08:39 pm, Chip Upsal wrote:
> I have a windows 2000 server running apache 2.0.43 with virtual hosts
> behind an iptables firewall doing NAT.
> I am running iptables v1.2.5 on a redhat 7.3 server.

> # PWWEB
> #
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $PWWEB_IP
> --dport 80 \
> -j DNAT --to-destination $DMZ_PWWEB_IP
>
> $IPTABLES -t nat -A PREROUTING -p ICMP -i $INET_IFACE -d $PWWEB_IP \
> -j DNAT --to-destination $DMZ_PWWEB_IP

> The problem....
> When the server is connected directly to the internet all works well.
> However, when it is behind the firewall the virtualhost are not
> working (you can only access the default web site.
>
> Furthermore i am getting the following errors when starting iptables;
>
> [root@iptables init.d]# ./iptables restart
> Flushing all current rules and user defined chains:        [  OK  ]
> Clearing all current rules and user defined chains:        [  OK  ]
> Applying iptables firewall rules:                          [  OK  ]
> iptables v1.2.5: Unknown arg `--to-destination'
> Try `iptables -h' or 'iptables --help' for more information.

My money is on a failure to load the nat module. Try "insmod iptable_nat"
from a root console, then restart.  If that's it, just put it somewhere=20
at the top of your script.

j


