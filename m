From: andre.correa@pobox.com
Subject: Re[2]: Too many ARP entries and Re: sendto: No buffer space available
Date: Tue, 3 Dec 2002 12:27:24 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <875890239.20021203122724@pobox.com>
References: <571705138.20021202111645@pobox.com>
 <14127620470.20021202182836@pobox.com>
 <1038920934.8888.4.camel@elendil.intranet.cartel-securite.net>
Reply-To: Andre Docena Correa <andre.docena@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038920934.8888.4.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org


Hi again, looking at TCPDump I see this wierd traffic:

root@linuxbox:~# tcpdump -i eth1 | grep arp
tcpdump: listening on eth1
Dec  3 11:16:52 linuxbox kernel: device eth1 entered promiscuous mode
11:17:03.059629 arp who-has 64.12.163.212 tell linuxbox
11:17:03.060569 arp reply 64.12.163.212 is-at 0:2:b9:1d:db:41
11:17:07.669629 arp who-has 172.18.1.218 tell linuxbox
11:17:07.670610 arp reply 172.18.1.218 is-at 0:2:b9:1d:db:41
11:17:07.839630 arp who-has 64.12.27.135 tell linuxbox
11:17:07.840544 arp reply 64.12.27.135 is-at 0:2:b9:1d:db:41
11:17:07.850840 arp who-has baym-cs17.msgr.hotmail.com tell linuxbox
11:17:07.852219 arp reply baym-cs17.msgr.hotmail.com is-at 0:2:b9:1d:db:41
11:17:09.888162 arp who-has 207.46.106.80 tell linuxbox
11:17:09.889078 arp reply 207.46.106.80 is-at 0:2:b9:1d:db:41
11:17:10.389189 arp who-has 204.152.184.64 tell linuxbox
11:17:10.390134 arp reply 204.152.184.64 is-at 0:2:b9:1d:db:41
11:17:10.640043 arp who-has 200.225.157.104 tell linuxbox
11:17:10.640967 arp reply 200.225.157.104 is-at 0:2:b9:1d:db:41
11:17:10.689240 arp who-has 200.225.157.165 tell linuxbox
11:17:10.690768 arp reply 200.225.157.165 is-at 0:2:b9:1d:db:41
11:17:10.893170 arp who-has 200.225.157.163 tell linuxbox
11:17:10.894088 arp reply 200.225.157.163 is-at 0:2:b9:1d:db:41
11:17:10.980746 arp who-has 200.225.157.167 tell linuxbox
11:17:10.981714 arp reply 200.225.157.167 is-at 0:2:b9:1d:db:41
11:17:11.504255 arp who-has a.gtld-servers.net tell linuxbox
11:17:11.505926 arp reply a.gtld-servers.net is-at 0:2:b9:1d:db:41

2183 packets received by filter
0 packets dropped by kernel

We   see   my   linux  box  asking  for MAC addresses of hosts outside
its "local" network and my gateway, a Cisco 2621 answering those
broadcasts with its own MAC address.

For  what  I know, both are doing wrong. My box is not supposed to ask
for those MACs and the Cisco is not supposed to answer.

Does anybody have seen these before or have any ideas what would cause
it?

tks in advance.

Andre



On 03/12/02, Cedric Blancher wrote:
CB> Le lun 02/12/2002 =E0 21:28, andre.correa@pobox.com a =E9crit :
>> But  there  is  still a question for me. Looking at my arp table, I
>> see that there are =3D~ 150 entries, seconds passing and more entries
>> coming, 20 seconds after I can have =3D~1100, it goes on until it reachs
>> =3D~2200  entries,  then it goes back to the =3D~100 and starts over aga=
in.

CB> Wierd...

>> I  have  less  then  50  NAT users. Is it normal to have some many ARP
>> entries with this variation? Looking the ARP table I see my "Internet"
>> interface with lots of entries, with internet host IP addresses and my
>> gateway's NIC MAC address.
>> Isn't ARP supposed to keep entries just to local network systems?

CB> Yes it is.
CB> ARP is supposed to keep track of IP/MAC associations for network
CB> directly routed to interface, i.e. directly connected, aka local LANs.

>> Is it all normal? And if so, how big can gc_threash[1,2,3] be?

CB> It is not normal. You should monitor ARP traffic on your network using
CB> arpwatch (see Freshmeat, available as .deb, .rpm too) to see if someone
CB> would be playing ARP cache poisoning (see http://www.arp-sk.org/).


