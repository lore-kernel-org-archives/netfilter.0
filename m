From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: How to obtain process ID that created connection or owns one
	packet
Date: Fri, 23 Dec 2005 09:36:28 -0400
Message-ID: <65aa6af90512230536g6e7eaafaw114038ea31a84e74@mail.gmail.com>
References: <1b8130000512182054y7208121dtb6b20814540bbb3b@mail.gmail.com>
	<43A6EA58.9090201@eurodev.net> <43A6EC1F.7030600@eurodev.net>
	<43ABED47.8070100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43ABED47.8070100@gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Processes related to connections can be seen with netstat -p:

netstat -np
netstat -nlp

and so on

On 12/23/05, Mikado <mikado4vn@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I need to know a packet or a connection related to what process ID. In
> Netfilter there is a match called 'owner' but I dont know how it
> actually works. Can somebody tell me these informations?
>
> Thank you.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.2 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>
> iD8DBQFDq+1HmS/zF9V69ugRAsmNAJ4p2oVqxg+Iz+dC0JgfsQSWh0/gbQCfdeJE
> irX6H+I0gvtSfhzHNxnbqzY=3D
> =3D03tK
> -----END PGP SIGNATURE-----
>
>

