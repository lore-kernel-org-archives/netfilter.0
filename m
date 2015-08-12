From: Dmitry Liman <blaecwen@gmail.com>
Subject: nftables custom protocol filtering
Date: Wed, 12 Aug 2015 21:10:06 +0300
Message-ID: <CAFHr3L+b=QAzhE832-+4EwCbY0VY8A1Ye2ydO19G8QHbyVfoVA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Y+UVrnYVPghyzkFmjgD30HmU3NLUVOx/E5UvEpzcEBU=;
        b=wQZ9kulQrDnrZ4GV5YokMUx5bcOgzwJS8go/fxGDEX2RT+FWk9Cc9mWTOPU1zPLD0/
         8rhqZWLTX+mwLWuKH+xfTzHWEt3XscLzGnkmb40CTR81NNAvLvwV1ovC28XfWCaC8ChJ
         VAxPmSWgnOQP+ezrK4gMh3QeVm2jRfTx6m8//cxfFvs5XT8C9PJHjx6cmBuRTNJ1ZlId
         5IQy7oQjkRAKezb5VISiubgmBAS+Zk+pcccyW4dTZSMTsOKuU+WMBUukusytTAo9XnEd
         J/T2hfKZ8DwJ9Y6lppw80zH1CJvTAxKzHtlWj/MZ9xG0sHbefSEWp7RdIzOX/vC5gx2g
         fqhg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I need to filter packets in the industrial network, where there are
some specific protocols encapsulated in tcp (though some of them might
be on another layer). For example modbus.

Nftables greatly suits my needs when writing rules for tcp/ip stack,
but there are no support of industrial protocols in nftables.
On that link http://wiki.nftables.org/wiki-nftables/index.php/Main_differences_with_iptables
is said that there is some "relatively easy" way to add custom
protocol support in userspace. However, after some searching I have
not found that. So, how could I implement it?
