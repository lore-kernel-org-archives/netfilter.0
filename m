From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Subject: On ebtables and tap.
Date: Sat, 28 May 2011 12:38:45 +0200
Message-ID: <BANLkTi=sUAEdfGtte35ex=MucrCSfPXVqg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=ZfXMm2KfaBNQpdWd5mPY1jZju08zrX0iXILVt0raCqc=;
        b=CU0O9S9VFlVlo9y/ad/MfK3udP6+6z+coPe5igB0Fm7/wXSpyDUoGVQJem4kxLupvV
         FYBnc9xaT6EoRtuNZf0OGG/JbBNhsYd8HsCFonYBV+redzaieWjl1SIy5v2M/q9R/mxD
         7bXlHVoVIQrOvdmz5Eas59X2TKu0zlqzpDeuk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

It seems that at least with 2.6.22.5 ebtables and tap don't work together...

# uname -a
Linux openSuSE10.3 2.6.22.5-31-default #1 SMP 2007/09/21 22:29:00 UTC
i686 i686 i386 GNU/Linux

(note: eth0 is the bridge - peth0 is the ethernet device, tap0 is a tap device)

# brctl show
bridge name     bridge id               STP enabled     interfaces
eth0            8000.000xxxxxxxxx       no              peth0
                                                        tap0

# ebtables -t filter -L --Lc OUTPUT
Bridge table: filter

Bridge chain: OUTPUT, entries: 9, policy: ACCEPT
--logical-out eth0 -o tap0 -j CONTINUE, pcnt = 0 -- bcnt = 0
--logical-out eth0 -j CONTINUE , pcnt = 17082 -- bcnt = 3139318
--logical-out peth0 -j CONTINUE , pcnt = 0 -- bcnt = 0
--logical-out tap0 -j CONTINUE , pcnt = 0 -- bcnt = 0
-o eth0 -j CONTINUE , pcnt = 0 -- bcnt = 0
-o peth0 -j CONTINUE , pcnt = 17079 -- bcnt = 3134992
-o tap0 -j CONTINUE , pcnt = 0 -- bcnt = 0
--logical-out eth0 -o peth0 -j CONTINUE , pcnt = 17077 -- bcnt = 3133402
-j CONTINUE , pcnt = 17076 -- bcnt = 3131960

(slight mismatches in numbers because of non-atomic load)

As you can see, it seems that traffic leaving the 'eth0' bridge out
over 'peth0' goes through ebtables, but the traffic leaving the same
bridge via 'tap0' doesn't.
(and yes there is definitely traffic leaving via tap0, since I see
packets on the other side of the ssh tap connection)
Is this expected?  Long fixed?
