From: Magnus Sundberg <Magnus.Sundberg@dican.se>
Subject: Re: Non host resident proxies
Date: Tue, 21 Jan 2003 13:14:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E2D39BC.1060302@dican.se>
References: <FD8F124A387AD6119F7900A0D218B321019AED@hslex01.hslbz.local>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Rob Sterenborg <rsterenborg@xs4all.nl>, netfilter@lists.netfilter.org

Hi,
Thanks for your answer.
It will not work, since NAT rewrites the destination header, which is=20
used by the pop3vscan proxy to find out the actual host.

But I found out later
iptaples -t mangling -p tcp --dport 110 -s ! <ip_host> -j ROUTE --gw=20
<ip_host>

According to C=E9dric, the author of the ROUTE target, you need to use CV=
S=20
for p-o-m and source, since there are some compatibility issues between=20
the new patch-o-matic-20030107 with the old iptables-1.2.7a.

/Magnus

Rob Sterenborg wrote:
>>I want to redirect all POP3 requests back to my main server. POP3=20
>>requests from the main server is forwarded to the internet.=20
>>Something like this.
>>
>>------------          -------------------
>>!          !          !                 !
>>! Client   !--------->! router/firewall !
>>!          !      ----!                 !
>>------------      ! ->! - - - - - - - - ! ---->(Internet)
>>                   ! ! !                 !
>>                   ! ! -------------------
>>-------------     ! !
>>!           !<----- !
>>! Server    !--------
>>!           !
>>-------------
>>
>>I can scan all pop3 traffic for viruses by this method.
>>I believe this setup would be correct for proxying other=20
>>protocols to. I would preferably be interested in also being=20
>>able to redirect the=20
>>protocol port too.
>>Is it possible to do this with the current netfilter release?
>>I am aware that there is good chance of unwanted loops with this setup
>=20
>=20
> You mean to just DNAT port 110/tcp (pop3) to <ip_server> ?
>=20
> I assume :
> eth0 : inet
> eth1 : lan
> eth2 : dmz
>=20
> iptables -i eth0 [-o eth2] -d <ip_server> -p tcp --dport 110 -j ACCEPT
> itables -t nat -A PREROUTING -i eth0 -p tcp --dport 110 --to-destinatio=
n
> <ip_server>
>=20
>=20
> Rob
>=20
>=20





