From: George Georgalis <georgw@galis.org>
Subject: Re: ip_conntrack: table full, dropping packet. - Anyone????? Frustrating!
Date: Mon, 3 Jun 2002 22:31:20 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603223120.A4716@trot.haven.dom>
References: <4884.24.168.132.35.1023124727.squirrel@mail.vistawiz.com> <Pine.LNX.4.44.0206032333160.13191-100000@grignard> <20020603231636.S27307@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020603231636.S27307@funkyjesus.org>; from nickd@funkyjesus.org on Mon, Jun 03, 2002 at 11:16:36PM +0100
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

Shazad, could it be a loop in your firewall rules?

// George

On Mon, Jun 03, 2002 at 11:16:36PM +0100, Nick Drage wrote:
>On Mon, Jun 03, 2002 at 11:34:32PM +0200, Rasmus B=F8g Hansen wrote:
>> On Mon, 3 Jun 2002, Shazad Malik wrote:
>
>> > Jun  3 08:03:28 new kernel: ip_conntrack: table full, dropping packet.
>>=20
>> > Seriously, I going beserk now!  I just have two machine sitting behind
>> > my test box and just one user(thats me!). All I'm doing is surfing the
>> > web. Dont have a clue why its happening!
>>=20
>> Perhaps you need a larger conntrack table?
>>=20
>> echo 32768 > /proc/sys/net/ipv4/ip_conntrack_max
>>=20
>> Be aware, that this could use a lot of memory (I don't remember how
>> much).
>
>I think Shazad said he'd tried increasing the size of the table already.=20
>Actually, what does
>
>cat /proc/sys/net/ipv4/ip_conntrack_max
>
>give you?
>
>--=20
>FunkyJesus System Administration Team
>
>

--=20
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229=20
Security Services, Web, Mail,            mailto:george@galis.org=20
File, Print, DB and DNS Servers.       http://www.galis.org/george=20


