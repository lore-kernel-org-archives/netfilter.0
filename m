From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: How to bind 2 WAN 1 LAN ?
Date: Wed, 4 Dec 2002 08:04:11 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200FAA488DE0D41194F10010B597610D4460B9__44761.2503696748$1039034305@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: "'raykey@dinyi.com.tw'" <raykey@dinyi.com.tw>, netfilter-announce@lists.netfilter.org
Cc: netfilter@lists.samba.org

You need a combination of iptables and iproute2 to do what you want =
because
routing is based on it's DESTINATION address and you need to route on =
your
SOURCE address so it uses a different route depending on which source =
IP is
in the packet..

Refer to this page which is sort of what you want BUT not exact. It'll =
give
you some ideas...

http://www.samag.com/documents/s=3D1824/sam0201h/

=20
=20
Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au=20
Citadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644
HelpDesk: +61 2 9955 2698 =20
http://www.citadelcomputer.com.au
=20


-----Original Message-----
From: raykey@dinyi.com.tw [mailto:raykey@dinyi.com.tw]
Sent: Thursday, 24 October 2002 3:25 PM
To: netfilter-announce@lists.netfilter.org
Cc: netfilter@lists.samba.org
Subject: How to bind 2 WAN 1 LAN ?


Dear all...

I'm a Chinese and I don't think that my English is well .
But I have a big problem in use IPTABLES .
I've looked all the documents and FAQs , but I can't find a solution to
solve my problem .
At last I decide to ask you in my poor English ...^^||

I have a Linux server (Turbo Linux7.0 in kernel 2.4.9-3) to be my NAT =
server
.
I have make it running iptables-1.2.2-6 .
It have 3 NIC(Network interface Card) eth0.eth1.eth2 .
I have 1 LAN and 2 WAN interface they are 192.168.1.0/255.255.255.0 and =
2
ADSL (one of my ADSL is pppoe another one is static IP) .
Now I want to bind thy all in my NAT server .
I rty to cut my LAN to 4 part are 192.168.1.0/255.255.255.192 &
192.168.1.64/255.255.255.192 & 192.168.1.128/255.255.255.192 &
192.168.1.192/255.255.255.192 .

That I wish the preceding 3 part go out and in with the pppoe ADSL =
(ppp0)
and the final part go through with static IP(because they are my =
servers) .

My biggest problem is in Linux I can't set the default gateway =
otherwise the
ppp0 will not work .
But if ppp0 is working I can't find who to make my final part
(192.168.1.192/26) go through the eth0 out or aome in  ...-.-"

I have do my best to explain my problem .
If you can't understand my question maybe can find somebody who know my
English or can talk in Chinese will better .

Sincerely yours
thanks a lot...^^

------------------------------
=B9=A9=A9=F6=A6L=A8=EA=B8=EA=B0T=AB=C7
Dinyi Printing CO. LTD
RaykeySu
raykey@dinyi.com.tw
------------------------------

