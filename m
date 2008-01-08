From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: conntrack & valgrind
Date: Tue, 8 Jan 2008 01:12:53 -0800
Message-ID: <d95317090801080112v662f7fcdk36b582d14557896d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=bZaIDE9zU8FZCxEKr5J9YX9PVcyrbl0lynoWfezgJ3w=;
        b=BULGDo+r74Q1OEeb8nOW4PTM4DIFiip3nqDncZpDDqfSGnpoOviVMHrsTbzE52jfTJVSF2d4ZC/ji5px75aX+4KTo6etM3Y+byDFLUFKPDLv7tR3e1Pszvg5nOG/hZGtgzgC0hYH8Hf33MAh2Yz13QUUwMIOZc+0nwJHnmpxjpg=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Is conntrack supposed to be "valgrind clean" ?
I ran a few times "valgrind  --tool=memcheck --show-reachable=yes conntrack -L"
and I always get different "Invalid read of size " messages.

The messages always seem to appear before the first listed connection.
I tried to track this down in the code, and I suspect it has to do
with the NL message alignment in nfnl_step, but this is only a hunch.
