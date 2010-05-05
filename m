From: Bill Bogstad <bogstad@pobox.com>
Subject: Re: what is atomicity of iptables packet processing?
Date: Wed, 5 May 2010 14:04:22 -0400
Message-ID: <y2l2d6a9f6f1005051104ped3a574bo86d01dbe5db31b11@mail.gmail.com>
References: <h2u2d6a9f6f1005050856pc4d54582z7ccb7f79cb71991c@mail.gmail.com>
 <alpine.LSU.2.01.1005051843340.2592@obet.zrqbmnf.qr>
 <AANLkTinImt-RX4BBQaf641sH3lekA81pC_tsdKEgMGho@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=mime-version
	:in-reply-to:references:date:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding; s=sasl; bh=PhQTkl9euEyj
	7oMl0evXPwW9dxY=; b=Agp3DBhVQILwXP5D30yq8/Ziff/5c71lepcaLUZBVMlb
	nua1PgtvLnnXH6+K8Y2UDwJd305WslVDAFCY+lu7UVNrk8CRGA+hWgS8ENlbD9CG
	sg1atv+W7PXB89BtQn1fcQd/dFye2rhhvW5ToK+3AsIikoIXQqwRgYE6a/68CZA=
In-Reply-To: <AANLkTinImt-RX4BBQaf641sH3lekA81pC_tsdKEgMGho@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Wed, May 5, 2010 at 1:57 PM, ratheesh k <ratheesh.ksz@gmail.com> wro=
te:
> =A0> On Wednesday 2010-05-05 17:56, Bill Bogstad wrote:
>>Since incoming packets may not be synchronized with outgoing
> packets, there is the possibility that the INPUT chain rules might be
> modifying the connection marking at the same time that the OUTPUT
> chain rules are using the mark to modify the packet.
>
> I am a little bit confused .
> My understanding is pkts will traverse thru various HOOKs one by one =
=2E
> PREROUTING -> INPUT etc . So how come ,the same pkt will be marked an=
d
> processed at different hooks at same time =A0?

I'm doing connection marking not packet marking.  A packet being
processed in the INPUT chain causes a connection mark which will be
used by rules in the OUTPUT chain to modify some other outgoing packet
being sent by the local TCP server.
I apologize for a less then clear description of the problem.
=46ortunately for me, Jan figured out what I meant.   Unfortunately,
his answer isn't what I wanted to hear. :-)

Bill Bogstad
