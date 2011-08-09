From: Ryan Whelan <rcwhelan@gmail.com>
Subject: Simplifying rules with ipset
Date: Tue, 9 Aug 2011 17:03:32 -0400
Message-ID: <CAM3m09RqnQ_K_3e3Vq6vJhVDPT6XMH_ar3sUDf79Da18nUdBZw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=n/jprpMLzkF3GlcJQ+gkHpIkJ8elHsx/kJtkFmaKLB0=;
        b=JOMa/BZCTrbNL4e+Fx6Hwz87qEGB5JN2Jt7PZ1jqsCt27sDFI9LgK5tYt7ElVm66mY
         xjTUq0l6Nm3lUBO10KO9lm7oV7zHvmc05Npep2b3AJeB56MfUFd6tdr3R6s2BuRe1s8G
         cA3W2jOBRGj/FtX0m7lq34usl/fVV3yAB/Wk4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is it possible to create a single, or very few, FORWARDing rules that
will only ACCEPT a packet if its src and dst ipset is the same?  I
have a handful of linux routers that will be carrying multiple
different customers traffic and I have to ensure that each customer
can only send traffic from their own networks to other
networks/subnets they have been allocated.  My current plan is to
create an ipset for each customer and put each of there
networks/subnets into their ipset and to simplify the FORWARDing
rules, I'm hoping there is a simple way to only ACCEPT a packet if its
src and dst are in both in the same ipset.  Is this easily doable?
I'm trying to avoid having to create exceptions to a default deny for
every possible combination of each customers networks.  I must admit,
I've not used ipset in the past, so I'm not sure this is how it works.

Also, is there an way to distribute changes to the ipsets (when a
client gets added / deleted or when a new network gets allocated) to
multiple machines?  I can script something, I just don't want to
reinvent the wheel if there is something already out there.
