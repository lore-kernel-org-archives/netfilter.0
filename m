From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Feature suggestion ...
Date: Sun, 6 Sep 2015 18:01:54 +0530
Message-ID: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=PXeFdtH6olzVBc45rcmM3AnzxQigJuagTXL3oS05khk=;
        b=sLp1aoLvDUuAH7NEvtYNVA0lqFP7ic4NN8jnwdMhrl6wFZkc0+m2Kj3dbbCryntmxZ
         ujqmzFBvVEa/Dar8kRn4UMr+rPmslcFcjtv6z+GQygtNQ7DpEbG3vBE1OhoDxRBWU7Pl
         FA/1sQ3ScYmFUYwxk0cdf5oFBadNphjuXtwTGAlpDjPh5mgs17p+bDyz/8JzsKfd6IXY
         699BBd6akM6C/q6CA85xtcGYWYc+Z7kg1yiVQo1eATiuK2rx6SfxLmD+DYhi9cgpqhsN
         UR4uCVhWf4/pxn8XA/Onuny5UycrWnxaWZ5w3+KSm37+H4eTrFthpzsbnyAgwHPlsVwt
         N5/Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi All,

With latest addition of storing skbinfo (mainly skbprio) in ipset and
then applying it later to the traffic as and when it passes the
iptables ruleset, it becomes relatively easy and simple to do traffic
shaping.

IMHO what one of the feature set which we can add is to have an ipset
of only fwmarks i.e. fw-marks will be hashed and stored in the ipset
and then later using these marks we can instantly (in single look up)
set traffic class.
Motivation for this is the fact that just reading the mark can signify
which fw rule it belongs to (no matter how complex was that firewall
rule). So if we do traffic shaping based on marks, it becomes
straightforward traffic shaping for that fw rule. Now as no of rules
increase, this lookup will also increase linearly and
more-importantly, we cant take advantage of any statefulness over
here, i.e. if there are 100 rules then everytime my packet will have
to go down 100 lines, get it matched, get its skbprio value and then
move forward.

however, if we such an ipset as I am mentioning, so all these skbprio
settings and all can always be done in single shot,

say we make something like
ipset -N MARK-TC-MAP hash:mark skbinfo

iptables -t mangle -A POSTROUTING -j SET --map-set MARK-TC-MAP src --map-prio


Whats your view on this?
