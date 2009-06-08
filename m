From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: Packet, Netfilter and libnetfilter_conntrack
Date: Mon, 8 Jun 2009 18:25:45 -0300
Message-ID: <3fdd6ce00906081425t1883d2b6l3dc2dac6fd1ed818@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=sDW43oYnv2fbbrPjxZnxAnZozCAQSoZt3N3wMN0vC+g=;
        b=rSsATCehZZNYIJMHC3jEGZybZgjeAUWpsZoVOzCzFN38XlhRKkSA/jQWh/lnlDGCQO
         qK7Hse7L3bHuE5w7pyZaWVXmg/uiZ273QPsvobRFpWjAf+c+2cvfs+cKQHW6qWQr00r0
         1LRYXdtaln1HQzmxCmz4K2ENCZKyjVIa+K8j4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

Hello all,

In order to do NAT at user-space, I need to know about some aspects
related to connection tracking and NAT.
-With the "normal" kernel nat, where does the packet really get changed??
-The "normal" nat packet change happens before or after the packet is
enqueued to user-space by libnetfiltet_queue?
-How do I look for a TCP/IPv4 connection in the conntrack table using
packet's payload?
-What exactally does the ATTR_SNAT_IPV4, ATTR_DNAT_IPV4,
ATTR_SNAT_PORT and ATTR_DNAT_PORT attributes in the conntrack entry?

If somebody may help me, thanks in the advance.

--Bruno Moreira Guedes
