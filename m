From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Groups in iptables
Date: Sat, 29 Nov 2003 17:24:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070144674.2884.2.camel@grendel>
References: <000301c3b69e$3e4122d0$6400a8c0@pfontenot>
	 <001301c3b6ab$d569cf10$8b00000a@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c3b6ab$d569cf10$8b00000a@casa>
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
To: Leonardo Rodrigues =?ISO-8859-1?Q?Magalh=E3es?= <leolistas@solutti.com.br>
Cc: paul@pitbull-racing.com, "Net Filter (E-mail)" <netfilter@lists.netfilter.org>

On Sat, 2003-11-29 at 14:06, Leonardo Rodrigues Magalh=E3es wrote:
>
>     In your case, 192.168.0.25, 192.168.0.26 and 192.168.0.27 cannot be
> written as network/mask. So you CANNOT write one SINGLE rule to do what=
 you
> want. You'll probably need to write a single rule for each address.

You could use 192.168.1.24/30, but that would include the address
192.168.1.24 as well. Not sure what's more important in this case, fewer
rules or limiting the access from 192.168.1.24.

C



