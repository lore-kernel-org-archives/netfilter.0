From: khawar shehzad <shehzad.khawar@gmail.com>
Subject: Why can't we use DNAT in the INPUT Chain?
Date: Sat, 19 Aug 2017 13:36:20 +0100
Message-ID: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=YIORFgQV7VT73klynyvqeHdRZx4+bAvMcQ5Cz/s40OQ=;
        b=FX8Ef6TpmxcbAJZMeSnv0zxKUEUcRXTYqTfMcQuqlUqGM4fP/Vdf/vW1NEigZ+/QmA
         HwZVvghFlosqY11Crc+26g+z6DNa1gzBnd93GandqsuVMS1nYnlpATsUnJ2jPtCbGGor
         zfw6GhnkPki/5iFtuP39PE133wN2nxk71EHUx87oR1gibLdc03MhdhuMaNU5vsFA5dGv
         SXXjbhnrtKKMO953+zXaC0T7BYRPBI6Vq26Zyu97TbBxMal5z7LIXG7+IrlAtbJyGwP5
         ORe17i9E8MRkE6qm5Qr90xqaKrPFlMu2qr9nJgdFORPod55CA5Y0lXVYl9qqrvdjUdPf
         2geg==
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have a simple question, but I have a very compeling application which 
requires this feature.

I want to do DNAT in the INPUT chain. I am doing filtration at the 
PREROUTING chain (getting rid of some source IPs based on a vmap).

Those IPs which are accepted after the prerouting filter, I need to DNAT 
them only. I don't want to use router to do it in the FORWORD chain.

Any help will be much appreciated.

Cheers,

Khawar

