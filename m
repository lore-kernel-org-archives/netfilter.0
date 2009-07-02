From: Terry Burton <tez@terryburton.co.uk>
Subject: Re: Disabling conntrack on an interface
Date: Thu, 2 Jul 2009 17:06:56 +0100
Message-ID: <2d1f9a6b0907020906g207b273fr125cc75d022db638@mail.gmail.com>
References: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>
	 <1246548394.17132.19.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=/OjBQj5bgez7pye0A8C1Dhld+IdUBb/+MLXwh36Jm9g=;
        b=M1SBQPqvS0rAuvwiBZ/ehN3S/3u/dgO7LSw+2atfxRS+7dmfPhmFCMnMylQ8625qrG
         Gc8WUx+VnF5oE+H6iyrla29vNeVkLH3saLej5QlBFsavAYEJZaApn6BhVQ12NITddJaD
         kyZ8n6gfCJP3oQgLu/OZYa6mkfh35reKensv0=
In-Reply-To: <1246548394.17132.19.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Thu, Jul 2, 2009 at 4:26 PM, Thomas Jacob<jacob@internet24.de> wrote=
:
> On Thu, 2009-07-02 at 16:10 +0100, Terry Burton wrote:
>> Is it possible to disable connection tracking for a specific interfa=
ce/bridge?
>
> Check out:
>
> =A0 NOTRACK
> =A0 =A0 =A0 This target disables connection tracking for all packets =
matching
> that rule.
>
> =A0 =A0 =A0 It can only be used in the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0raw table.

Hi Thomas,

Thanks, but my issue isn't with firewalling, rather that I'd like this
traffic to avoid the conntrack table altogether to avoid system load.

>> The particular scenario is that I have a secondary interface that
>> collecting the traffic from a SPAN/mirror port on a busy router. Thi=
s
>> interface is enslaved into a bridge along with the virtual interface=
s
>> of a some analyser virtual machines, using setageing=3D0 so that the
>> frames are forwarded to all VMs.
>>
>> I would rather not have the traffic that originates from the capture
>> interface hitting the connection tracking code, if possible.
>
> Understandable, but does that actually happen for you?
>
> I do not get any conntrack entries from mirrored ports when
> I am port mirroring packets onto a Linux interface that is up
> but has no configured addresses.
>
> As long as these packets are not addressed to your machine the netfil=
ter
> code never gets to see them, AFAIK.

As soon as I bind the (unaddressed) interface into the bridge the
packets are conntracked.


Thanks,

Terry
