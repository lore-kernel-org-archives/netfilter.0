From: John Conner <bs7799@gmail.com>
Subject: relaying tcp traffic?
Date: Fri, 27 Mar 2009 14:28:49 -0500
Message-ID: <12e4ae820903271228v7375a673m3444aa4050bf834c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=p5A7r+GBGGeDx0scxUl2XnKZ4no0JUoHTXck/5ScS14=;
        b=a04McSQc65+niJg9lI2s4MfJd38wD40rjAEOGaVtMxFKlVWyH00BvqA/a+6gN9thkj
         i4kf3b1vDg0xiN9JR5NxyhFu3VySiacWbViSCTkNR61KbY7v+dg6+EKFDPE8iRBuVft1
         oOd8G3xrjZLf0Qu/xhgdpFGiVqh8xlE6LkB8k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello everyone,

I am trying to setup a relaying box which will be used to relay
tacacs+ accounting traffic(TCP) to a central server,=A0 I have been
using iptable for a while, but only on the firewall side, so before I
spend a lot time researching this, can any of you tell me if it is
possible for iptable to perform such functionality? and which keyword
should i be looking for? thanks a lot!

Pro
