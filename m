From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: /sbin/iptables -vnxL OUTPUT
Date: Tue, 2 Mar 2004 18:08:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040302170849.GD757@home.manuelm.org>
References: <12247.1078246023@www57.gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <12247.1078246023@www57.gmx.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Mario Ohnewald <mario.Ohnewald@gmx.de>  2. Mar 04:
> Hello!

Hi,

> I have got a iptables firewall running and i want to monitor my traffic,
> therefore i played arund with the following command:   /sbin/iptables -vnxL
> OUTPUT | grep "Chain OUTPUT"
> It worked fine, although, after a while it kept getting the result:
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
> I reloaded the filter rules, still the same.

Please don't wrap outputs.

> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
                    These-----^----------^
are only the counters of your default policy.  Your traffic is...

>     pkts      bytes target     prot opt in     out     source              destination
>        9     2051 ACCEPT     all  --  *      lo      0.0.0.0/0           0.0.0.0/0
>        0        0 ACCEPT     icmp --  *      *       0.0.0.0/0           0.0.0.0/0           icmp type 11
>        2      132 ACCEPT     icmp --  *      *       0.0.0.0/0           0.0.0.0/0           icmp type 3 code 3
>        0        0 DROP       icmp --  *      *       0.0.0.0/0           0.0.0.0/0           icmp type 3
>     9535  2685876 ACCEPT     all  --  *      *       0.0.0.0/0           0.0.0.0/0           state NEW,RELATED,ESTABLISHED
     ,^^^^--^^^^^^^
... here.          
>        0        0 LOG        all  --  *      *       0.0.0.0/0           0.0.0.0/0           LOG flags 6 level 4 prefix `SuSE-FW-OUTPUT-ERROR '
> 
> [snip stuff]
> 
> How come it wont count up the Accepted packaged and Bytes?

It would, but as you -j ACCEPT everything before the default policy it
can't.

HTH,
 regards, Frank.
-- 
Sigmentation fault

