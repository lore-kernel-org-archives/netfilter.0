From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: opening port for SSH
Date: Wed, 14 Dec 2005 22:46:31 +0200
Message-ID: <43A084A7.9070003@gmail.com>
References: <000001c600d3$c48640b0$0101000a@sterenborg.info>
	<uizoe3jefxt.fsf@false.linpro.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <uizoe3jefxt.fsf@false.linpro.no>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: netfilter@lists.netfilter.org

Bj=C3=B8rn Ruberg wrote:

>Because you don't want to run the risk of your SSH server being
>replaced by some shady regular-user process which will gladly pick up
>your login credentials, the smart thing is to bind services like SSH
>to ports below 1024.
> =20
>
Yes, it's better to run it < 1024 but different from 22 (default).
Actually the only plus for binding it !=3D 22 is that you avoid filling
your log files with automatic scans/attacks.


regards,
Georgi Alexandrov

