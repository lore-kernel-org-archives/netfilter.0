From: =?UTF-8?Q?Fred_Maranh=C3=A3o?= <fred.maranhao@gmail.com>
Subject: possible error in HOWTO
Date: Tue, 21 Apr 2020 23:56:48 -0300
Message-ID: <CAPr829kZmhNd7miZawg4wk4RH7D-Lb0gAknXka4yD9biWsMooQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=tmTVYPM9Iad3Ixt4W0XMEF0ivtDm9dhbpcAUgjwjAxs=;
        b=n53b060m/EzM91d4f8KqYCRjSPhFRMUMKf3fwugZ8W8XIlIpq36hXcl5PSeemV/vKM
         /qyNxoFJSyF6aD6JWCNvedRjrW8KymYQnRgP07g92AgmNu/e5CQphk7SSJlpmNhNT6bU
         nVSwrcVFoLFOVI0420JjJKZ+51nrbkXk+CGkcL4q9Cz03MUdM/XTwxupM9u2tvDTmp34
         2ouHmhmJNnbbqu+MT2lgQjZossK/POdgLhei3gfW15GE2OrRsjgZwjdz8WxR/WGCf6gk
         G7+yrHkNIPPxmAPwoeXKGLEAmBsCCD99YpRU9uKzxv+HOlTzae5aXsAxNmKc+kS0ofPB
         BXbA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

in page
https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains
section 'Deleting chains' says:

The only condition is that the chain you want to delete needs to be
empty, otherwise the kernel will tell you that such chain is in used.

it seems that this is no more true. for example:

# nft add rule inet filter forward tcp dport 1000 accept
# nft list ruleset
table inet filter {
    chain input {
        type filter hook input priority 0; policy accept;
    }

    chain forward {
        type filter hook forward priority 0; policy accept;
        tcp dport 1000 accept
    }

    chain output {
        type filter hook output priority 0; policy accept;
    }
}
# nft delete chain inet filter forward
# nft list ruleset
table inet filter {
    chain input {
        type filter hook input priority 0; policy accept;
    }

    chain output {
        type filter hook output priority 0; policy accept;
    }
}


Thanks
