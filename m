From: Josu Gomez <jgomezp81@googlemail.com>
Subject: Re: Help with compiling netfilter/iptables modules
Date: Tue, 21 Sep 2010 00:35:00 +0200
Message-ID: <AANLkTi=-mvjbFcbjO7-Gf81rbHgsA8GKn3EqR1AX4p+8@mail.gmail.com>
References: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com>
	<alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=QmgHJTdA/xLnI/FXBZByTK/r2n3fdzmKfz944TIM3Gc=;
        b=v1CESb9cqH2yyjV9BdQz9Psg+izKy/U/PNk/gWkTAleLnBtR9WUbxdGXY3Qd50z/4R
         6z+Sb2JUUIe4ra5JScjEDZYp0zSEvhXdW6wAZN43Mj4UJ7NepkE9bZq4hr9v7OenyIsZ
         mDMpLonmQJT62IK/nxWifUbN8qEJlxiE4QeFQ=
In-Reply-To: <alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

In the source and build tree there are the same files, all the modules
name but only with .c extension (not .o sorry , not .ko) Compiled as
.ko none.
Is this normal ? I would like to compile all the modules possible.

2010/9/20 Jan Engelhardt <jengelh@medozas.de>:
> On Monday 2010-09-20 21:59, Josu Gomez wrote:
>
>>Hello,
>>
>>I compiled iptables 1.4.9.1 for powerpc architecture using this commands :
>>
>> ./configure --prefix=/dream/root/cdkroot
>>--host=powerpc-tuxbox-linux-gnu (with edited configure file to run
>>cross-compiling)
>> make
>> make install
>>
>>The binaries and libraries are created successfully and there are
>>tested (with other modules).
>>The problem is that the modules there are not compiled.
>
> Which modules? What in the source tree is missing getting compiled?
>
