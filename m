From: "lawrence Of Arabia" <zo2000@hotmail.com>
Subject: Re: Bridges, Firewalls and Gateways --- AND ROUTERS!
Date: Wed, 12 Feb 2003 01:57:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F177fTvOSQeSOzNCWbz000001fd@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, bridge@math.leidenuniv.nl, mlug@listserv.mlug.ca

Hey people

im sorry, this reply has taken more time than expected ... power outages ... 
rewrites and new replies ...  but ... here it is ...

i noticed that some of you didnt really understand the whole idea ... so ill 
give you a little more details ... either you didn't understand me or the 
other way around ... but ... id be better for all of us if i just made it 
clear and simple ...

first things first ...

i have PPPoE and currently run public services ... apache atm. i currently 
use a quite basic setup ... a plain hub on front of the dsl modem .. and all 
my computers have a PPPoE connection ... (i can have atleast 5 dynamic IPs, 
dont have 1 000 000 boxes)
i have a domain ... keep the public host up and update the ip at zoneedit if 
i have to. there's not much to it.

i was using smoothwall last week, but found it was unfit for my needs. the 
obliged use of port forwarding just turns me off. either because i cannot 
duplicate services ... or that i have to specify a port for a specific 
machine (ie x.x.x.x:1 is host1.domain.ca, x.x.x.x:2 is host2) and then have 
iptables look at the header and see what kind of request and then change the 
destination port ... there's not much to it either ... but ... it just gets 
more complicated in the long run if ever i add another apace box ... which i 
likely will ...
so, if you ask me ... the best option for this would be to have separate 
PPPoE connections for every box running public services and update their IPs 
at zoneedit when the time comes.

but what happens to security? i will be implementing iptables .. but ... 
since they all have independent connections i would either have to

A) implement firewalling rules on every machine ... and if ever a kid come 
strolling around my turf, i have to examine the logs of every machine ... 
and figure it out ... but that seems like a pretty big hassle ...

B) i could have box between the DSL modem and the public access boxes that 
bridges the connections. and with the bridge code patch for an IP level 
bridging (i was aware of it erroll, actually the box i planned to use is 
already setup with the patched kernel etc. *)
and since it it's at the IP level, well ... i could implement ip/ebtables 
there, centrally.

B has been done ... heres a link to it ... ripped of the 
bridge.sourceforge.net site
http://www.enc.com.au/csmall/docs/adslfirewall.html

so ... i consider the public access boxes problem to be theoretically 
solved.

but ... what happens with the part of my network i dont want people dont 
come running around in to? ... well ... NAT could be the awnser

but youll have to excuse me ... i may be a geek ... i may like antiques ... 
but i dont have that many ... i have 8 total ... but 3 being non working ... 
and one that i cant get a NIC for (i could scanvenge the recycled computer 
place deeper ... but ...) anyway ... i would rather use only one box as of 
central security/access ... (and spare on a 2 port hub!) ...

meaning that the box that bridges the PPPoE connections with 2 NICs would 
also have to use one of the nics of the bridge as the card for rp-pppoe ... 
and then NAT with the nic (3rd) of the private sector. Etienne (mlug) said 
that he wouldnt use a nic for 2 purposes ... i sure wouldnt too if i had 
many more options ... nonetheless they are welcome if you have any ....

well ... i hope this has awnsered some of your confusion ...


*i must mention that i have this currently setup ... i have the box with 3 
NICs, the patched kernel so bridging is done at level 3 ... rp-pppoe is 
installed and works ... up till i

"brctl addbr br0"

then it all goes down ...
i have also tried to connect my lappy with pppoe under the bridging box ... 
nadda ... but my ignorance must be the cause of the trouble :)

i would really like to hear about routing ... i am not very upclose and 
personnal with it .. i did notice that i must add routes to be able to reach 
a machine that is on the other side of the bridge ... namely ...

route add -net 192.168.0.0 dev br0 (or specify each subnet and interface)

but this is as much experience i have with the route command ...

could routing address my multiple PPPoE obtained IP problems?

concerning the networking of the DMZ and private network ... well ... that 
wont be the end of the world ... i could just do that with routing ... or at 
worse ... just have to go out to the net and back ... still transfer at 90k 
sec :P

as i said ... doing NAT isnt the problem ... bridging shouldnt be either ...

just having the 2 join on the same box ... thats where i get stuck ... 
hopefully you wont :P
yes chris, this is a home network, a quite hardcore one of it actually works 
out ... but still me casa chris, could i ask you what would be the use of a 
DMZ if you dont actually host services?

i wish to thank all of you for those replies ... and certainly welcome your 
comments or suggestions eagerly ...

lawrence


Etienne, i noticed you were a part of gulum ... i was given a sheet by a 
friend, maybe you know him ... he works in a department adjacent to yours 
... in math and computers ... gena hann ...

anyway ... do you guy have meetings? your site hasnt been updated in a while 
... :-/

sorry, this one is on the long side!



_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*   
http://join.msn.com/?page=features/junkmail


