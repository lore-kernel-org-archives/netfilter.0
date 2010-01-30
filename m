From: Susant Sahani <ssahani@gmail.com>
Subject: nf_reinject crashes after NF_STOLEN
Date: Sat, 30 Jan 2010 12:39:16 +0530
Message-ID: <d81115a61001292309y48cfa9c9u34455269f9597d37@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type;
        bh=QwGWXIUWS013NLkU2KyeDYNAK/iZfJF0qutPYMs2kRo=;
        b=LLH6Lz2C7EmZw/kQNmHKaoopPbpdVUgjZsEOZ2D+DbZtzftstUffTRjhmsb/XfzqMh
         R0PpDS2VW5U4RzmCV24Os70xdqtP/hF0ck5g3J24urlDFgtgBcvG0laNQ+oJbFSGs0eh
         ej+L6kSUbrq8NRTVzfJ18kV63tV1stMzr/RYM=
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netdev@vger.kernel.org

Hi,
       If NF_STOLEN is done then how to reinsert the packet after sometime.

Here is the scenario.

packet1 comes in store return NF_STOLEN
packet2 comes in store return NF_STOLEN
packet3 comes in store return NF_STOLEN
packet4 comes in reinsert All the packets (packet1, packet2, packet3,
packet4) to IP stack so that it can continue the journey.

But if I do nf_reinject it crashes.

Please let me know how to do it.

susant
