From: Francois Chenais <francois@chenais.net>
Subject: Re: Masquerade (Newbie)
Date: Mon, 10 Jun 2002 18:54:52 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610185452.515736e4.francois@chenais.net>
References: <200206091647.32562.richard.downing@bcs.org.uk>
	<200206092118.53543.richard.downing@bcs.org.uk>
	<200206092126.g59LQEA23512@Networker.rockstone.co.uk>
	<200206101222.28237.richard.downing@bcs.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206101222.28237.richard.downing@bcs.org.uk>
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
To: richard.downing@bcs.org.uk
Cc: netfilter@lists.samba.org

Have you=20

    modprobe iptable_nat

	Fran=E7ois



On Mon, 10 Jun 2002 17:44:57 +0100
Richard A Downing <richard.downing@bcs.org.uk> wrote:

  | Antony,
  |=20
  | I was helped by email from another list member.  The error below goes a=
way if=20
  | the kernel modules are compiled in (I.E. NOT modules).  Perhaps there i=
s a=20
  | kernel bug here.
  |=20
  | I am pleased to say that I now have Masquerade running fine, and my LAN=
=20
  | machines happily soaking my bandwidth ;-)
  |=20
  | Thanks for your help,
  | Richard.
  |=20
  |=20
  | On Sunday 09 June 2002 22:26, Antony Stone wrote:
  | On Sunday 09 June 2002 9:18 pm, Richard A Downing wrote:
  |=20
  | > root:/usr/lib/iptables$: iptables -t nat -A POSTROUTING -o ppp0 -j
  | > MASQUERADE
  | > iptables: No chain/target/match by that name
  |=20
  | Okay.   I still do not know why you cannot use the MASQUERADE target, b=
ut I
  | do not use modules - I have everything compiled-in to the kernel, so I =
don't
  | know what you need to look for to find out why that command isn't worki=
ng.
  | Hopefully someone else can help on that one ?
  |=20
  |=20
  |=20


