From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems to access at my internal web server
Date: Fri, 21 Nov 2003 15:11:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311211511.hALFBC725316@onyx.rockstone.co.uk>
References: <MJEBIAMBMKICAIHLFOICGENKCIAA.capa@cuao.edu.co>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MJEBIAMBMKICAIHLFOICGENKCIAA.capa@cuao.edu.co>
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

On Friday 21 November 2003 2:46 pm, Carlos Alberto Pel=E1ez Ayala wrote:

> Dear friends,
> I have a IBM Netvista box with Red Hat Linux 9.0, kernel 2.4.20-8 and
> iptables 1.2.7a.
> I have a internal web server in the address 192.168.1.5 and i try to ac=
cess
> at the page of this server from internet using the reverse nat properti=
es
> of iptables across my firewall.
>
> This is my schema:
> |-------------|              |--------------|
> |--------------|
> |   INTERNET  |--------------|  FIREWALL    |------------------|  WEB
> | SERVER
> |
> |-------------|              |--------------|
> |--------------|
>
>                    eth0=3D200.3.192.127   eth1=3D192.168.1.2     192.16=
8.1.5
>
> When i try to access to the web page of my internal web server, from
> internet (http://200.3.192.127), the page never loads. i can see that t=
he
> nat and reverse nat not is in operation.

How can you see this?   What are you checking?

My advice is to keep things simple (*much* simpler than the ruleset you=20
posted, unless you're absolutely certain that everything in there is (a)=20
needed and (b) working correctly, except for the little bit you're adding=
 to=20
do HTTP DNAT) so that it's easy to pinpoint the bit that's not working.

I also notice you have an impressive mix of INPUT, OUTPUT and FORWARD rul=
es=20
in your ruleset - far more INPUT and OUTPUT stuff than I would expect for=
 a=20
routing firewall.   Please make sure you've understood which packets go=20
through INPUT and which packets go through FORWARD=20
(http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSING=
OFTABLES=20
is an excellent reference for this information), and remove (or at least=20
comment out) any rules which you don't actually need in your configuratio=
n.

By the way, for what it's worth, I did find the DNAT and FORWARD rules in=
=20
your ruleset which I would expect to work and do the job you want, but th=
ere=20
was so much other stuff besides that there could easily be something else=
=20
getting in the way and messing things up.

You may benefit from printing out a listing of your rules in the order th=
ey=20
exist in the tables (iptables -L -n -v -x and iptables -L -t nat -n -v -x=
)=20
and simply going through them in order, checking that an incoming HTTP=20
request and the corresponding response get matched against the rules you=20
expect them to.

Hope this helps,

Antony.

--=20

The truth is rarely pure, and never simple.

 - Oscar Wilde
                                                     Please reply to the =
list;
                                                           please don't C=
C me.

