From: murphy@murphyslantech.de
Subject: Re: How to bind 2 WAN 1 LAN ?
Date: Thu, 24 Oct 2002 21:15:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DB8630C.29807.8A31B4@localhost>
References: <000b01c27b1e$36efdd80$5101a8c0@dinyi.com.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <000b01c27b1e$36efdd80$5101a8c0@dinyi.com.tw>
Content-description: Mail message body
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
To: =?ISO-8859-1?Q?=A7N=A4=E9?= <raykey@dinyi.com.tw>
Cc: netfilter@lists.samba.org

> Dear all...
> 
> I'm a Chinese and I don't think that my English is well .
> But I have a big problem in use IPTABLES .
> I've looked all the documents and FAQs , but I can't find a solution to
> solve my problem .
> At last I decide to ask you in my poor English ...^^||
> 
> I have a Linux server (Turbo Linux7.0 in kernel 2.4.9-3) to be my NAT se=
rver
> .
> I have make it running iptables-1.2.2-6 .
> It have 3 NIC(Network interface Card) eth0.eth1.eth2 .
> I have 1 LAN and 2 WAN interface they are 192.168.1.0/255.255.255.0 and =
2
> ADSL (one of my ADSL is pppoe another one is static IP) .
> Now I want to bind thy all in my NAT server .
> I rty to cut my LAN to 4 part are 192.168.1.0/255.255.255.192 &
> 192.168.1.64/255.255.255.192 & 192.168.1.128/255.255.255.192 &
> 192.168.1.192/255.255.255.192 .
> 
> That I wish the preceding 3 part go out and in with the pppoe ADSL (ppp0=
)
> and the final part go through with static IP(because they are my servers=
) .
> 
> My biggest problem is in Linux I can't set the default gateway otherwise=
 the
> ppp0 will not work .
> But if ppp0 is working I can't find who to make my final part
> (192.168.1.192/26) go through the eth0 out or aome in  ...-.-"
> 
> I have do my best to explain my problem .
> If you can't understand my question maybe can find somebody who know my
> English or can talk in Chinese will better .

I think the problem may be solved by the newer version of route, it 
is calles iproute2, with this you can set the routing according to 
sources or destination.

Hope this helps ...


 
> Sincerely yours
> thanks a lot...^^
> 
> ------------------------------
> =B9=A9=A9=F6=A6L=A8=EA=B8=EA=B0T=AB=C7
> Dinyi Printing CO. LTD
> RaykeySu
> raykey@dinyi.com.tw
> ------------------------------
> 

C.U. MC Murphy
PGP-fingerprint: 8640 43BF 0807 8349 67F4  C0CE CBA9 83BA 197B 3ED4


