From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Problem with DNAT
Date: Sat, 9 Nov 2002 15:18:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211091518.22273.netfilter@newkirk.us>
References: <200211091837.00935.ss310636@inf.tu-dresden.de>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211091837.00935.ss310636@inf.tu-dresden.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Steffen Schoenwiese <ss310636@inf.tu-dresden.de>, netfilter@lists.netfilter.org

On Saturday 09 November 2002 12:36 pm, Steffen Schoenwiese wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I have some problems with iptables 1.2.7a. Some of my rules which worke=
d
> well with iptables 1.2.5 produce an error message "iptables: Invalid
> argument". The specific rules look like this:
>
> iptables -t nat -A OUTPUT -p tcp -d <ip> -j DNAT --to <ip>:<port>
>
> I also tried to use --to-destination instead of --to, same error messag=
e.
> All my other rules work perfect, only the DNAT ones get this error.
> Does anyone have a possible solution?

All nat table rules, or are SNAT and MASQ accepted?  Do you have a insmod=
 or=20
modprobe iptable_nat?  I don't know your prior/current setup, but it migh=
t=20
have been compiled in before, a module now.

j

