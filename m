From: David ROBERT <castlebbs@gmail.com>
Subject: Log and Drop with OSSEC
Date: Fri, 7 May 2010 16:41:37 +0100
Message-ID: <m2x57bfe46c1005070841of1b6cdc7paaef031f3995679b@mail.gmail.com>
Reply-To: david@ombrepixel.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:reply-to:date
         :message-id:subject:from:to:content-type;
        bh=93T67ebQnQ8HGxY1zKfYpHtXB3/w+BesnSV9c+p3r5o=;
        b=EXdpzGAUINNZcgu2FMdNUTHwDnLP3PeZo8QS5zeFKYJ8eYE4yRuuXNcVTw6lJzlQ3o
         nS4qPAvQscsykPPJbMRwiPhvWobzv6EUn97SWDzSOTQLgaxm5Aj3Sm/4U5bAVx7gZxUx
         cxL+RWoVgGaF286TT+H90gKLpz1ozqxLgMsD4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I have a very basic question. I am updating an active response script
for OSSEC that add DROP rules. I added rules to log packets being
dropped:
Ex for IP 1.1.1.1

iptables -I INPUT -s 1.1.1.1 -m limit --limit 1/sec -j LOG
--log-prefix OSSEC-HIDS --log-level 7 (rule added)
iptables -I INPUT -s 1.1.1.1 -j DROP (original rule)

It doesn't log, it actually logs if I only run the first rule, as soon
as I run the DROP rule, it DROP packets indeed, but it won't log
anymore.

Thanks

David ROBERT
http://blog.ombrepixel.com/
