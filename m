From: LakshmiPathi Raju Poranki <raju.poranki@gmail.com>
Subject: error during nfq_bind_pf() for PF_INET6
Date: Fri, 7 Jun 2013 21:31:16 +0530
Message-ID: <CAD5ayN1XXH7Q_VwN2yMyBG6cCd8rmCsbqigbH4YA2g-2jZ8JbA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=qGSaC/hewRkbdEk1FC+HiCnyOHqGUq24TGOCno4D928=;
        b=lO9ZP2uj2WhoKmykIiny8HUxVkmvqAxRmK3dsNsZ2vd8vzAbxzN34t72jOGCDnNlBv
         YyXUO4L0qdktUEpjf1vQBYO1GZxRyvTONWMnhra08Y5TqTJq0zLMt1kyoFzc06gx0Fvs
         3f1CO9Z8f+hgDvaerOQB6QFMskoA3ZduH2Svjb5ZB2p6QGrflenmB7cwiH3CZ4gnuBP1
         22NP05VTC6dIFQcZPSVVeJ1alBQsu7OBpscrlri9pp3RSvSxMDBCHP0SW2MoFKhlNMOu
         1biGz+ku+jDTN1uSh8fx83BZIHpQaGiicbjc8HIawePmytiuWTlhsGl8VRVLqJnmvlbB
         yaVw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Not able to bind nfnetlink_queue for ipv6. The following is the error message.

binding nfnetlink_queue as nf_queue handler for AF_INET6 family.
error during nfq_bind_pf()

Can someone please guide me to resolve the issue.


I have these modules

nfnetlink_queue        17149  0
nfnetlink              12906  1 nfnetlink_queue

--
Thanks,
Raju.
