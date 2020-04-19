From: Martin Gignac <martin.gignac@gmail.com>
Subject: Is viewing a "candidate" ruleset in 'nft list ruleset' format possible?
Date: Sat, 18 Apr 2020 22:12:29 -0400
Message-ID: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mXW+EQGnmGE9OIPlws8bscMzV4s+vm6iDvhZDg3B01U=;
        b=CRNqhwpEPSlGfQcc0fkEqWaplipTgCnmq3grcczzIUr8XuhAsFiJVdSnXV8/K++0AU
         gijU+k+UrYlfcBBQul4st2uxPs78fJqOzHoM99FwPpzSn6p2W1u7r+FWfgtR6S0eOl0o
         LgKogpEDmQz2Tt/kElw+62cLQH7wnRcRd5c7cAgR1KwrDXporGLzBylOK0E+graXF1+6
         +ZZzWkArx/ziMat/+3BVsJ82ZzrjGiIA4ZqIEgTHxMyDB0TsNdlJplPrhTAhMEyL30t7
         aYL5+DiHz0zIt4pnm7niUoFcOuBRJlq2UmaVzauZLlPmGbKSSlb7n1sFKAnivKpiqgt3
         ur3A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'd like to know if it's possible tell 'nft' to load a ruleset from
file *without* applying it (a la 'nft -c -f <ruleset>) *but* also have
it show the parsed (yet unapplied) ruleset in 'nft list ruleset'
format as well?

I ask because I have a Bash script with a few helper functions for
nftables and one of the things I'd like to be able to do is to perform
a diff between a candidate ruleset and the last applied/current
ruleset. I can already do this by diffing the ruleset from file with
the last previously saved ruleset from file, but I'd like to be able
to (instead) compare the ruleset using the "cleaned up" format from
'nft list ruleset'. I just don't know how to generate a "candidate"
ruleset in that format without applying it to the kernel first (and
then it's not longer a "candidate", obviously).

Hopefully my question makes sense.

Thanks,
-Martin
