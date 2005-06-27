From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: Blocking Direct outgoing connections to port 80
Date: Mon, 27 Jun 2005 08:58:04 -0400
Message-ID: <876ef97a050627055863a7e303@mail.gmail.com>
References: <6c2d1c9d05062705301afcf744@mail.gmail.com>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6c2d1c9d05062705301afcf744@mail.gmail.com>
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
To: shardul Adhikari <free2squid@gmail.com>
Cc: netfilter@lists.netfilter.org

On 6/27/05, shardul Adhikari <free2squid@gmail.com> wrote:
> Hi list,
> I want to block direct connections comming to port 80 from my network
> , but allow them connections via proxy port 8080 , how to go about it.
>=20
> Thanks in Advance.

The LARTC cookbook shows how to do this:

http://lartc.org/howto/lartc.cookbook.squid.html

This is a little old (it uses ipchains for some things) but you should
be able to figure out how to update it for use with iptables.

--=20
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

