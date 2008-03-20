From: "Ukeme Noah" <ukeme.noah@gmail.com>
Subject: server security
Date: Thu, 20 Mar 2008 09:30:43 -0400
Message-ID: <75949c000803200630v1c0fc090i6f1678b06815f4b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=kk1PyKbkYCjtQEP0OSSbH+6rVe9lTgcYeOpr8pV28SU=;
        b=RnLiYN990Wu8RXVgr7nnzhWXMlhNdWXXHL6COvwk2Khuoo2vmv8yyRiusLUfMsyHY01FWPIMXb+h+aSwo08eOCbIWXNANwoo8rfsA3D7W4Xs/df46pzGgXK4OH80qJExKekFsEOn3ZZ4o/NQSt5Qi98gX25gPj3WTY1JAjkLnQc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm currently working towards deploying a live streaming server on a
linux host. The host will be public and physically located at a
datacenter. It will have 3 [or at most 4] ports open. One will be for
ssh [i'll be using private keys for user validation], the second will
be for the streaming server[plan to use port 8000] and the last set
will be for the source of the live stream. I'm still working on the
rule sets for iptables. My default policy will be to drop all packets
and allow only required traffic. That said, is installing and
configuring Snort or an additional security system [eg: Tripwire..etc]
required/necessary.

warm regards,
ukeme noah
