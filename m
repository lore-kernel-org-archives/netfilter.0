From: Anton Melser <anton@linux.com>
Subject: Advice on best way to set up multi-route NAT for lots of IPs
Date: Sun, 1 Jan 2012 17:10:51 +0100
Message-ID: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:from:date:x-google-sender-auth:message-id
         :subject:to:content-type;
        bh=5FAHRb4drtRkluX8ROW8BQeMNLNPB+RjitCRadW+H2s=;
        b=rzm1z3x3UT1QOqydAl3/t4BscYmfnxiPhrqaIl6PI2e27A/9Q85C95rOAKQL1wueWW
         +6aqilShAS0wv3qcNsAsH65O6V+9gdCydW2fXVEljdZIRsbZwf0b4qgs8jra7RaJ/ot3
         3Ck/UvfUxprvtggb1NadyVXLPYu7hRntYQcYM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I am very new to iptables but have been trying hard to learn as much
as I can... I have a reasonably simple need but performance might
quickly become an issue so would like some advice on the best way to
go forward.
So, I have around 1600 public IPs in 4 blocks (3 x /23 + /25 on
different ISPs). I have a certain number of machines (somewhere from 3
to 8, needs to be variable and changeable without FW reconfiguration),
and each one needs to be able to send email from each external IP (and
needs to be able to do this deterministically). The only traffic
should be to port 25 on the external destination IPs - the machines
are only sending email, never receiving, so AFAICT everything can be
closed inbound (at least for NEW).
I thought that the best way to go would be to set up NAT using blocks
in the 10.0.0.0 range. So say for each external IP I would have a /24,
giving me up to 250-odd potential internal machines. So 10.1.1.1,
10.1.1.2, 10.1.1.3, etc. would map to 1.1.1.1; 10.1.2.1, 10.1.2.2,
10.1.2.3, etc. would map to 1.1.1.2, etc.
I have been reading as many sites as I can but I can't work out the
best way to go forward.

AFAICT the best way to do this is with iptables SNAT - is that the
case? It's not 1 to 1 so it needs to be stateful, and can't be done
with just iproute2 stuff - am I correct in my understanding?

There seem to be many different ways I could do this in terms of
routing - at least by source IP, TOS, and fwmark. Is one of these
preferable? Am I absolutely going to need a rule for every external
IP? I wouldn't have thought so, but can't work out how to do it... I
did some testing and was able to successfully send via several default
routes following
http://kindlund.wordpress.com/2007/11/19/configuring-multiple-default-routes-in-linux/
but that was when I was sending from the local machine without NAT...
If I do need a rule for every IP, is performance going to be an issue?
Would setting up some hashing like that explained in
http://lartc.org/lartc.html#LARTC.ADV-FILTER.HASHING be the best way
to mitigate these issues?

Any help or suggestions most welcome.
Thanks.
Anton
