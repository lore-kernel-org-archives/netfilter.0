From: Jerome Barotin <jbn@s4e.fr>
Subject: Re: How to understand causes of invalid state for an OUPUT SYNACK
 packet
Date: Fri, 21 Jan 2022 17:58:42 +0100
Message-ID: <20220121175842.126942f7@glazard>
References: <20220121122332.1501d9ba@glazard>
        <20220121124059.GA14018@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=s4e.fr; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFZ9QXjwS2zDhJvfuvOLEJ41RfnnM40zeDiWguMWRr4=;
        b=J74CdhwEMfcbmlLWLpybrFI2g+pdXHO/90E6eOmsJqGpKmo+Bv+j2ahRzbfcSTJhst
         rDJ6/YCR2br17cd+OiOxtUitJRn1zuJj80Bf2miHrWVtMonfnV1J6WwzwfXhYUBQPZrq
         IqQRZop/E5cD+eN5J5i5wPnw1U4bUsmu+F1Sc=
In-Reply-To: <20220121124059.GA14018@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

I followed your advice and I have set up a vm with a forwarding rules
between my device and my server, and then I saw that the SYN-ACK packet
is crossing the vm.=20

So I think my issue was not due to netfilter but much more to a
misconfigured firewall on the device.=20

Thanks a lot for your reply Florian, you helped me moving forward on
this issue.

Le Fri, 21 Jan 2022 13:40:59 +0100,
Florian Westphal <fw@strlen.de> a =C3=A9crit :

> Jerome Barotin <jbn@s4e.fr> wrote:
> > I've got a specific device (industrial computer) where its
> > TCP connection are always blocked by netfilter when it tries to
> > connect to my server.=20
> >=20
> > Exactly the SYN packet is forwarded to my local process, but, the
> > SYN-ACK answer is always tagged as invalid by the conntrack
> > module,=20
>=20
> Its not, the message is misleading.
>=20
> > I noticed this behaviour in the following line in kern.log :
> >=20
> > Jan 14 11:26:15 myhostname kernel: [260283.271861] nf_ct_proto_6:
> > invalid packet ignored in state SYN_RECV  IN=3D OUT=3D SRC=3D10.1.1.4
> > DST=3D10.1.1.3 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=
=3DTCP
> > SPT=3D21 DPT=3D64004 SEQ=3D1624381780 ACK=3D2190670817 WINDOW=3D64240
> > RES=3D0x00 ACK SYN URGP=3D0 OPT (020405B40101040201030307)=20
>=20
> Maybe we should just axe this message.  The packet is *ignored*, not
> marked as invalid.  Such packet will NOT trigger -m conntrack
> --ctstate INVALID.  The wording was slightly changed in 5.12 kernel,
> where this is now:
>=20
> nf_ct_proto_6: packet (index 1) in dir 1 ignored, state SYN_RECV
> IN=3D...
>=20
> > The corresponding pcap file can be found here :
> > https://filebin.net/yazmmekhrdiu4dh8/capture_not_work_ano.pcap
>=20
> Thanks, lets see (trimmed line length):
> .3.64004 > 10.1.1.4.21: Flags [S], seq 2190670816, win 8192, options
> [mss 1330,nop,wscale 8,nop,nop,sackOK], length 0
>=20
> This packets gets us to SYN_SENT state:
> tcp      6 116 SYN_SENT src=3D10.1.1.3 dst=3D10.1.1.4 sport=3D64004
> dport=3D21 [UNREPLIED] src=3D10.1.1.4 dst=3D10.1.1.3 sport=3D21 dport=3D6=
4004
> mark=3D0 use=3D1
>=20
> ... packet would match --ctstate NEW.
>=20
> .4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817,
> win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0
>=20
> This packet gets us to SYN_RECV state.
> ... packet would match --ctstate ESTABLISHED.
>=20
> .4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817,
> win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0
>=20
> This packet produces the 'ignored' message quoted above, its ignored
> because we already saw such packet before, so packet matches
> ESTABLISHED state.
>=20
> .4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817,
> win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0
>=20
> This repeats the message, no other side effects.
>=20
> .3.64004 > 10.1.1.4.21: Flags [S], seq 2190670816, win 65535, options
> [mss 1330,nop,nop,sackOK], length 0
>=20
> Similar message, this is for 'index 0'
>=20
> 4.21 > 10.1.1.3.64004: Flags [S.], seq 1624381780, ack 2190670817,
> win 64240, options [mss 1460,nop,nop,sackOK,nop,wscale 7], length 0
>=20
> > Also, I do not understand how this connection could be in SYN_RECV
> > conntrack state. This state means that SYN-ACK packet has already
> > been received and I'm sure that no such packet has already been
> > submitted.
>=20
> Where was that dump taken?  Its what I used to tcpreplay into a vm.
>=20
> > Do I miss something ? Anybody has got idea to help me understand
> > (and fix) this case ?
>=20
> Is the conntrack machine forwarding or an endpoint?
>=20
> If forwarding, can you provide pcaps from the inbound
> and outbound interfaces?
>=20
> You could also -j LOG packets in state INVALID to pinpoint which
> packet really does get marked as INVALID, but afaict its not a
> packet contained in the provided pcap.

