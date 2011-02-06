From: Juan Araya Bravo <juan.araya@gmail.com>
Subject: Filter IP to use two ISP and make it failsafe
Date: Sun, 6 Feb 2011 20:40:12 -0300
Message-ID: <AANLkTi=W23VuvLzFzxXQXpxAwD6JzQjWBuzUFTXxhPpG@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=zBFNQZ3ENoVyVYspwEaQdanv3Ggddy354GuZjcYWPkk=;
        b=jNLfURg1oKRXWHlXTPXrVKpTPaLh/j8kJOM3gxgSgvWo+EcUNvAHy+yWbY6lknQscY
         O4m+MEQySbWobmdUqwFmMzvQujXk9kgq+3s15KC1vs2/PfpLofTMSHII7Z8y1mkBt90n
         PJ4tjEDRxsycOIFMbf5tu/nsv0cQdMFK1nK/Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, this is my first message to the list and first of all i apologise
for my very bad English.

The thing is i have one machine with three NIC cards acting as a
gateway. One of the NIC (eth0) is connected to LAN and the others are
connected to two different ISP (eth1 = ISP A and eth2= ISP B).

I was looking for a rule that let me determine specifically which IP
can use the ISP A and let all the others to use the ISP B connection.

Also i need that when one of the connections fails all the traffic
will be directed by the one which works.

Please help me with a link or something i can read to learn how to do it.

Thanks in advance.

---
Saludos, Juan Araya Bravo.
juan.araya@gmail.com
