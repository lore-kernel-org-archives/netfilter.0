From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: I have to become a bandwidth Nazi , Netfilter useable.
Date: Sat, 1 Mar 2003 10:19:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303011019.00158.netfilter@newkirk.us>
References: <000201c2dffa$8ad18480$0c05a8c0@Sherby>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000201c2dffa$8ad18480$0c05a8c0@Sherby>
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
To: George Peverill <gpeverill@ns.sympatico.ca>, netfilter@lists.netfilter.org

On Saturday 01 March 2003 08:57 am, George Peverill wrote:
> I am running a small network (about 10-12 machines) with a linux
> gateway machine providing http/ssh/vpn(pptp)/firewalling/NAT
> Recently we've had someone that loves to hog bandwidth a tad (ie:
> downloading movies at 150-200k/s) while we slave away
> with the remaining 50k/s or so of bandwidth.  I was wondering and I
> think its possible) if I could remedy this without resorting
> to compilicated QoS / CBQ crap.  Basically is it possible to write a
> rule that'd say drop 25% or maybe 50% of all packets going to his
> machine from the gateway? (nasty yes agreed)
>
> -internal interface is eth0 (192.168.0.x)
> -external interface is eth1
>
> Is it possible to do it based on his IP (which is known lets say
> 192.168.0.55 for example sake) or his MAC address which is known.

Match in FORWARD chain (BEFORE any ACCEPT rules) with "-d 192.168.0.55",=20
and also possibly with "-p tcp --dport <portnumber>" with the port that=20
the traffic goes to, or "--sport" with the port the traffic comes from. =20
(this depends on the p2p app he's using)  You can use the limit match to=20
specify a fixed number of packets in a specified period of time, but not=20
a percentage.  You'd need to figure out how many packets per second to=20
set as a maximum.

You may find that DROP doesn't help much, though, as it's likely his p2p=20
client will just keep requesting data, and the source will just keep=20
pumping it through as fast as it's able to.  You might be better served=20
by Arnt Karlsen's favored approach - the TARPIT target from=20
patch-o-matic, or my favorite - whack him on the head with a keyboard.

It also might help to use the similar dport/sport+sourceIP+limit approach=
=20
to restrict how many requests his p2p client can send out in a given=20
timeframe, as well as upload traffic.  (many p2p clients force, or=20
strongly encourage [IE by limiting download to 4x upload] allowing=20
uploads from the client)

> Any help would be greatly appreciated.  I dunno how this can be done
> but im sure someone might be able to figure it out , would have to be
> done in the PREROUTING where SNAT is done wouldnt it ?

No, this is filtering and should be done in the filter table, in this=20
case the FORWARD chain.

j


