From: Romain Moyne <aero_climb@yahoo.fr>
Subject: Re: port translation
Date: Sun, 11 Jan 2004 13:53:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40014750.5000300@yahoo.fr>
References: <4001239D.7010904@yahoo.fr> <1073825033.761.1.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073825033.761.1.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher a =E9crit :

>Le dim 11/01/2004 =E0 11:21, Romain Moyne a =E9crit :
> =20
>
>>I have a http server (debian 3.0) behind a router (debian 3.0). I have a =

>>problem when I want to log the visitor's IP of my website with PHP or=20
>>Perl or all language. I have always the IP of my router ! Somebody tell=20
>>me that I must do port translation but I have searched and I haven't=20
>>fand anything.
>>Can you help me ?
>>This is the rules of my router :
>>iptables -t nat -A PREROUTING -d MyIP -p tcp --dport 80 -j DNAT=20
>>--to-destination 192.168.0.3:80
>>   =20
>>
>
>You have a problem here. This single rule does not prevent your
>webserver from seeing client IP as source, as you only modify
>destination IP.
>
>You may have a SNAT rule in POSTROUTING chain that is not restricting
>enough and also SNAT incoming traffic to your router's IP when it should
>not.
>
> =20
>
Ok. I begin to understand... Now I have corrected my rules :
iptables -t nat -A POSTROUTING -j SNAT -o ppp0 --to-source My_ip_on_internet

But now I have a new problem : My router, my http server and my=20
workstation are connected with a hub.

                      ppp0                                            =20
              eth0
INTERNET--------------------192.168.0.1(router)=20
---------------------------192.168.0.3 (http server)
                                                                     =20
                     |
                                                                     =20
                     |
                                                                     =20
                     |
                                                                       =20
  192.168.0.2 (workstation)

I can't access to my webserver with my workstation and it very painful....
Can you still help me ? :-D

Romain








