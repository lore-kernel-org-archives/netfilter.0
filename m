From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: RES: NAT, SNAT, FORWARD, what i use ?
Date: Fri, 1 Nov 2002 20:42:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021101204209.KGGI27595.mta05-svc.ntlworld.com@there>
References: <NGBBLIMDELLHLIKGLDNNMEEBCBAA.leonardo@openware.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBLIMDELLHLIKGLDNNMEEBCBAA.leonardo@openware.com.br>
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
To: netfilter@lists.netfilter.org

On Thursday 31 October 2002 4:31 pm, Leonardo A. de Camargo wrote:

> >> I have machines xxx.zzz.yyy.www (conected to internet, via eth0) and a
> >> 196.10.10.1
> >
> >Just out of interest, where did you get that IP address from ?
>
> Just some IP from my mind, it is internal, just used between those two
> machines=B4s eth1.

I recommend that instead you should use a proper reserved address range fro=
m=20
RFC1918:

10.0.0.0/8
172.16.0.0/12
192.168.0.0/16

> >iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j DNAT --to
> >196.10.10.1
> >iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> >iptables -A FORWARD -p tcp --dport 80 -d 196.10.10.1 -j ACCEPT
> >This will allow you to contact your internal web server using a browser =
on
> >the Internet, by contacting xxx.zzz.yyy.www
>
> Actually it didnt work, i set up info loggin and nothing were being logged
> in port 80.

Put a LOGging rule at the start of your PREROUTING chain in that case, just=
=20
to make sure that packets are coming in to your netfilter machine:

iptables -I PREROUTING -t nat -i eth0 -p tcp --dport 80 -j LOG=20
--log-prefix=3D"HTTPin "

> I=B4ll put my lil script to set this up, it runs in xxx.zzz.yyy.www=B4s
> rc.local

I recommend you try just the commands I have listed above.   There is no=20
point in complicating the situation by including all sorts of other stuff i=
f=20
the simple bits don't work yet.

If it is possible for you to run a packet sniffer eg ethereal on the extern=
al=20
interface of the firewall eth0 that would also be a good way of making sure=
=20
you have some port 80 requests coming for it to be able to process.

Antony.

--=20

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

