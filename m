From: Richard Horton <arimus.uk@googlemail.com>
Subject: slip interfaces
Date: Thu, 10 Dec 2009 10:29:38 +0000
Message-ID: <56378e320912100229k2ef6000bhc6d06d27ae512d96@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=zkiaA2AbT0cOHQqa7oKsPxJHLzSeWW7cBF5eqEYPSUk=;
        b=SPmQbq3MK4d4SWU9pXOlq0aQNUzpsPKLL6dxQeggDV82Y4swdw4LbDDv8LbH7tBpLH
         WlNJ0p6xHtayudd0e2DOA4rPjXdEsue1shKfIHrkfGKecdnBIjIYf+OdPxMQ37SeFAWB
         URezIbGbEGumEoruqwtYHIH0y/NHsZSzGjQdA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Slightly offtopic but this list is probably the most likely to have
people who know the answer...

I've got a requirement to filter traffic for a given SERIAL DEVICE
connected via slip..

Now as people may or may not know slattach creates sl# interfaces in
the order slattach was called... on our system there is no certainty
that sl0 will always be /dev/ttyM3 for instance.

Is there anyway to identify from anywhere (inc the /proc and
/sys/class/net fs) which sl# maps to which /dev/ttyM# number?

Thanks,

Richard.

-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
