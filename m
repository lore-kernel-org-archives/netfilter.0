From: Tommaso Calosi <tcalosi@gmail.com>
Subject: Re: balance traffic between virtual interfaces on the same network
Date: Tue, 9 Nov 2010 16:00:02 +0100
Message-ID: <AANLkTimy_Um5z=MDeUqVfY5Kea1HpbHPg9ik3CKoE0+Q@mail.gmail.com>
References: <AANLkTikQ7HBAsiYZDhCZNNTFXUuFxHDFA8sSvN1L1QjO@mail.gmail.com>
	<alpine.LNX.2.01.1011091452410.2491@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=mP5X+PPFOUKP1DAZCzphp7M+Z+n7R6yZfVYclvtc8HI=;
        b=VFuqagg6WSeCFwzYJXn75XvkYXkifGzuCjYBLPh7nX5zQx3q9cq9Ff3DXKJ0SJABMH
         IKypOK9F9WNL9pXDvAwJA8YYaYT38oPf8fKEqqX0KAL10YY7PEnspSsk0bo+9iq+yCDb
         /78nsLpEx22XVj3fu4wrGDSKv1tIVwuiqZNkw=
In-Reply-To: <alpine.LNX.2.01.1011091452410.2491@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

That's why i wrote "virtual interfaces". If t's not possibile, then
it'd have the same effect to masquerade outgoing connection with a nat
pool made by 192.168.1.10, 192.168.1.20 and 192.168.1.30 but since
they're originating from the firewall itself, again I don't know how.

On Tue, Nov 9, 2010 at 2:53 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Tuesday 2010-11-09 14:38, Tommaso Calosi wrote:
>
>>Hi all,
>>
>>This is my setup:
>>
>>eth0:1 192.168.1.10/24
>>eth0:2 192.168.1.20/24
>>eth0:3 192.168.1.30/24
>>
>>gateway 192.168.1.1
>>
>>I know it's a strange question but it's crucial to do this in my setup.
>>I need to balance traffic between these virtual interfaces
>
> Those are not interfaces. Stop using ifconfig, it deludes the mind - use
> iproute2 instead.
>
