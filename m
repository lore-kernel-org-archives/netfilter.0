From: "Charles Romestant" <cromestant@gmail.com>
Subject: Single Packet Authentication [help needed]
Date: Fri, 28 Mar 2008 23:41:36 +1930
Message-ID: <5078d3df0803272111t13112eedtadb04c994bcae9fa@mail.gmail.com>
References: <5078d3df0803272102m63ac2150gb639f9da1a760214@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=1SbEmWizD2ERmUtgJm+fOnoy7MHidjDM2pHkcH8M6lQ=;
        b=iGnDQARTusHKVKvcNLv7mAqCVL2l7EegwSPmfiSzn49fvWuX40DhFb6F8HWkSZ5KaJO3rOIWYjKDHUfE+Y1U2rQIwXQEQo41mI2zB2ubhHJyeJxAHT3rVzWtAFLsT8h+dWhmrEuaakQBXPGWfhsLqxrAmmuAZvQflFcXQRSU1zI=
In-Reply-To: <5078d3df0803272102m63ac2150gb639f9da1a760214@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello to all, i' m writting my undergraduate (computer science)
 thesis, which is basically a small SPA server implemented using
 libpcap and iptables.

 I am having trouble with understanding exactly what rules I need to
 setup for this to be possible, I know that this has probably been
 addressed in this mailing list, but even after research I find myself
 in need of some help.

 If anyone in the list is familiar with SPA systems can you please lend
 me a hand in understanding how this can be done with ip tables?

 Basic operation mode for the server :

 Authenticate user with the authentication packet sniffed ( done ).
 change ruleset to open port for the connection.
 client send keep_alive packets at X s intervals so that if the
 conexion is hijacked we can close it.
 close connection

 this is not too dificult as It would seem that all I have to do is add
 the rule to the input table

 other mode would be a "fake-open" in which the port is not actually
 opened ( undetectable with scanners) but still packets of
 authenticated users should reach aplication lvl.

 well there is more that I would need help but understanding this would
 be of HUGE help

 Thank you in advance to all that read this.

 Ps: i ve checkd fwknop code but its waaay bigger than what i need to
 do, and i 'd rather understand and do myself than read code that
 already does it.
 ps2 : form C code is opening a pipe to iptables still the best way to
 modify rules?

 Thank you,
 Charles Romestant.

 --
 Charz



-- 
Charz
