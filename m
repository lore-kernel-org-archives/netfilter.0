From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Simple question
Date: Wed, 05 May 2004 11:19:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40991426.2000805@pbl.ca>
References: <001501c432b5$7a5c5f80$a704a8c0@mpro4167>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c432b5$7a5c5f80$a704a8c0@mpro4167>
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
To: =?ISO-8859-1?Q?Oriol_Magran=E9?= <omagrane@mediapro.es>
Cc: netfilter@lists.netfilter.org

Oriol Magran=E9 wrote:
> =20
>     Hello!
>     Just one question...
>     I have a firewall with the INPUT, OUTPUT and FORWARD policies set t=
o=20
> DROP, and now I want to allow connections from localhost to localhost=20
> (any port). Which chains are implied here? INPUT? OUTPUT? Both?
>     How should the needed rule(s) be?

You'd need both INPUT and OUTPUT.  Just as if it was connection to=20
remote system (just think what rules you would put on both local and=20
remote system if it was remote connection, and than apply both sets of=20
rules to local system, removing duplicates).

--=20
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

