From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: REJECT as a default policy
Date: Tue, 12 Jan 2010 15:31:31 +0200
Message-ID: <4B4C79B3.5020508@gmail.com>
References: <4B4B1339.1040502@gmail.com>	 <034DEBCAE934A74991E6E76B8DA72D141884A1922E@HSSBS.holdstead.local> <56378e321001111408mbeef328j62261c7a0215e122@mail.gmail.com> <4B4C5B41.7000500@gmail.com> <4B4C7242.9070403@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:cc:subject:references:in-reply-to
         :x-enigmail-version:openpgp:content-type:content-transfer-encoding;
        bh=YabGAY5ioPXLO0VbYDgdqETQTRIM/o2BT5IaXO+wBfQ=;
        b=CcAeoPbXQUBQQEq3nCxSgZ6wOvzRM+yUA/eTcL391OXpfhJe/m2edP3n7OHeP41imy
         SDFFGU9cxeadTyOr/OsEumk8ScOgYfWu+e0VPiNmwN5OODkIZ5N+8TCfNwHwXFldhW8E
         I0+cilevinsxpiUBYsUv21eNNVMTAvT7mr5rc=
In-Reply-To: <4B4C7242.9070403@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

G=E1sp=E1r Lajos wrote:
> IMHO:
> I do not like to waste resources.
> An "unwanted/unallowed" incoming packet is already wasting time/bandw=
idth.
> A reply (ICMP or whatever else) to this makes you waste your precious
> resources.
> (Think about the ASYMMETRIC DSL)

Don't misunderstand the request.  It is not a request to prohibit the
possibility of using DROP as the default policy for chain, but one of
*also* allowing use of REJECT as a default policy for a chain.  It is
simply easiest, from a configuration standpoint, to set default with
a "-P"

There are times and conditions when DROP will be the appropriate
default, there are times and conditions when REJECT is the appropriate
default.  Currently REJECT can be done by adding it to the end of a
chain, effectively making it default.

Regards
/Lars
