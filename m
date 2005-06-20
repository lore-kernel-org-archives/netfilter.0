From: Jean Wolter <jw5@os.inf.tu-dresden.de>
Subject: Re: Embedded system and shared libs
Date: Mon, 20 Jun 2005 15:05:11 +0200
Message-ID: <86is09rxfc.fsf@erwin.inf.tu-dresden.de>
References: <ZIVCORREOybvQoG9Bvo00001d0e@correo.ziv.es>
	<1119009815.3521.33.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1119009815.3521.33.camel@localhost.localdomain>
	(ma.alvarez@usyscom.com's
	message of "Fri, 17 Jun 2005 14:03:35 +0200")
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?q?Miguel_=C1ngel_=C1lvarez_Cabanes?= <ma.alvarez@usyscom.com>
Cc: netfilter@lists.netfilter.org

Miguel =C1ngel =C1lvarez Cabanes <ma.alvarez@usyscom.com> writes:

> - If I try to build iptables without NO_SHARED_LIBS and copy the
> libipt*.so to /lib/iptables on my system, I can test the tables
> (iptables -t nat -L), but I cannot do MASQUERADE or so... I obtain:
>
> "iptables v1.3.0: Couldn't load target `MASQUERADE':File not found
>
> Try `iptables -h' or 'iptables --help' for more information."

The default location for the iptables shared objects is
/usr/local/lib/iptables, did you change this? have you tried to use
strace to find out where iptables looks for the shared object files?

regards,
Jean

