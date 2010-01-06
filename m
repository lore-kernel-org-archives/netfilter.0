From: MargoAndTodd <margoandtodd@gmail.com>
Subject: How do I read my state from this log?
Date: Wed, 06 Jan 2010 11:40:10 -0800
Message-ID: <4B44E71A.5060301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=qUPg/ryPNh1mFZlDf0Os7wXiIzBXW6wRcdSw6O8VRjo=;
        b=lVoF0lKNZvQr5cFy5w4vqzUifMjD8bZISRRWbL+oQXL0haf78oigPyWVnxAJrotOBy
         q1iRzNfVChRglA4LK9QnQCoFz0Ft0uO6YrwBM7APOmFwYJ8iPabY9mQ7h8HmjgKY+/dh
         wUoxSw0qoJWAEX/MfGyaLRLCvvzPEq4FMvMVM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

How do I determine the "state" from from this logged packet?

kernel: dsl-out Everything Else IN= OUT=eth1 SRC=192.168.1.46 
DST=xxx.yyy.zzz.www LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=52504 DF 
PROTO=TCP SPT=60588 DPT=52423 WINDOW=5840 RES=0x00 SYN URGP=0


Many thanks,
-T
