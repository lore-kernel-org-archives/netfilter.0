From: =?iso-8859-1?Q?Jos=E9?= Alberto Aguilar =?iso-8859-1?Q?Gonz=E1lez?= <jaag@dte.uma.es>
Subject: Re: port forward using iptables not happening
Date: Fri, 05 Jul 2002 09:24:05 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.0.20020705092047.02cfcb30@150.214.214.72>
References: <001e01c223ef$7bdc0d50$0805010a@gecs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001e01c223ef$7bdc0d50$0805010a@gecs.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.samba.org

Is your box routing packets?
(do you have /proc/sys/net/ipv4/ip_forward=3D"1")

At 12:14 05/07/2002 +0530, you wrote:
>Dear Support
>My setup is ..I have one linux box having eth0(valid ip202.140.152.33) and=
=20
>eth1(invalid ip-local lan192.168.220.250) .I have one more machine in my=20
>Local Lan (192.168.220.90) which is a mail server in my local LAN.Now I=20
>want to
>1.enable port forwarding ie any request comming on 202.140.152.33 port 285=
=20
>should get forwarded to 192.168.220.90 port 25 my mail server.
>
>2.Also any request comming from my lan ie 192.168.220.0/24 to invalid ip=20
>of linux box ie 192.168.220.90 285 should also forwarded to my Mail server=
=20
>in lan ie 192.168.220.30 port 25.
>
>My first synario is also not working.
>
>my rules are
>
>iptables -t nat -A PREROUTING -i eth0 -p tcp -d 202.140.136.90 --dport 285=
=20
>-j DNAT 182.168.220.90:25
>
>iptables -t nat -A POSTROUTING  -o eth0 -j MASQURADE
>iptables -t nat -A POSTROUTING -s 192.168.220.0/24 -j MASQURADE
>
>Pls help
>
>
>Thanks and Regards
>Deepali
>

-----------------------------------------------------------------------
Saludos, Regards, Saluti, Salutations, Gr=FC=DFe
-----------------------------------------------------------------------
Jose Alberto Aguilar Gonz=E1lez
Departamento de Tecnolog=EDa Electr=F3nica
Universidad de M=E1laga - Espa=F1a
E-mail: jaag@dte.uma.es


