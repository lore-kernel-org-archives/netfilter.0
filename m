From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: How to bind 2 WAN 1 LAN ?
Date: Fri, 25 Oct 2002 08:01:52 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200FAA488DE0D41194F10010B597610D445ECF@JUPITER>
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
To: '??' <raykey@dinyi.com.tw>
Cc: netfilter@lists.samba.org

I'm totally confused on your problem and maybe a drawing using TEXT
characters might be better. Sounds like your problem is NOT an IPtables
problem but more a routing issue.

You talk about parts which I have no idea what they are.. ie "preceding =
3
part go"
can you explain further without using words like =
"it","they","that"..etc..=20
=20
Thanks,
____________________________________________
George Vieira
Citadel Computer Systems Pty Ltd
Systems Manager
georgev@citadelcomputer.com.au
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

