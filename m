From: "Ling Deng" <lingwsm@gmail.com>
Subject: Update iptables rules according to received user lists
Date: Wed, 14 May 2008 16:09:48 +1200
Message-ID: <7b4d898c0805132109j2c75c8b2je82f0c4fdb368973@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=saic+O3PvkjJdQbGNznpNUfSmUtrrkofQ02HNYBKmhI=;
        b=wPOkPUcVwvrFfuvHHtZRygUG7vJUGlpVOIFDQ/DNWbbyLi6yO7ktLWtAlYEQC52ssMRXRoltK9AakKlJ+T3ICpwaL1StocMJH+NwLl+HIK6+60zcswuA19P0yCREA8vLFNfPhlmFgPK8eUFdpDJkErSp/H5AzHWFYMmTv5o/lgI=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear List,

     How are you. I am a newbie to iptables @.@, so I need some help
with my project...

     Right now, I have a VoIP server, that can record legitimate
users, and would send the update of "legitimate user list" to a linux
firewall, through an UDP socket.
     When a new user comes in, the server will send a "add user" notification.
      The legitimate user entries have expiry, when a user expires,
the server would also send a "remove user" notice to the firewall.

     I want to modify the firewall, so the firewall can update its
iptables rules, according to these notifications.

     Could you please give me some suggestions on how to make this happen?

      Your help will be greatly appreciated!

      Thank you very much.

       Ling
