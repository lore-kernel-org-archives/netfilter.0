From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: more questions about kernel config options for iptables
Date: Tue, 8 Apr 2003 03:04:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304080304.25765.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0304071706510.20955-100000@dell>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304071706510.20955-100000@dell>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>, iptables mailing list <netfilter@lists.netfilter.org>

On Monday 07 April 2003 05:18 pm, Robert P. J. Day wrote:
>   having poked around even more in the options, i must say
> i'm a little puzzled.  mostly, i'm interested in understanding
> what some of these options do all by themselves, so forgive me
> if i end up repeating myself.
>
>   first, the basic Connection tracking option claims to be
> necessary for masq/NAT.  what value is that option if it is
> the only one selected?  it may be *necesasry* for masq/NAT,
> but it certainly doesn't seem to be *sufficient*.  what is
> the value of selecting that single option to the exclusion
> of all others.  what does it allow you to do?

Conntrack is what supports stateful filtering - without it you won't have=
=20
the "--state" match, and can only filter explicitly on IPs, port=20
numbers, etc.

>   next, notice that "IP tables support" also claims to be
> necessary for masq/NAT.  if that's the case, it would seem
> that these two options should somehow be interdependent.

Well, if you're going to use MASQUERADE then you need iptables support,=20
even if you're not going to use iptables for any filtering.

>   another way of looking at it might be, why would anyone
> select "Connection tracking in the first place"?  might it
> not be more reasonable to have the user select the
> *functionality* they want, and have something like
> that basic connection tracking option as an invislble
> dependency?

For some users, perhaps, but Linux has grown up in (or has gathered,=20
depends on your perspective) a community of people who want to know what=20
is going on, and have fine-grain control over it at will.  Perhaps some=20
day there will be a "make easyconfig" option that will set whole banks=20
of appropriate settings based on high-level spoon-fed questions=20
targeting a completely non-technical user.  But ATM I'm not aware of any=20
'real' kernel config working this way, as kernel building is still=20
targetted largely at the knowledgeable linux-savvy user/admin.

>   to that end, it would make more sense to have a restructured
> menu with more obvious options like
>
>   Basic filtering
>   Simple NAT
>   Masquerading
>
> and so on.  the actual object files associated with these
> *functions* are of no interest to the user.  he/she cares
> only about what can be done afterwards.
>
>   here's another question.  notice the options under
> "Connection tracking".  first, i'm aware that because of
> the way FTP works, you need some connection tracking ability
> to filter it properly.  so this is just straight FTP
> filtering.

Actually you can filter it (presuming you mean 'allow it to pass')=20
without conntrack, but your resulting firewall is not nearly as tight as=20
it would otherwise be...

>   note, however, that the next three options -- IRC,
> TFTP and Amanda -- refer to using those protocols
> in conjunction with NAT or masquerading.  if this is
> the case, i can see having FTP in one submenu associated
> with filtering, with the others in a submenu associated
> with NAT/masq.  it just seems to make more sense that way.

Actually all four (and others) are conntrack and nat helpers that are=20
needed both for stateful filtering AND nat, AFAIK.

>   anyway, comments?

Not to be a smartass, but if you're unsatisfied with the options or their=
=20
groupings, you can always contribute to the kernel effort... :^)=20
{kernelsourcetreeroot}/net/ipv4/netfilter/Config.in  is the file that=20
controls the construction of the netfilter/iptables-related options=20
during make xconfig/menuconfig etc.

> rday

j



