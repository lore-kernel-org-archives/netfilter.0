From: Terry Burton <tez@terryburton.co.uk>
Subject: Re: Disabling conntrack on an interface
Date: Thu, 2 Jul 2009 22:35:20 +0100
Message-ID: <2d1f9a6b0907021435q521c3db5pde46cc6b9543c694@mail.gmail.com>
References: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>
	 <1246548394.17132.19.camel@enterprise.ims-firmen.de>
	 <2d1f9a6b0907020906g207b273fr125cc75d022db638@mail.gmail.com>
	 <4A4D0051.4040900@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=R4oOckHxcnfxHcLrSgPXTLcaTMpCyAoKV2rj42b4HIQ=;
        b=K1LbwwXZPYx4iYyKvUxM/13TKYlJmCtC7ohs56UazV1NR5jkMLs0G3kW46f3LctoYt
         1cA2hxyNhUD25Ht/mBlFF64o/leQr21zOxihG8W0GzAyCP42R105GCXw8TWUCA7iAmas
         AZ8b4WM+G2yWomqpTNlNA0mSm3TCZtPLSmyO4=
In-Reply-To: <4A4D0051.4040900@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Thu, Jul 2, 2009 at 7:45 PM, Pascal
Hambourg<pascal.mail@plouf.fr.eu.org> wrote:
> Terry Burton a =E9crit :
>> As soon as I bind the (unaddressed) interface into the bridge the
>> packets are conntracked.
>
> This is because by default bridged IPv4 traffic is passed to iptables=
=2E So
> another method is to set /proc/sys/net/bridge/bridge-nf-call-iptables=
 to 0
> to disable this.

Hi Pascal,

I had discovered this method, but since this is a global (vs per
interface) conferable I chose to disregard this option.


Thanks!

Terry


P.S. Nice to find a mailing list that is backed by a responsive
community. Kudos.
