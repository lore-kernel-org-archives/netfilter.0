From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Thu, 23 Feb 2006 16:49:09 +0100
Message-ID: <5f56302b0602230749v5a56c8c3u6cbbdf832b59c88c@mail.gmail.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
	<5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>
	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>
	<5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>
	<5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
	<43FCCF82.6010402@certicom.com>
	<5f56302b0602221357k27931798n7d521184123bb1c9@mail.gmail.com>
	<43FCE338.4090306@certicom.com>
	<5f56302b0602221513i22ff868et991067e3314998da@mail.gmail.com>
	<43FDC9EC.1050704@certicom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FDC9EC.1050704@certicom.com>
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
To: netfilter@lists.netfilter.org

> It mean your packet traversed the prerouting nat eth1, and so on.
>
> I would put 3 log messages, at "prerouting nat eth1", "forward", and
> "postrouting nat". If your packet is seen at postrouting then it should b=
e
> successfully forwarded.
>
> I noticed that your packet's outbound interface is ppp0. However, I recal=
l
> your
> MASQUERADE rule had "--out-interface eth0". Perhaps this is the cause and
> your
> packet is not masqueraded? Try a simple "iptables -A POSTROUTING -t nat -=
j
> MASQUERADE" without qualifiers.
>
> Other things to try. Use ethereal to sniff eth1, and eth0/ppp0. Is there
> traffic?
>
> Chinh
>

Hi Chinh, thank you very much again, I'll try your suggestions tonight.

