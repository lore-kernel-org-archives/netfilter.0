From: michael-dev <michael-dev@fami-braun.de>
Subject: ebtables  + nflog + ethernet headers
Date: Mon, 07 May 2012 14:47:51 +0200
Message-ID: <5374ff7cf71267e3283ba722ff8eef62@fami-braun.de>
Reply-To: <netfilter@vger.kernel.org>, <michael-dev@fami-braun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm using nflog to feed ethernet packets into a userspace daemon. 
Currently, the ethernet header gets truncated and I only see ip headers.
Is there a way to get the full packet including ethernet headers into 
userspace using netfilter log?

Regards,
  M. Braun
