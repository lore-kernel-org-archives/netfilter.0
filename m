From: AZ 9901 <az9901@gmail.com>
Subject: iptables as a protocol demultiplexer
Date: Tue, 12 Mar 2013 19:09:51 +0100
Message-ID: <E7857ABB-9A3D-4FB2-AFA9-B282454FC070@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:content-type:content-transfer-encoding:subject:date
         :message-id:to:mime-version:x-mailer;
        bh=fVxG+b/P09QKMRJzG8WiNAaz1lZTa2Idyk0fg+3tdf0=;
        b=MMhRZfYMQ2oC+vsQgZfACRzQ05mZHl397vT7UKjkdsJ4N0lCVHnvOSba42Xve/gE4/
         vHuqe2lASBwN1+BltmaTEfKQmtqVu1PFnxV2ofZmocDr1Y0Ohj5aUHeIRrYpd2GISeMv
         GnNYSJyNhUrppVvTLpeEs+0j+QKvWK3cfNQSzQIQukhtQC3aEsp7NkMT2jFdODG5DTa9
         zN6zeOmwaWpL2utGPToz6FGRBzy397lLdz4025uCd9AXzvBzQ7dVmrpwFWVU2uogUZwW
         kKqpUcibQhoRMWNyR/M9tOQcCoCh81X8Ua5TlfMQHlVPbuiVfAElpGSjoQTp5bkmzXyx
         7h4w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

sslh (http://www.rutschle.net/tech/sslh.shtml) works as a protocol demultiplexer, it allows to separate SSH and HTTPS streams which arrive on the same port (443 for instance).
I would like to do the same thing but with iptables only.
Is it possible ?
I think that using PREROUTING, string, conntrack... it could be.
I tried but I did not manage to make it work.

Could you help me ?

Thank you very much for your support !

Best regards,

Ben

