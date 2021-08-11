From: Harry S <simonsharry@gmail.com>
Subject: Why aren't INPUT and FORWARD chains available to a locally-generated packet?
Date: Wed, 11 Aug 2021 19:42:22 +0530
Message-ID: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Fnd82yg1L+2JG/DikbRgjK47dL28e9X/owqQpzVb9M4=;
        b=CS1qX+w/l3ZCggkFHPSVcX/iZ06zkGY5JxYQ3WCNm7P8PcAekxtVWtvc1rAsrkzg6M
         DjG6fy2bbk0y4eK7CIwFoQ1inEpS/WpGQeBKzTiIG5YnkdhnV9hXCtG9UtLVheeEoslK
         boJhNiaLKpiEEo/HOxSkQrRbvBrCMgN1yV8ghMYCdXJaAIqMemWLRDPYTxh51GUqPP8j
         WiZ1/5qm4qMdngHGJOb9fcYHcdCV3GinJTcIAi1guLYIBpumo51vfryVdA6mKzke0GFt
         wgFmd3x7cKaZgfUgfLrKvr8pIj1k5XDbE8ZU/J7Iq7vEEKkjCrcTUI+tnRYBDT1+mjD6
         k5bA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm unable to understand why in Netfilter there are no INPUT versus
FORWARD chain choices right after the packet has traversed the OUTPUT
chain? Currently, a locally-generated packet goes straight from OUTPUT
to POSTROUTING!

Let's say a process on a router host generates a packet. This packet
goes to the OUTPUT chain, following which a routing decision is made.
Now, this packet could be destined either for the loopback interface,
or for one of the host's many ethernet interfaces. If so, why
shouldn't Netfilter bring the packet to the same INPUT / FORWARD
decision-fork in the path that exists for an incoming packet soon
after it has crossed PREROUTING?

I have consulted *many* online sources, including Linux Network
Administrator's Guide, and the ipables tutorial by Oskar Andreasson,
but none of these explain this point at all.

Would greatly appreciate it if someone could clarify.

Regards,
/HS
