From: Ludvig Sandh <givdul11@hotmail.se>
Subject: Packets lost in netfilter & Altering outgoing packet's mac address
Date: Tue, 16 Aug 2022 10:50:06 +0000
Message-ID: <DB4P191MB2213EA897B746F3E2DA9FA54BD689@DB4P191MB2213.EURP191.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: sv-SE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi :)

I have a couple of questions regarding nftables rules in combination with a=
 bridge. The questions might be simple but I include the surrounding detail=
s to give background. This is my setup:=20

Internet   <----->   Gateway router   <----->   (eth0) - linux device w/ br=
idge - (eth1)   <----->   LAN router   <----->    LAN hosts

Addresses:
Gateway router: 192.168.10.1/24, e0:b9:e5:da:7b:1c
eth0: ip arbitrary but let's assume 192.168.10.203/24, e4:5f:01:a9:57:25
eth1: ip arbitrary, 7c:c2:c6:35:82:08
Lan router: 192.168.10.132/24, 54:af:97:87:eb:b9
br0 (bridge): 0.0.0.0, 7c:c2:c6:35:82:08
I will come back to why I think ip can be arbitrary later.

There are 3 things I want for my setup.
1)=09
I am trying to setup a bridge that blindly forwards packets between two int=
erfaces eth0 and eth1 using brctl. This works. I set up my bridge using:
ifconfig eth0 promisc up
ifconfig eth1 promisc up
brctl addbr br0
brctl stp br0 off
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig br0 0.0.0.0
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
=20
2)	=20
I want the Linux device to be able to communicate with some specific hosts =
in the internet while running the bridge. As the bridge forwards all ARP br=
oadcast packets, the arp table won't be filled automatically. I manually ha=
ve to enter the arp entry for the gateway. Then communicating to internet w=
orks too.

arp -s 192.168.10.1 e0:b9:e5:da:7b:1c -i eth0
arp -s 192.168.10.203 54:af:97:87:eb:b9 -i eth1

3)	=20
I want the device to be transparent to the rest of the network.

I have a plan for the third step that theoretically works, but it is still =
giving me trouble. My idea is that when the linux device will send out a pa=
cket (some sort of request) of its own to the internet, I want it to rewrit=
e the packet=92s source adress to the LAN router=92s adress. Now it looks l=
ike the packet comes from the LAN router. When the reply comes back from in=
ternet, it will be forwarded by the gateway router to the LAN router over t=
he bridge. I want my device to recognise this response packet belonging to =
itself and =92steal=92 it by modifying the packet=92s destination adress to=
 the device itself as it=92s received, thus internally redirecting the pack=
et to any applications waiting for it instead of forwarding it over the bri=
dge. This way, my device will never be seen by the rest of the
  network. I can then pick an arbitrary IP adress for my device's ethernet =
interfaces, and my hope is that this (along with manual ARP table setup) wi=
ll trick the device into functioning normally, thinking it=92s fully visibl=
e to the rest of the subnet while it's not.=20

Let=92s say I want my device to ping google.com. It pings google=92s IP adr=
ess, changes source adress on the way out. When the reply comes back, we de=
tect that it has google=92s IP adress as source, meaning this is the respon=
se we are waiting for, then rewrite the packet=92s destination to our own, =
and hopefully the ping application will pick the response up. Ignore the fa=
ct that the LAN router or anything behind it cannot reach google.com anymor=
e since the device will =92steal=92 all those packets. Following, I will as=
sume communicating with google.com is the goal. google.com ip address is as=
sumed to be 216.58.207.206.

Basically I want a way to modify source/destination adresses on packets usi=
ng nftables to achieve this. Routing decisions in the bridge layer (link la=
yer) is based on link layer MAC adresses. Meaning if I want to redirect pac=
kets from going over the bridge to instead leave the bridge, I'm thinking I=
 need to change the mac adress for packets that I want to route off the bri=
dge to the network layer. So it=92s not always enough to just modify the IP=
 adress.

For changing the source address of outgoing packets I=92ve tried explicitly=
 setting it with=20
=92nft add rule ip filter postrouting ip saddr set 192.168.10.132 ether sad=
dr set 54:af:97:87:eb:b9=92
Capturing the packet in wireshark shows the ip address has been altered, bu=
t not the mac adress. The mac adress still is eth0 (..57:25). I though abou=
t using =92snat=92 and =92dnat=92 to alter sources/destinations. This howev=
er would not suffice because firstly, 'snat' does not modify mac adresses o=
n packets it seems like and secondly, nat:ing is only provided above the br=
idge layer (according to the table 'bridge family' in https://wiki.nftables=
.org/wiki-nftables/index.php/Netfilter_hooks), meaning it cannot be used on=
 incoming packets that will traverse the bridge. Perhaps it's not possible =
to alter link layer addresses on network layer filters. If the outgoing pac=
kets from the network layer eventually reach the bridge layer, then we coul=
d perhaps modify mac addresses there instead. But looking=20
 at the netfilter packet flow diagram (https://commons.wikimedia.org/wiki/F=
ile:Netfilter-packet-flow.svg) we see that the outgoing packet does not rea=
ch the bridge layer. This was confirmed by me tracing outgoing packets. Thi=
s raises my first question: Is it even possible to change the mac adress of=
 an outgoing packet with nftables? If so, how?

