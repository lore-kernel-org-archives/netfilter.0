From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: next topic:  --limit and --burst-limit
Date: 31 Oct 2002 16:34:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036078444.21852.62.camel@elendil>
References: <Pine.LNX.4.44.0210310917480.30950-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210310917480.30950-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

Le jeu 31/10/2002 =E0 15:27, Robert P. J. Day a =E9crit :
> 1)  how many packets can i accept in an initial burst if they just
>     come flooding in?  i assumed 5, you contend 8.  (IOW, i assumed
>     that i have just 5 tokens to start with, you seem to think that
>     it's 5 + 3 =3D 8.  so which is it?

I assumed this, but I've just finished doing some testings and I must
admit you're right. Burst represent your initial amount of tokens.
So 5.

> 2) regardless of the traffic, how frequently and by how much does my
>    token bucket get refilled?  it could be adding 3 every hour, or
>    it could be more uniform and be adding an extra token every
>    20 minutes.  (the latter would produce a more uniform packet
>    acceptance behavior.  the average would, of course, turn out to
>    be the same, but the distribution would look different.)

Well, I am no sure of anything about this match anymore, so I will let
some developper answer ;)))

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

