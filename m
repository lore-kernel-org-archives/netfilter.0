From: "Siqhamo Sifo" <siqhamo@newlunar.co.za>
Subject: Kphone not opening a secondary SIP direct connection
Date: Wed, 18 Oct 2006 06:49:00 +0200 (SAST)
Message-ID: <32809.196.211.143.85.1161146940.squirrel@196.211.143.82>
References: <20061017221442.1B6351538A8@comm.newlunar.co.za>
Reply-To: siqhamo@newlunar.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061017221442.1B6351538A8@comm.newlunar.co.za>
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
To: netfilter@lists.netfilter.org
Cc: ashutosh.naik@gmail.com

> Hi guys,
>
> I am using kphone 4.2 in my setup, where I am connecting to the
> internet behind a router. What I observe is that my kphone client is
> unable to establish a secondary direct connection with the other
> user's  SIP client
>
> I think SIP allows a secondary direct connection, and netfilter ALGs
> have also been written to allow this ( ip_conntrack_sip.c and
> ip_nat_sip.c ).
>
> Please let me know if this is a kphone client issue ( The client is
> not initiating a secondary connection ) or it is something else.
>
> Kindly CC me on the replies,.
>
> Regards
> Ashutosh
>

Hi ,
the problem may  not be  with ur phone it might be  with the ip_conntrack
and ip_nat_sip modules ,but before I get into that  u need to elaborate
more on ur setup ,c  the thing is in some cases these do work and in some
they don't e.g DNAT for more info c my bug report
https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=3D503
.




