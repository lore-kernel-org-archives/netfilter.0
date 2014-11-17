From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Burst not working correctly in hashlimit !!!
Date: Mon, 17 Nov 2014 11:55:44 +0530
Message-ID: <CAA5aLPg_buoTtxE68iyG5Y1LJUvNwrA9tngSszLVf-cr+wsf2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=qigANwfyocOyca+YftTwe/I/FvLUyvSjyi8WW4aUd08=;
        b=0fg1DHo5BUs4Pi/GC5Hub799Qvz8F/a5CYNwLKay6fE5ulhTBfhCsAl1Qn80F310AQ
         zeUiED3PBvMnTN5AZjvBdBdG50Q++tEWC7lQhfwS+y97jzfHnrJwWJYKvCuo2cIZUpmd
         KUMeBDjIueoi6AXHCuVpBKN/rhxKrwLj43NuTeTclB1Stp8a2uGGGoIfMXSqRFsibG0e
         PjP7DSxhZfrVz6dC8KLw9tlni9V//Ce5GxHL8cgGmg+WKh1Zvs4EUSW7XIX0jKSOb0rw
         CXumRpu6ymSr8xmfrDOvSq7m+1axRer+9Oy7zMYUhx3CQxHuZ9wT5gqpdwUM8ZowTYeZ
         3Bhg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

For a rate of R/sec and burst of B,
for a traffic of duration N seconds, total packets allowed will either
be B or NxR, whichever is higher.

But in case of hashlimit it is NxR +B.

Is it incorrect or am I missing something?
