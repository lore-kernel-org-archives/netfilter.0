From: Marco Padovan <evcz@evcz.tk>
Subject: hashlimit performance (--hashlimit-htable-size value)
Date: Wed, 11 Apr 2012 10:44:39 +0200
Message-ID: <4F854477.5070701@evcz.tk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :x-enigmail-version:openpgp:content-type:content-transfer-encoding;
        bh=YLHOCDXMBVsgfESidEgzYqqlvq3/m75NgU9d+MnfPQ8=;
        b=kfNIev1VRqLKlY4+cBPVLtpk8Hi4G6c1P0H37+hWqknLlyy629bUOV8aaLkEngNJyG
         AKzzVV6/DU4MNtNPUiVbnbxlC6CGayNZ0oNQCMcEv1W4k10Ip8x9HRzrK5YzLrdm5qt+
         oV6S8NssxwhC0Bo8UYHRGU+likyrxXA827qoE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

how far can I push --hashlimit-htable-max size?

I did some tests with 262144:
-m hashlimit --hashlimit-mode srcip --hashlimit-name testlimiter
--hashlimit 1/s --hashlimit-burst 10 --hashlimit-htable-size 4096
--hashlimit-htable-max 262144 -j RETURN

but it wasn't holding:

xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:05 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:10 white kernel: net_ratelimit: 239072 callbacks suppressed
xxxx:11:10 white kernel: xt_hashlimit: max count of 262144 reached
xxxx:11:10 white kernel: xt_hashlimit: max count of 262144 reached

Am I doing it wrong?

Should I set hashlimit-htable-size = hashlimit-htable-max in order to
achieve better performance and map 1 IP to 1 bucket?

I even tried to take a look at the module source code but I'm not
skilled enough to fully understand it :D

I'm asking if there is some in-depth documentation about how
hashlimit-htable-max interact with the other
parameters(--hashlimit-htable-expire & --hashlimit-htable-gcinterval) in
order to handle high traffic flows or if anyone got real world
experience taking hashlimit to the limit :)

Thank you

