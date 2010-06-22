From: Ninad A <ninad_adi@yahoo.com>
Subject: Blocking Ads.
Date: Tue, 22 Jun 2010 11:18:28 -0700 (PDT)
Message-ID: <868109.94510.qm@web112409.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1277230708; bh=nf7in+JzOKHviM31FCkp6xP0afLMlgDP66gAzB6YhvU=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=NXy8cdNYp5M5Iy44qvQQGzK7jw0lpiufn5StYvuezsklh6rvoDxznym9XR7XeEzBg2mezpfuVDP5IE8Ts+/2zuk3koMfwdfbPmIlzdwaV7SQQZ51Zs2fPs/1UNPaGXoiKGwDLZSeO/neY3n9tgkMiKWtTw1gDwUuls4sGlrCd64=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hope What I am asking is not idiotic.

When we block ads or any such things with iptables then there is lot of delay caused for the application to complete as it is expecting the data which has already been dropped.
Packets are dropped at IP Layer but who takes care of the delay caused to the application and how to minimize that delay ?

N.




      
