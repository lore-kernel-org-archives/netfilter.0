From: Michael Dickensheets <michael.dickensheets@ionos.com>
Subject: Recovery of packet size
Date: Fri, 3 Dec 2021 14:16:42 +0100
Message-ID: <CAOuTwgT6D1sYxKSO-5M98NzmUScvTLpS8_iVH6qWOFtbv4TFDg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=IuwvDJs4wPzqR7EVn8t0s/iQplK40fYn/q1xBS/N7vY=;
        b=KC0JHRXrUuWYsOiDzi+5rWH9Ms/XU3s6lhGpXWcfRaRi6INiQ3DIdtMHdnIxe4vGKS
         H5YfbuGfCTSnGRxnHZMmqTAJic3gs85608Pkndzm2zGXMYurxp4WyjbymXX1ROBbJuNQ
         g82+wlwqlGmds9BYTAG3+Cy3E73STECeeMX+731FDV1D4jJr+9DvIRbckGUFniXU11cg
         UWvt6GS19cUWvBpqLEeECiWptsKOXfqQddmBGc1gkcZCI143EIAhMUW6qgtKjZNBuu+t
         m5GPbV9yxSAINoLlCO/Mq5NvywahMR+nygkLB3MvDYW+PZbaSoCq8txJVu4GEjKhZ83s
         hFtA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

We are trying to build fine-grained traffic accounting. Counters do
not provide sufficient details; we need timestamps for individual
packets, etc. We are trying to use logging target with the 'snaplen'
option to minimize overhead. What we are missing though is the size of
the original packet (skb->len). Is there a way to retrieve this value?

If this is not currently possible, how would we best go about adding
this functionality?

Best regards,
Michael Dickensheets
