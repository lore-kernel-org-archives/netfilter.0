From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Tue, 18 May 2004 16:53:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405181653.01776.Antony@Soft-Solutions.co.uk>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105> <200405181609.59945.Antony@Soft-Solutions.co.uk> <34253.200.44.170.105.1084894859.squirrel@200.44.170.105>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34253.200.44.170.105.1084894859.squirrel@200.44.170.105>
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

On Tuesday 18 May 2004 4:40 pm, alucard@kanux.com wrote:

> > Kernel IP routing table
> > Destination     Gateway         Genmask         Flags Metric Ref    Use
> > Iface
> > 192.168.0.0     *               255.255.255.0   U     0      0        0
> > eth1
> > 10.73.216.0     *               255.255.252.0   U     0      0        0
> > eth0
> > 169.254.0.0     *               255.255.0.0     U     0      0        0
> > eth0
> > 127.0.0.0       *               255.0.0.0       U     0      0        0
> > lo default         192.168.0.1     0.0.0.0         UG    0      0       
> > 0 eth1
> >
> > If the requests come in on eth1 but the replies go out on eth0 that would
> > be a
> > problem.
>
> well, in server2 -the one that that has to get the packets forwarded from
> server1- 192.168 network is in eth1, does anybody see anything wrong with
> it's route configuration? any suggestions??

Yes, but where are you doing the nmap testing from?   Surely not the machine 
with the nat rules on it??   (That won't work.)

Server 2 has to have a route to send the reply packets back to the machine 
doing the testing.   The packets will not have the source address of server1.

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


