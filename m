From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multihomed firewall and port forwarding nightmare ))):-(
Date: Wed, 14 Jan 2004 23:42:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401142342.16355.Antony@Soft-Solutions.co.uk>
References: <004301c3dae3$17238120$017ca8c0@lucens.caracal.ch> <200401142124.33954.Antony@Soft-Solutions.co.uk> <000d01c3daef$e5a2b370$017ca8c0@lucens.caracal.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c3daef$e5a2b370$017ca8c0@lucens.caracal.ch>
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

On Wednesday 14 January 2004 10:43 pm, Caracal - G. Hostettler wrote:

> I did, just to be sure, removed two NICs and assigned the three IPs to the
> remaining one.
> Changed rules accordingly (just changing the ifaces names).
>
> Got exactly the same behavior. So the problem do not seem to be a routing
> problem.

I'm not convinced (sorry).   Why do you have defaults routes pointing both 
internally and externally?   That seems wrong to me.

(From your original email...)

> Kernel IP routing table
> Destination Gateway Genmask Flags Metric Ref Use Iface
> 195.65.176.160 * 255.255.255.248 U 0 0 0 eth1
> 195.65.176.160 * 255.255.255.248 U 0 0 0 eth2
> 195.65.176.160 * 255.255.255.248 U 0 0 0 eth3
> localnet * 255.255.255.0 U 0 0 0 eth0
> default 195.65.176.161 0.0.0.0 UG 0 0 0 eth3
> default 195.65.176.161 0.0.0.0 UG 0 0 0 eth2
> default 195.65.176.161 0.0.0.0 UG 0 0 0 eth1
> default 192.168.124.253 0.0.0.0 UG 0 0 0 eth0

Antony.

-- 
Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.

 - Damian Conway, Perl God

                                                     Please reply to the list;
                                                           please don't CC me.


