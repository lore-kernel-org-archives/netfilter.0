From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: SIP conntrack question
Date: Wed, 02 May 2007 19:47:36 +0200
Message-ID: <4638CEB8.3020404@plouf.fr.eu.org>
References: <3931e0d50704301448u354ae3afo81e155e6ecfff09d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3931e0d50704301448u354ae3afo81e155e6ecfff09d@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Sanjoy Dey a =E9crit :
>=20
> I am trying to find out whether the SIP connection tracking module
> that was introduced in 2.6.18 works even if SIP runs on ports OTHER
> THAN 5060.

"modinfo ip_conntrack_sip" will tell you about the optional "ports"=20
parameter which takes a comma-separated port list.

> Would the helper module listen on all ports for a SIP/SDP
> header to find out which ports to open up for RTP or RTCP?

No. It watches only the port list (up to 8 ports) provided in the=20
"ports" parameter. By default, if watches only port 5060. Note that if=20
you want to watch port 5060 and some other ports, you must explicitly=20
put 5060 in the list.

