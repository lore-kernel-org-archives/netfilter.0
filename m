From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Iptables + ftp ??
Date: Tue, 17 May 2005 22:46:17 +0200
Message-ID: <fad9d48405051713464517ed9@mail.gmail.com>
References: <1116359380.1180.10.camel@maclinux.lotus>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1116359380.1180.10.camel@maclinux.lotus>
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
To: aspenbr <aspenbr@yahoo.com.br>
Cc: NetFilter <netfilter@lists.netfilter.org>

# modprobe ip_conntrack_ftp

Do you want to allow FTP going out of the network onto the internet or
FTP traffic into the server connected to the internet, or worse NATted
to an internal host?

On 17 May 2005 16:49:41 -0300, aspenbr <aspenbr@yahoo.com.br> wrote:
> I am with problem, necessary to liberate the connection of my internal
> net for external site of ftp the problem and that the site of ftp
> connects using random doors, it has somebody me of the one tip as I make
> to create a rule to connect with this site of ftp has security, I am
> using iptables.  Thanks: -)
>=20
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

