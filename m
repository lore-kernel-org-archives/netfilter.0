From: linkod <linkod11@gmail.com>
Subject: how to use iptables with bridge?
Date: Mon, 11 Jan 2016 15:22:27 +0500
Message-ID: <F2FC8D08-9808-499E-BD69-68C563AA5955@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:subject:message-id:date
         :to:mime-version;
        bh=jsdDEd9XncwuiytVZ388VLhf/m1kRXKtJQ2dyqmxB6U=;
        b=0317ur2eC6IX6VVBnXomKVazkEHmqO0pBgmZok21L/Dle8dXDMZkV2qwImBqYmjlnY
         0AurPXaFkOritpOYzTxGLZG0nLvvbNln52FZ5F8zLm4g2oyAg63cipWeYJYK96zFYORH
         +RbojCxb/66u3U/wXLZF7OeIbYxjKT7YungTurOtwYnTjGcnA2PV3eecaSfrUcgWLqxR
         1klAyZuQmElT8JLHB0GFuCMq78yZSUy6GlY4PXxdo1+rCM8ErZISGFAnxyRsb5SzhhlU
         jmAai1e2hAXqbr5/FAQNY35p7RaJ85Y/gu77br/+Vz002Z2u5rFZOgrHrGAANTh7lHFd
         o3hQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hello,

1)  I tried to use that http://www.ibiblio.org/pub/Linux/docs/howto/oth=
er-formats/html_single/Ethernet-Bridge-netfilter-HOWTO.html=20
but it doesn=92t work.
2)  I used physdev and it=92s work, but it is not good way to use users=
pace.=20

So, can you explain or give me the correct document that says how to us=
e routing with bridge and then send the packages to iptables?

I use ubuntu 14.04.3 minimal with 2 ethernets.