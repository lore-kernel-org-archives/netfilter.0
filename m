From: Andrew Clark <andrewclarkii@gmail.com>
Subject: Re: exclude named sets
Date: Fri, 20 May 2022 12:01:31 +0300
Message-ID: <CAMsxNkTfGW+dhr32RYFxn1rdJDRCSBFms_fJa5UVhPb-Piad-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Io0CY9DZvErjth3i7cQ9aIVDnjxqGroW5MG3XQctAOg=;
        b=TIgAhJgjbR1K8cLwh7/qGcJ+chO1H/nfgUw1U548U2Sd1Y0nT/sv34Yc2UmgVCGJJn
         QlNQswy9/VwHwrk5PkReXlo9WapG0voO5d6J3OBT/KlCLbP9cQtkRWLWMDb6rku3JLKK
         RwQt7DEazpgMai9qc+Yku37nAoanB6ACNGlxEhj4NkiN2Mn1QhnqeFgFqcodiJ4yVryk
         qhsG/vEt4frxxjDJjsUu+xNKdFqkghA5IYJNslzHXCyzGOB9xJnXyK0oUqUqaA0DX1KZ
         osfZvKSvdB6xngfdo5PpF4jSP2hN+Z0ilYDs5MiqXnlu7PAHGnYziOzWSMha4/fWCAjZ
         a46A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thank you for your answer Kamil!
Under words "not valid" I mean this:

root@anvil:~# /usr/sbin/nft -f /etc/nftables.conf
/etc/nftables.conf:113:48-48: Error: syntax error, unexpected @
                iifname $int_ifs ip daddr != { @stormwall, @akamai }
meta l4proto tcp redirect to :9051
                                               ^
root@anvil:~# vim /etc/nftables.conf
root@anvil:~# /usr/sbin/nft -f /etc/nftables.conf
/etc/nftables.conf:113:49-57: Error: unknown identifier 'stormwall'
                iifname $int_ifs ip daddr != { $stormwall, $akamai }
meta l4proto tcp redirect to :9051
                                                ^^^^^^^^^
Your proposal:

iifname $int_ifs ip daddr != @akamai meta l4proto tcp redirect to :9051

Also does not work.


-- 
Talk is cheap, show me the code (c) Linus Torvalds
