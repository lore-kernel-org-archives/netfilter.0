From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: source-mac filtering
Date: Mon, 12 Jan 2004 12:56:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040112175640.GC8023@cannon.eng.us.uu.net>
References: <Sea1-F167vrztUmdyB400051e33@hotmail.com> <200401111750.52867.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401111750.52867.Antony@Soft-Solutions.co.uk>
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

On Sun, Jan 11, 2004 at 05:50:52PM +0000, Antony Stone wrote:

> On Sunday 11 January 2004 5:39 pm, H=E5kan Engblom wrote:
>=20
> > Yes, I've come to realize that.
> >
> > Is it technically necessary for the dhcp-server to do so, or could it=
 be
> > that some other dhcpd behaves different ?
>=20
> It is technically necessary, because DHCP clients do not have IP addres=
sing=20
> information when they begin the communication; everything is done using=
=20
> ethernet broadcasts.   Such packets cannot be acquired using a standard=
=20
> socket bind, so the server application needs to listen at a lower level=
 than=20
> the TCP/IP stack allows.

I guess he's asking why dhcp-server uses NETLINK. Your answer is for the
clients, right?

Ramin

