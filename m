From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DROP All MACs
Date: Mon, 17 Nov 2003 15:04:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171504.hAHF4nj22179@agate.rockstone.co.uk>
References: <8d797268.72688d79@dialogsl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <8d797268.72688d79@dialogsl.net>
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

On Monday 17 November 2003 2:55 pm, curlybraces@dialogsl.net wrote:

> hi all
>
> can some body tell me how to block all mac addresses in the same network
> via iptables ...............!!!!!

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -F INPUT
iptables -F FORWARD

will block all mac addresses :)

> but don't ask why ...ok

Okay, I guess the above is not the solution you were looking for, however 
without further explanation of exactly what you mean by "block all mac 
addresses in the same network", I can only suggest the following:

iptables -I FORWARD -m mac --mac-source aa:bb:cc:dd:ee:ff -j DROP

Replace FORWARD with INPUT if you want to block packets coming into the 
netfilter machine rather than those being routed through it; repeat this rule 
for each mac address you want to block.   If you really do want to block 
*all* mac addresses, then simply DROP all packets - no need to look at the 
mac address if you want to block them all.

Antony.

-- 

Nostaliga is not what it used to be.

                                                     Please reply to the list;
                                                           please don't CC me.

