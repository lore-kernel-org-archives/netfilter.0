From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forward again
Date: Thu, 4 Dec 2003 12:31:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312041231.03988.Antony@Soft-Solutions.co.uk>
References: <000f01c3ba61$3418f230$7cd36c50@anonymous>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c3ba61$3418f230$7cd36c50@anonymous>
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

On Thursday 04 December 2003 12:21 pm, sc2@gmx.at wrote:

> hello
> when i want forward ip > to > ip. (.51 > 58)

> iptables -A PREROUTING -p tcp -d xx.xxx.xx.51 --dport 27021 -j DNAT --to
> xx.xxx.xx.58:27021

You cannot "forward" packets from one machine to another when they live on the 
same subnet (I assume that both xx.xxx.xx. in the above rule are the same), 
because the packets will not go through the netfilter machine.   They simply 
go direct from client to server and back again across the wire.

Netfilter can only influence packets which are being *routed through* the box 
it is running on (or which start or stop on the box itself) - ie from one 
subnet to another.

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