For changing the destination address of incoming packets I=92ve tried simil=
ar things:
'nft add rule bridge filter prerouting ip daddr set 192.168.10.203 ether da=
ddr set 7c:c2:c6:35:82:08'
When tracing incoming ping reply packets from google I now see that both de=
stination addresses have changed (so far it works!). Packets now get routed=
 to the input filter chain in the bridge layer, exactly as I expect. What=
=92s interesting though is that the packet is nowhere to be found after lea=
ving the input chain in the bridge layer. It does not show up at any of the=
 ip layer chains (for example the raw prerouting chain). The packet is comp=
letely lost it seems like. Looking at the same packet flow diagram (https:/=
/commons.wikimedia.org/wiki/File:Netfilter-packet-flow.svg) we see that aft=
er leaving the bridge layer input filter chain, the packet should get route=
d to one of three possible chains. I've checked all these chains and they a=
ll state that 0 packets have gone through them. This l
 eads to my next question. The reason I'm using br0 mac address (..82:08) a=
s new destination is because this is how it was when communicating worked, =
before trying step 3. For the record I have also tried setting eth0 mac add=
ress as new destination but same problem. Is there any way a packet can get=
 dropped in a routing decision in netfilter, or why else is my packet just =
lost after being accepted in the bridge layer input filter?

The following displays how the packet reaches the bridge input filter but n=
ot the ip input or prerouting filters. Nftables ruleset (with my own commen=
ts):

table bridge filter {
	chain prerouting { # Incoming packet, alter its adresses
		type filter hook prerouting priority filter; policy drop;
		ip saddr 216.58.207.206 counter packets 1 bytes 168 # Displays that 1 pac=
ket comes from google.com
		ip saddr 216.58.207.206 ip daddr set 192.168.10.203 ether daddr set 7c:c2=
:c6:35:82:08 accept # Modify its destination to self
	}
	chain input {
		type filter hook input priority filter; policy accept;
		ip saddr 216.58.207.206 ip daddr 192.168.10.203 ether daddr 7c:c2:c6:35:8=
2:08 counter packets 1 bytes 168
		# Shows that the google packet reached the input chain with altered addre=
sses!
	}
}
table ip filter {
	chain prerouting {
		type filter hook prerouting priority filter; policy accept;
		counter packets 0 bytes 0
	}
	chain input {
		type filter hook input priority filter; policy accept;
		counter packets 0 bytes 0
	}
	# Above shows that the google response packet neither reached the ip prero=
uting nor input chain at all!

	chain postrouting { # For altering the packet's source address on the way =
out
		type filter hook postrouting priority filter; policy accept;
		ip saddr set 192.168.10.132 ether saddr set 54:af:97:87:eb:b9
		# As said before, ip address will be changed here but not mac address for=
 some reason (perhaps just not provided in ip layer)
	}
}

I've been having problems with this for a week soon and I cannot figure it =
out.

Some hints I=92ve found when searching around is:
-	"The 'filter' table is used for packet filtering, it should never alter p=
ackets." (https://unix.stackexchange.com/questions/122847/does-an-in-kernel=
-firewall-sit-between-the-network-access-layer-and-internet-lay). This soun=
ds reasonable but considering the only chain type of the bridge family is t=
he "filter" type, then this would mean changing mac addresses with nftables=
 on bridge layer is not possible.=20
-	The sample code under =92Stateless NAT=92 in the following link shows rou=
ghly the idea of explicitly setting header values as I tried. They state "Y=
ou have to disable Connection tracking for modified packets" by specifying =
=92notrack=92 flag at the end of a rule. I tried this as well, making sure =
the rule has a high priority as recommended in the documentation. No luck, =
not even any change in behaviour. (https://wiki.nftables.org/wiki-nftables/=
index.php/Performing_Network_Address_Translation_(NAT)#Stateful_NAT)
-	I'm seeing that my br0 bridge automatically receives the same mac address=
 as eth1. At first I thought this might be a problem but at the same time c=
ommunicating works fine when the bridge is running (pinging google.com work=
s fine), just not when the nftables rules trying to alter header values (st=
ep 3). So there shouldn't be a problem with routing itself.
-	Perhaps it is possible to redirect an incoming packet from the bridge lay=
er to the ip layer in another way than my attempt of modifying mac address.=
 I have not found any other way though.

To reiterate my questions:
1) Is it possible to change the mac adress of an outgoing packet with nftab=
les? If so, how?
2) Is there any way a packet can get dropped in a routing decision in netfi=
lter, or why else is my packet just lost after going through the bridge lay=
er input filter?

For extra clarity: Along the way I've been looking at these flow charts and=
 information when explaining where packets get lost (both already reference=
d above):
https://commons.wikimedia.org/wiki/File:Netfilter-packet-flow.svg
https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks

Thanks a lot for any guidance!
