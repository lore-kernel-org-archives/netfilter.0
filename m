From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: ULOG vs. NFQUEUE
Date: Fri, 30 Nov 2007 15:06:27 -0800
Message-ID: <d95317090711301506h43e67d07x55d7a8535f284606@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=N6E7XJu6dOqtv+rmeO9ZosZLU9MZlJFICP6GUF3lWAU=;
        b=sxQb1dMeMNaFO2OQN0mU3x34vzqWaqJNKGwFFfEks7fJUeLtU3VDp60kGFimHepM0386c+SJiCZYXv/FxISI2pV5KwUB/3Vk3IuBNFjhJwAW4DBdAde3WziRrcI7xMWJPTKyUbcEKbtb4BRfOfEBRStX9wJCMtMDrYvhQhHcZ6A=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I read about ULOG and NFQUEUE in the man page, and there is something
I don't understand, and that is, why is NFQUEUE needed.
If I understand this correctly, a ULOG target with no prefix, that
sends the entire packet to userland, and is followed by an equivalent
DROP rule, does the same thing as NFQUEUE.
Doesn't it ?
I admit that I am no big expert on nfnetlink_queue. Could I be missing
something there ?
