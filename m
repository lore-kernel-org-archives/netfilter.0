From: Tim Gardner <timg-l6nL5VImRDY@public.gmane.org>
Subject: Re: 2.6.0-test9, bridge firewall, interface specification
Date: Thu, 6 Nov 2003 15:11:13 -0700
Sender: ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Message-ID: <200311061511.13781.timg@tpi.com>
References: <200311061407.23335.timg@tpi.com> <1068155572.818.19.camel@elendil.intranet.cartel-securite.net>
Reply-To: timg-l6nL5VImRDY@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1068155572.818.19.camel-C+0P+FOGv0rbFIwZ3jqLltgfHpRXVu16X36uYwy3hK3k1uMJSBkQmQ@public.gmane.org>
Content-Disposition: inline
Errors-To: ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Help: <mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5utDmRdBvX5/5lLLH9aP38KF1pqr+6INuaA@public.gmane.org>
List-Post: <mailto:ebtables-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5utDmRdBvX5/5R9m/fhtKvoLKtGCp0j7rLg@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5utDmRdBvX5/5ji9XKYC2TYK4Io4DoRGLOrNAH6kLmebB@public.gmane.org>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=ebtables-user>
Content-Type: text/plain; charset="iso-8859-1"
To: Cedric Blancher <blancher-cPThYx3uDionEikN29/hQkZa+K1vlBrA@public.gmane.org>
Cc: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org, ebtables-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

Way cool. Thanks for the note. It works again.

On Thursday 06 November 2003 14:52, Cedric Blancher wrote:
> Le jeu 06/11/2003 =E0 22:07, Tim Gardner a =E9crit :
> > I have a well behaved bridge firewall using 2.4.22 with the relevant
> > P-O-M patches applied. In testing 2.6.0-test9 I have determined that
> > interface specification on a rule no longer works. For example, the fir=
st
> > rule in the set that should catch 99% of all inbound TCP packets is
> >
> > iptables -A FORWARD -i $EXTIF -m state --state ESTABLISHED,RELATED -j
> > ACCEPT
> >
> > If the interface is specifed, then this rule does not accrue any packet=
s.
> > Is this an expected change in behavior from 2.4.22?
>
> When using a bridged firewall with 2.6 kernels, inbound interface is
> bridge interface, i.e. br0, and it is outbound one as well...
> That's why you have physdev match that allows one to match the
> _physical_ interface, among all ones belonging to the bridge, that
> actually received the packet.
>
>
> cbr-4hKyKyxg39Y@public.gmane.org:~$ iptables -m physdev --help
> iptables v1.2.8
> [...]
> physdev v1.2.8 options:
>  --physdev-in [!] input name[+] bridge port name ([+] for wildcard)
>  --physdev-out [!] output name[+] bridge port name ([+] for wildcard)
>
>
> So, in your case :
>
> 	iptables -A FORWARD -i br0 -m physdev --physdev-in $EXTIF \
> 		-m state --state ESTABLISHED,RELATED -j ACCEPT

=2D-=20
Tim Gardner - timg-l6nL5VImRDY@public.gmane.org 406-443-5357
TriplePoint, Inc. - http://www.tpi.com
PGP: http://www.tpi.com/PGP/Tim.txt



-------------------------------------------------------
This SF.net email is sponsored by: SF.net Giveback Program.
Does SourceForge.net help you be more productive?  Does it
help you create better code?   SHARE THE LOVE, and help us help
YOU!  Click Here: http://sourceforge.net/donate/
