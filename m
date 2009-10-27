From: Richard Horton <richard.horton@solstans.co.uk>
Subject: Stupid on state match
Date: Tue, 27 Oct 2009 16:01:19 +0000
Message-ID: <56378e320910270901q23369ecdxbc8e63e3a44e9031@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=geklGbE9q0wUdwyHW2GHsbE9WjRtOO2SugTEcyle3nk=;
        b=sC6JrC2XLxnSTsfC9WZIvQfnu0754o3yZRSfwIae5pLx8x04CGpJgvmc0PaKiP0WFC
         zKQSnTJNWCqapSe5TC2Yt9Uq/f9E1qzcFRVLJYtSUKHU54UMMBqbxLqre1c0EbEC9/US
         VS+3x0ktWMi0Rf+SWxcejrCHvIqrbXNVwSe+0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Quick one: Does the state match 'INVALID' include tcp connections in
an invalid state (e.g. fin when there is no valid connection, rst
without a valid connection etc)?


The man entry "Possible states are INVALID meaning that the packet
could not be identified for some reason which includes running out of
memory and ICMP errors which don't correspond to any known
connection," doesn't really clarify whether it will or will not...

(I know I can easily set up a test to prove it but just about to leave
for the day and just struck me I didn't know the answer)

-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
