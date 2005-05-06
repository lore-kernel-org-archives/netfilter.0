From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: Ftp server behind firewall
Date: Fri, 6 May 2005 16:35:23 +0200
Message-ID: <9151ac2a0505060735cbf5dc8@mail.gmail.com>
References: <be9633cf05050607321c66eae0@mail.gmail.com>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <be9633cf05050607321c66eae0@mail.gmail.com>
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
To: Pierre Santana <gnuskiter@gmail.com>
Cc: netfilter@lists.netfilter.org

On 5/6/05, Pierre Santana <gnuskiter@gmail.com> wrote:
> Hi;
>=20
> I have a ftp server behind firewall and I can connect on ftp server
> but I can't  list the archives of the directory.
> The ftp server use the port 21 to connections and 20 to send packages.
> How I can do the iptables rules?
>=20
Did you do a:

modprobe ip_conntrack_ftp

and, in case you are using NAT:

modprobe ip_nat_ftp

and allowing RELATED traffic in your firewall rules ?

Regards,
Filip

