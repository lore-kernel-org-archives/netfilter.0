From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: hashlimit : limiting cases of 250pkts/sec. Does it hold now also?
Date: Thu, 27 Nov 2014 17:13:31 +0530
Message-ID: <CAA5aLPikXhxpagEM6XQXw5JPWtrSGmGE2w3gd9Coqj72OPTpww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=3HsZncu+HDb2mSxTqpcUUor9yigFKRtWwW0ymkmSrW8=;
        b=f2O6e2V8ShW+5TQhRWN9BMFURkVEU/Dx/fQ2S8ypYt0FTOW36ovrqjWCtR8FhMnelm
         l1gPyZK7soaFJ/GW2WBlJr8HeU5pravQ6q23TJ2Zl0u51pnfyVN2e3rljsPh7GqjdV8c
         vHhEPNqov2XPids6xPwQLk0EsynKwQdAkNQViRpvgP/+4qeMHM2R6h3FHjC7dcg8dgkW
         p3Iy4r078p/B3pC8qOnpxSiiTe0Svkc2tNesgpoUpxGuW5c5+vV8meee1G0gtt51HyOd
         E97iSASU8IRdogcu/tmkJ1d+5mHDftrNl8fItUUePN9JctkNVY87o8LGgGCEykXLyHIK
         XhAQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

hashlimit due to jiffies,etc had an upper limit of handling
250pkts/sec.(1 every 4 msec)

However, when I am testing I am able to test for 500pkts/sec and even
above that.

So does that limit hold now also and I have messed up the things

or

there is something else which I am not aware of ?
