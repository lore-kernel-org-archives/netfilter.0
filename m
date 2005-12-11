From: Erik <erikev@gmail.com>
Subject: Re: QoS with netfilter
Date: Sun, 11 Dec 2005 01:18:26 -0800
Message-ID: <bab495710512110118x7d82bc59l554a45039b75fe23@mail.gmail.com>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
	<200512101357.44378.arny@ats.s.bawue.de>
	<bab495710512100528h5103dd81t35a56afe726a7b7b@mail.gmail.com>
	<1134232492.31448.0.camel@anduril.intranet.cartel-securite.net>
	<bab495710512101014g6909071s2e69552681c39cd3@mail.gmail.com>
	<1134243923.3532.8.camel@anduril.intranet.cartel-securite.net>
	<439B7959.4000400@lopsch.com>
	<1134288474.8304.4.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1134288474.8304.4.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

I have a lot of answers to this but nobody have responded to what I
asked.  Please bear with me and help me find out what my problem might
*actually* be.

Have anyone actually used this feature in iptables?

No, I do not need this router to handle these packages with *any* QoS.

Other router handle QoS. In fact a lot of router are updated to handle QoS.

What I need is *very* simple.

Please do not refer to man pages, lartc etc. that has no answer to my quest=
ion.

I am only trying to get a feature to function as described in man iptables.

namely:
>iptables -t mangle -A FORWARD -s 10.0.0.0/8 -j DSCP --set-dscp 1

and then:
 verify that the TOS/DSCP bits are set correctly

I was hoping for a discussion like:
a) confirmation that this feature actually is implemented and should
work with the 2.6.12 kernel (or that it is not!)
b) things to verify like patches etc
c) actual commands to test this

Thanks

