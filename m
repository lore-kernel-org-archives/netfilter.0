From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Problems regarding IPtables
Date: Thu, 08 Apr 2004 14:50:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081428617.1727.16.camel@anduril.intranet.cartel-securite.net>
References: <53720.172.31.1.1.1081411596.squirrel@mail.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <53720.172.31.1.1.1081411596.squirrel@mail.local>
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
To: raman mittal <rmittal_02@iiita.ac.in>
Cc: netfilter@lists.netfilter.org

Le jeu 08/04/2004 =E0 10:06, raman mittal a =E9crit :
> I am student graduating in Indian Institute of Technology, India.
> I have a small  problem regarding IP tables.I am capturing DNS reply
> packets (which are later to be forwarded to a client)at the firewall an=
d
> QUEUEing them using IPQ library for altering the DNS answer section in =
the
> user space using the forward chain of filter table.

OK.

> i have changed the answer section of the dns reply, which results in
> change of checksum fields in IP and UDP header.I have also corrected th=
e
> checksum of both the headers but the problem is that after doing
> this,reverse SNAT takes place automatically (because Of DNAT done
> earlier)which again changes the checksum and the packets get dropped at
> the client side.

I must admit I'm quite puzzled.

UDP packet containing DNS answer arrives, with good checksums. You
capture it and modify DNS answer. For it may modify data length, you
have to recompute IP checksum. For it modifies UDP payload, you have to
recompute UDP checksum as well. So you reinject a packet with good
checksums. Then goes SNAT which modifies IP, and optionnaly UDP, header,
so recomputes checksum. But checksums recomptued by SNAT should be good
as well.

So my question : are you sure checksums are to blame for packet
rejection at client side ? If they're OK, there's no reason for the
packet to get rejected.

BTW, UDP checksum is optional. Maybe you zero it to disable UDP checksum
check at client side.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

