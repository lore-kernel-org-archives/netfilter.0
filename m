From: Nayan Gadre <beejoy.nayan@gmail.com>
Subject: Doubt on Iptables protocol extension
Date: Tue, 11 Jul 2023 19:20:34 +0530
Message-ID: <CABTgHButSdTAUEh0j7YApZKB9MddnGHvKT-Bn35DwxrduHzo-Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689083446; x=1691675446;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wRHrLbHDRmRebUrrWEuElnIT9hqJDry4iE/6qkcOxd4=;
        b=IlPSNTPVKTZ1chBW9xiP9ZYM4JsR5iWh5jS+Sxt1K7jLynhBDLmnEECi+6IpPKi5X2
         Ot2caOkXzylZmbLgEn42AzC8xO3JV28G7wE0NSEEA9Cf5fr1Ep00pvPD5XkbKYbYjxZF
         1vO1ceFKItXDRMRgrM+R9tOtDFlSInu4NugMJu1BudGEaaTTvS3Wat+teoBY7xCapb9G
         5yPsnzGVifLY0VuoZ8mcevv29Y/rT3dPk2NxYZQrWrCrifFbbmmiGDVNrsOtxVbimQ6m
         yPM1E/YDOsTUCGeOn2qAoGxGobuuNFvBEFqTirYE7Ba4PtbqkzBtZXAc45+bj4wCQSpQ
         unjw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I was reading difference between iptables and nftables and why
nftables are better.
I came across this statement "The user space tools simply generate the
bytecode and pass it to the kernel for execution allowing new
protocols to be supported without kernel changes.". I wanted to know,
example of any protocol (which would have to be compiled as separate
kernel module in case of iptables) that nftables solves without
compiling kernel modules.

Thanks
N Gadre
