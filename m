From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: RE: binding nntp to one interface
Date: Thu, 12 Sep 2002 09:55:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20020912095337.024805d0@of23sm3>
References: <A758C299015FD411887B0000E2131186C213F2@TRUVA>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A758C299015FD411887B0000E2131186C213F2@TRUVA>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?iso-8859-1?Q?=DDhsan?= Turkmen <iturkmen@ifk.com.tr>, netfilter@lists.samba.org

thanks

I can know set the rule, but it doesn''t help. What I guess I really need=20
is a way to bind all outgoing requests on port 119 to one interface, i.e.=
 ppp0


anybody knows if this is possible?


Rasmus

At 10:26 12-09-2002 +0300, =DDhsan  Turkmen wrote:
>Rasmus.
>SNAT can not be defined in PREROUTING , you must use POSTROUTING table.=
 This
>is your first failure..
>
>
>-----Original Message-----
>From: Rasmus Reinholdt Nielsen [mailto:rasmus@narani.dk]
>Sent: Thursday, September 12, 2002 10:06 AM
>To: netfilter@lists.samba.org
>Subject: binding nntp to one interface
>
>
>Hi
>
>I have two different internet connections, to two different ISP's, set up
>as load balancing.
>
>My problem is that both my isp's have ip restricted their newsservers, so I
>need to bind all outgoing trafic on port 119 to a specific interface or ip.
>Anybody knows how to do this?
>
>I have tried using redirect but it didn't work
>
>iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 119 -j REDIRECT --to
><wan-ip>
>
>and I get an error of "Invalid argument" on this SNAT rule
>
>iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 119 -j SNAT --to
><wan-ip>
>
>hope somebody knows haw to do this.
>
>Thanks
>
>/Rasmus


