From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: libipt_time.so
Date: Wed, 4 Jun 2003 20:34:29 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306042034.29616.fabrice@netfilter.org>
References: <000b01c32a19$6397d630$3fc348d8@GONDOR>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c32a19$6397d630$3fc348d8@GONDOR>
Content-Disposition: inline
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


Hello,

On Wednesday 04 June 2003 05:44, Francisco Ra=FAl Flores wrote:
> I'm trying with fwbuilder, i'm running in a redhat 8 box and i need the
> libipt_time.so, (this does not come with the original iptables in my
> distribution, so i build iptables from the sources, version 2.8), every
> thing compiles fine ...at least i think so ;), but the problem is that
> the libipt_time.so doesn't get compiled...
> Do i have to do something special in order to get this library?, is
> there some compile script somewhere?, where i could tell the compiler t=
o
> produce the library?... Because reading the INSTALL file, all starts
> with the make stuff...
> May some of you could helpme with this...
> Thank you so much!...
> Francisco R. Flores,

The time match is an extension which is not built by default.
You should find more info in the netfilter-extensions-HOWTO:
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.h=
tml

Have a nice day,

--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown


