From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: NAT appears to be unaware of ports in use on router
Date: Tue, 20 Jul 2010 20:07:21 +0100
Message-ID: <AANLkTikj97bR882CJLJ469kESpCBzsRy034v2deuOdrX@mail.gmail.com>
References: <AANLkTin_lR3j4I9IYcrAlcAXAV_PDt6aDsrTXX9IHtAS@mail.gmail.com>
	<AANLkTinlUW3jecWLPBdgK4GPu2PUlLvZ9FxzdNyjkJlB@mail.gmail.com>
	<alpine.LSU.2.01.1007202103420.8195@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=rdYgRsq7ojm8dQOl+tAa2679bAdhDp12AWO91WEK4OA=;
        b=uHylHh68L7OVrxox4FV4IxX4ebQbK4poQJaVES1kFAHBF7CPXWiDwNWGm8P4JkN/xd
         vI3YUW/Y/YhMmR4IHTkat36Jsh95kuvazQ0cimaKKGl+V6Zkn2MbN4C8y2F6WeXOwybw
         U5IJBju/EFXrpIMg0t7Mx/AlwRTegrNlzlxq8=
In-Reply-To: <alpine.LSU.2.01.1007202103420.8195@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Simon Ditner <sditner@gmail.com>, netfilter@vger.kernel.org

On 20 July 2010 20:05, Jan Engelhardt <jengelh@medozas.de> wrote:

> It happens not to.

Ah good :)

>>-A POSTROUTING -p udp -o eth0 -j MASQUERADE --to-ports 6000-50000
>>-A POSTROUTING -p tcp -o eth0 -j MASQUERADE --to-ports 6000-50000
>>-A POSTROUTING ! -p tcp ! -p udp -o eth0 -j MASQUERADE
>
> At most one -p option is allowed.
>

Thanks, wasn't sure and without the linux box to hand wasn't certain.


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://uk.linkedin.com/in/richardhorton1972 - My linkedin profile
http://www.solstans.co.uk/richard - Online CV
