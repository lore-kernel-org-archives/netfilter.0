From: Ricardo Klein <klein.rfk@gmail.com>
Subject: ipset 6.16 kernel panic on bitmap:hash,ip
Date: Tue, 27 Nov 2012 10:17:59 -0200
Message-ID: <CADuigkVyCJVe5yKVvcKweZ=FmnTTWE1JQ55a35LrCLi2oWBHoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=IhzbPYnobBsZZR9iMc4wbwmdHp5jm01PBYQR3piFbFg=;
        b=tQ2aEN91FEvFjF+e7k1m1wIeXD4k/4twEh2oABTr5BeY+OfNqMjO9Dg8eGa5yu5oza
         Z9PgJgQSj/LBrSDGdusaMtV2pXyfjFv7m3duGrqMFvPq7OklOvfMHFZ+RsINocgbj0S0
         ell0EiB66P4cKz1TEPa6O/k2LnVEF2PB0gSeQkZX2xZRdotnhRM+S1ZmGDGgfF1sJykH
         ma++ddbJmvHYPeeAOekPAHWhV3Jkl49tCBXueYzXJ38vHZdCvSvNdF5H30SOLOVdZIQx
         5BWQVqbnpHyLqORYuHCI8ZGW3nCYkAnX7oflvGEqU5Myg54EoCdAUg5/7S62dbs07Bsb
         9Pow==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

When I creta an ipset like this:
ipset -N SET_MACS bitmap:ip,mac range 0.0.0.0/0

I got kernel panic when run:
ipset list

Anyway, we need some rules here based on mac address (no matter what
ip address the machine have, because some of them are in DHCP).
I know that a mac address can be easy cloned, but, still, we need that
for some rules...

Can we have a set type "mac address" ? Only mac, with no ip?

O tried "ipset -N SET_MACS_ADM bitmap:ip,mac range 10.0.0.0/8" too but got:
ipset v6.16: The range you specified exceeds the size limit of the set type

"ipset -N SET_MACS_ADM bitmap:ip,mac range 10.0.0.0/16" woked...

But again, this does not do the job because I need to set a rule based
on mac address and dinamic ip addresses.

* Using CentOS 6.3 x86_64 with latest updates on VirtualBox (last one too)

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com
