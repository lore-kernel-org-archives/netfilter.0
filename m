From: =?iso-8859-1?B?SOVrYW4gRW5nYmxvbQ==?= <cynic_0@hotmail.com>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 19:16:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F166Ss04dM6Mpx00054200@hotmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

OK, thanks for the support.

br H=E5kan E.


>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: source-mac filtering
>Date: Sun, 11 Jan 2004 17:50:52 +0000
>
>On Sunday 11 January 2004 5:39 pm, H=E5kan Engblom wrote:
>
> > Yes, I've come to realize that.
> >
> > Is it technically necessary for the dhcp-server to do so, or could it be
> > that some other dhcpd behaves different ?
>
>It is technically necessary, because DHCP clients do not have IP addressing
>information when they begin the communication; everything is done using
>ethernet broadcasts.   Such packets cannot be acquired using a standard
>socket bind, so the server application needs to listen at a lower level=20
>than
>the TCP/IP stack allows.
>
>Regards,
>
>Antony.
>
>--
>A: Because it messes up the order in which people normally read text.
>Q: Why is top-posting such a bad thing?
>A: Top-posting.
>Q: What is the most annoying thing on usenet and in e-mail?
>
>                                                      Please reply to the =

>list;
>                                                            please don't C=
C=20
>me.
>
>

_________________________________________________________________
Hitta r=E4tt p=E5 n=E4tet med MSN S=F6k http://search.msn.se/


