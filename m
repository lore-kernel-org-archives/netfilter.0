From: Rainer Ellinger <rainer@ellinger.de>
Subject: Re: "unclean" ?bug? with dell dns
Date: Mon, 9 Sep 2002 20:27:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091948.1734@ellinger.de>
References: <20020827025542.A15684@yannick.lesaint> <20020828132419.GC21410@morinfr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020828132419.GC21410@morinfr.org>
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
To: Guillaume Morin <guillaume@morinfr.org>, Yannick Le Saint <y.lesaint@free.fr>
Cc: netfilter@lists.netfilter.org

Guillaume Morin wrote:
> >  When i "dig www.euro.dell.com", i get in syslog :
> I'd say that unclean matches the packet because of a checksum
> mismatch. There must be a buggy router between you and the server.

I ran into the same problem and can also confirm that this is a problem=20
with dell's nameserver or a system on dell's side. Further=20
investigation with ethereal showed that matching pakets had their udp=20
crc set to 0x0000. My questions are:=20

Should this condition really considered harmful and matched by unclean?
Why is there no corresponding log message from the unclean module?

--=20
rainer@ellinger.de

