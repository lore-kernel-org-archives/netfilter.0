From: "Jonathan Villa" <jonathan@innovativesource.net>
Subject: Re: Forward to DMZ addresses
Date: Sat, 20 Aug 2005 12:30:49 -0500 (CDT)
Message-ID: <56203.38.119.239.226.1124559049.squirrel@mail.innovativesource.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>	<4302D0F1.8030005@riverviewtech.net>	<19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>	<43042660.7090405@riverviewtech.net>	<39173.206.166.83.50.1124389983.squirrel@mail.innovativesource.net>	<4304E651.1050807@riverviewtech.net>	<60615.206.166.83.50.1124398805.squirrel@mail.innovativesource.net>
	<4305765F.8030600@riverviewtech.net>   
	<39244.206.166.83.50.1124477852.squirrel@mail.innovativesource.net> 
	<43065E41.7080407@riverviewtech.net>
Reply-To: jonathan@innovativesource.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43065E41.7080407@riverviewtech.net>
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
To: netfilter <netfilter@lists.netfilter.org>

> Jonathan Villa wrote:
>> First, grrr.... I just wrote a nice lengthy reply but my webmail
session
>> timed out and I lost it...let's see if I can remember everything I
wrote
>
> Been there done that.
>
>> Actually, it is the case :(.  I _do_want_ a firewalling router to
handle
>> my LAN and DMZ networks.  I want it to protect both LAN and DMZ so tha=
t I
>> can manage rules from one location rather than several of the boxen.
>
> *nod*  This makes sense.
>
>> no offense taken, but I hope I continue to make sense.
>
> As don't we all?
>
>> Anyway, back to the point, I started to realize that perhaps my issue
is
>> not with how I wrote my tables/rules, but with routing (you're mention=
 of
>> OSI Layer 2 perhaps).  Last night it made more sense to me when I real=
ized
>> that nothing was being logged on the interface connected to the
router/VLAN switch when attempting to connect to 196 (which is
connected
>> to a switch "behind" the firewall).  I realized, hey, this seems to be
a
>> routing issue...I now see I need to find a way to have 194 (or the
firewall's $WAN_ETH) route traffic for the rest of the subnet (except
for
>> 193 which is the router itself from the inside).
>
> If you try to put the xx.xx.xx.192/28 network behind your firewalling
router except for the one of the IPs you are breaking routing and
needing
> to bridging again.

This is what I've started to assume.   hmmm.... (scratching my head)

>> Now this is a wild guess, but I'm starting to think that I need to cha=
nge
>> the router's routing rules.  But then again, I don't want to be someon=
e
who remodels a bedroom just to add a new light switch.
>
> I don't think that completely redoing your routing table will gain you
much.

Thanks.

>> I think I want my firewall to be the one to route for what is protecte=
d by
>> it, namely the LAN and DMZ because I want everything to be checked by =
the
>> rules of the firewall (which I see can be done using bridging now, but
still not sure if that's what I want).  I'm starting to think that I
have
>> just opened up a can of gusanos
>
> *nod*  This makes more sense but poses a different problem.  To have th=
e
xx.xx.xx.192/28 network behind your firewalling router you will need an
IP
> network connecting your (edge) router to your firewalling router.  You
could use any private class IP for this little network if you wanted to.

> But it is considered bad form use any private IPs any where at all on
the
> internet even if it is to connect two routers via a cross over cable.
>
>> With the exception of the firewall's internal address, 193, I would
like
>> to have the xx.xx.xx.192/28 subnet reachable behind my firewall only
>
> *nod*
>
>> not the DMZ but the address of my firewall.  I have this part working
as
>> noted by http://www.whatismyaddress.com.  I have a rule which does SNA=
Ting
>> on anything coming from my LAN interface and on the 192.168.0/28 netwo=
rk.
>
> *nod*  I was meaning to say that your LAN traffic would appear to the
world as having been SNATed to an IP address in your xx.xx.xx.192/28
network.
>
>> thanks, in my complete script I had something similar, but did not inc=
lude
>> 127.0.0.0 or 169.0.0.0.  Thanks for the link to the RFC
>
> You are welcome.  No problem.
>
>> Ok, hopefully I'm a little more clear now, i.e. I want a firewalling
router for the subnet xx.xx.xx.192/28.  Initially, my plan was to do
this:
>> 1. Connect eth1 to the Router directly
>> 2. eth0 would be the LAN and network 192.168.0/24
>> 3. eth2 would ethe DMZ and network 10.x.x.x or 192.168.1/24
>> 4. DNAT DMZ IP to the DMZ network like so
>> iptables -t nat -A PREROUTING -i $WAN_ETH -d $EXT_STAGING_HTTP_IP -j D=
NAT
>> --to-routing $INT_STAGING_HTTP_IP
>> iptables -t filter -A FORWARD etc..etc..
>
> IMHO this will work but it is more of a nasty hack.  This also leads to
the possibility of things breaking down the road.  Consider running a
service on one of the DMZ hosts that is not NAT friendly.  What will you
do in that case?  If you can avoid this I think it would be very wise to
do so.

I think I'll avoid. Thanks for the heads up.

>> But then I thought to myself, "Why don't I just assign the actual IP t=
o
the DMZ server?" and thus my journey began.
>
> *nod*  I often have such conversations with my self.  I love it when I
win
> them and HATE it when I loose.
>
>> I'm now at the point where I really think it's a routing issue... agre=
e of
>> disagree?  My other option is to give up and say, also in a loud sinis=
ter
>> voice, "Rat's foiled again", but then realized and said in a loud sini=
ster
>> voice : Never!!!
>
> Yes I agree hole heartedly.  Don't give up.
>
>> Or... do I look into bridging.  I have come across this as a possible
scenario before, but thought that perhaps it's not "exactly" what I'm
looking for.
>
> What "exactly" are you looking for?  I don't see a solution with out
doing
> some REALLY funky stuff in such as playing with IPs and / or adding a
4th
> NIC to the box so that the new interface can be connected to the DMZ
network and give it an IP to use as the router for your LAN.  Then you
will need to do some really funky routing tables such as making the
system
> act like two completely independent routers that know nothing about the
other unless your traffic comes in or goes a specific pair of
interfaces.
>
>> Impressed and thankful.  Also, I think this will make for good reading
when someone searches the archives.
>
> Thank you very much.  I have seen some very interesting questions come
across this mail list in the past most of which did not really have any
good documentation (that I'm aware of) on ways to solve them.  I'm
tempted
> to write some How To type documentation and submit it to someone else t=
o
host, possibly / probably the LARTC project (www.lartc.org).
>

I guess "exactly" =3D a setup similar to what I've seen commercial firewa=
ll
products do, e.g. Sonicwall or Watchguard Firefox.  They have 3 NICS on
the back, 1. connected to the T1 router, 2. connected to the LAN switch,
3. connected to the DMZ switch.  and rules are managed from the Sonicwall
box itself... who knows what they're doing in the background... when we
setup DMZ boxen, we connect them to the DMZ switch, assign them static
addresses from our IP pool, create a rule allowing access, and off we go.=
=20
When shopping around for firewall products, I've also noticed that some
specs say 3 NICS for DMZ/WAN/LAN connections sometimes more NICS (don't
know why).  I'm trying to mimic this...  perhaps they have some heavy
routing rules in the back, something that would I need to learn...


It's funny that you've just described exactly what I want to do...

>the new interface can be connected to the DMZ network

I currently have 3 nics, one connected to the DMZ switch, one connected t=
o
the LAN switch, and the third to the T1 router (via the VLAN switch which
I plan to remove in September)

>act like two completely independent routers that
>know nothing about the other unless your traffic comes in or goes a
>specific pair of interfaces.

Yes!

all in all, all the information you've provided to me now makes sense...
and it gives me a very good starting point for more Googling...





