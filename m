From: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Subject: New ndpi-netfilter release (3.0)
Date: Sat, 18 Jun 2016 13:51:29 -0400
Message-ID: <CACuyg26RysqviZt7yjrURyXHQ1N8kOcjU+kjyELyQtmOz3_Raw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=zwdpQyIXrkDwKLfSwI14nNF/VQq81w5SrDaFpgLMs1U=;
        b=viBYGiMXhOdCUGG0dbFS11YCa5kLy1pTwxOKDInvF/usKvinubrGIZZzosXFBmrDD0
         5F+GCyjQfOdv8s4R+cBXoNLjRrSftlon1dugjOcb0E0qpTY/3TJ+INtvP12Lw4KWgY6w
         7kVhr99SGmInHZVX1HVB0gb00aI2e2/aktMwQZQ8LW5PfcRxFVFGBlcc+IjsSCrPcOnr
         CFIhG7NhIzq20A7nWqzthmbRGFx4+0Okll37jWQ/Nl9j6hKDBY/rKLtsjFimpN+DEK+u
         C/4iqYNmIPPe3CutSCTVslPV2CCmjeOIYGDqq2rGX/+jpuPlt0c4vpGl/TzTJchOQGQx
         usBA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I already released an new ndpi-netfilter update for downloads (v3.0):
- more protocol detection (nDPI 1.8)
- spinlock fixes
- include debug param: modprobe xt_ndpi debug_dpi=1

Site: github.com/betolj/ndpi-netfilter
