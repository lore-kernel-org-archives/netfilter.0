From: Peter Chacko <peterchacko35@gmail.com>
Subject: question about string matching and L7 filter..
Date: Mon, 31 Aug 2009 08:31:32 +0530
Message-ID: <1f808b4a0908302001w6ab93547o2ba3d5dc1e81f619@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=scR9nj2YiJ2WkKIP/NEGUdr4UWPmlgp/9ZTZn4oaBEE=;
        b=mG4ESMnAgG5nbMU/nJWPTHtFqus1Q2ASpBMurg0/RcDd/v8eFb9EGOn9wxfMXW+6yJ
         6g9xxncR3Z92p5yzGAA+5BCgqoipOW3lIa/+uxAhw76QNO5+Af/wAm6jNk19MbH+0Fjs
         KweTcP+uqEbrkvfmnneJYGHGgfdnpulhFXc/w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

If i  use advanced string matching capability of iptables, will it
work without connection tracking ? If it doesn't work, then it s
stateful and whats the difference between 2 cases when  i do the
following 2 things,

1) Use string matching on URL strings without L7 patch
2) Use L7 filter to match URL strings without using ipatable string
matching feature.

is this 2 features are going to be consolidated as the iptable core in
some way or L7 patch remains as an independent work ?

My goal here is to convert my Linux box as an Application layer
gateway with application specific bandwidth provisioning, redirection,
cache.

i  would greatly appreciate your thoughts.
-- 
Best regards,
Peter Chacko
