From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcp packets on 25 port FORWARDING
Date: Fri, 12 Mar 2004 09:57:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403120957.16154.Antony@Soft-Solutions.co.uk>
References: <E1B1jEu-0002TS-U9@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1B1jEu-0002TS-U9@vishnu.netfilter.org>
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
To: netfilter@lists.netfilter.org

On Friday 12 March 2004 9:46 am, Stanislav Puffler DiS. wrote:

> Hi there,
>
> I need to forward all tcp packets with port 25 (SMTP) from Internet to
> machine in my network. My settings (eth0 = internet IP, eth1 =
> 192.168.200.1 - dmz IP connected to another machine with Postfix, eth2 =
> 192.168.0.1 - gateway - LAN). Have opened port 25 and setup rule :
>
> iptables -t nat -A PREROUTING -p tcp -dport 25 - i eth0 -j DNAT -to
> 192.168.200.2:85

That should be "--dport", not "-dport", and why are you changing the 
destination port number to 85?   Is Postfix listening on port 25?

> iptables -A FORWARD -i eth0 -p tcp -d 192:168.200.2 -dport 25 -m state
> -state NEW,ESTABLISHED,RELATED -j ACCEPT

That should also read "--dport", not "-dport", also "--state", not "-state".

If you have typed out your rules in this email and made some mistakes, then 
please *cut and paste* your ruleset so we really know what is running.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


