From: "Gabby James" <lizard0000092@hotmail.com>
Subject: Re: Filter out broadcast messages
Date: Thu, 08 Jan 2004 07:20:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY10-F90LqDkgyDzS20002923f@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Thanks Antony and Eric for the ideas.  Each idea has solved my problem, so =

it is just a matter of deciding which one to go with.  Thanks again!


>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: Filter out broadcast messages
>Date: Wed, 7 Jan 2004 22:05:29 +0000
>
>On Wednesday 07 January 2004 9:44 pm, Gabby James wrote:
>
> > Hi,
> >
> > I would like to filter out all broadcast messages.  The packets could=20
>come
> > from 255.255.255.255 or multiple other addresses of the form 10.*.*.255.
> > What kind of syntax do I use to DROP these packets?  The line below will
> > filter out packets from 255.255.255.255 but I'm not sure what syntax to=
=20
>use
> > to DROP the other adresses.
>
>Second idea:
>
>If you mean what you say, and the other broadcasts fit the pattern=20
>10.*.*.255,
>you could always use the little-known but perfectly valid netmaslk
>255.0.0.255 in a rule such as:
>
>iptables -I INPUT -s 10.0.0.255/255.0.0.255 -j DROP
>
>This will do exactly what you asked - match packets where the source IP's
>first byte=3D10 and the last byte=3D255, with the middle two bytes being
>anything, and drop them.
>
>Antony.
>
>--
>Perfection in design is achieved not when there is nothing left to add, but
>rather when there is nothing left to take away.
>
>  - Antoine de Saint-Exupery
>
>                                                      Please reply to the =

>list;
>                                                            please don't C=
C=20
>me.
>
>

_________________________________________________________________
Working moms: Find helpful tips here on managing kids, home, work =97  and =

yourself.   http://special.msn.com/msnbc/workingmom.armx


