From: exnix.com@gmail.com
Subject: Non-blocking access to packets via queue libraries
Date: Tue, 13 Oct 2009 23:15:15 +0300
Message-ID: <dc68ffce0910131315p4297b925qc9f627e7c8db03e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=xb/3aLZcTQqGTRXfpnFb6ui/Xn7ABEWWfmpETiysTCg=;
        b=hobYaXKR4uciAKleBgOd4ff9zRh8bnRQ2zbM34nolvBX3Tf9r5ttm/FHpOLaWpmLyJ
         3H2Yz2yAoSV17lBx45p/wFOrWLLasgCkU3A8M60rb24GVwQT7NQCdWJIpvQbdK6OQfBd
         7KY0BNRfuWo3ON2KAJBvhD/1Cz44lViYHN1GM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello guys !

=A0 I'm trying to writing a simple program which will delay the packets
amenably to the rules. (rules are code of this program).

=A0 I have a VERY BIG problem with implementing this because queue
libraries working in blocking mode. It waits when callback returns
something and goes further.

=A0 Of course I guess this packets going through netfilter without any
queueing, working by the scheme : first in, fist out, second in,
second out. Even if it's true, how can I implement parallel processing
of the packets, through another things ?


=A0 Hope for your help!
=A0sorry for my english %)

Thank you.
