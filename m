From: "Edmund Turner" <eturner@monash.edu.my>
Subject: RE: Configuration question...
Date: Mon, 3 Nov 2003 15:06:25 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011401c3a1d8$ff6ae7f0$de0018ac@admin.monash.edu.my>
References: <010301c3a1d8$18d86ab0$de0018ac@admin.monash.edu.my>
Reply-To: <eturner@monash.edu.my>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <010301c3a1d8$18d86ab0$de0018ac@admin.monash.edu.my>
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
To: =?iso-8859-1?Q?'Mart=EDn'?= <martin@familia-fiumara.com.ar>
Cc: netfilter@lists.netfilter.org

Sorry, previous email was incomplete. This should work.

/iptables -t nat -A PREROUTING -i eth1 -d 192.168.2.1 -p tcp --dport
10329 -j DNAT --to (the real server IP):(port)

regards
edmund


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Edmund Turner
Sent: Monday, November 03, 2003 3:00 PM
To: 'Mart=EDn'; netfilter@lists.netfilter.org
Subject: RE: Configuration question...

Martin,

You can use a prerouting :
Assuming you want to connect to a tcp port 10329 on the linux machine.
=20
/iptables -t nat -A PREROUTING -i eth1 -d 192.168.2.1 -p tcp --dport
10329 -j DNAT --to (the real server IP)


regards
edmund


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Mart=EDn
Sent: Monday, November 03, 2003 12:48 PM
To: netfilter@lists.netfilter.org
Subject: Configuration question...

This is the situation:

I hace a linux machine, giving internet access to a win98 machine. The=20
win98 machine has a soft wich does not accept NAT, so the soft does not=20
work when has to connect to internet.
Linux: eth0 (wich is conected to the adsl modem > ppp0 ) 192.168.1.10
       eth1 (interface conected to the LAN, IP 192.168.2.1)

Win98: IP 192.168.2.5

What I need to do is: make the win98 software believe that it is
connecting=20
to a server service in the linux machine to port 10329, and that traffic

has to be redirected to an external Ip in internet (the real server with

the service in port 10329). And the, the traffic comeing fron that
server=20
has to be redirected to the win98 machine but with the source IP changed
to=20
192.168.2.1 (the internal IP of the linux)

Can tell me the comands to configure the linux and iptables to do this?
Thanks
      =20


