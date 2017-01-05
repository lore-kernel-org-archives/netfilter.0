From: Khawar Shehzad <shehzad.khawar@gmail.com>
Subject: Re: How to programmatically implement a firewall rule
Date: Thu, 5 Jan 2017 17:44:20 +0000
Message-ID: <CAE0moye-8YSBQJ5csQLxLi8DO0o4kDurvC=SDDMoofa1VAmTWw@mail.gmail.com>
References: <CAE0moyf85VpysmmCLa+dX4wtFZhDv+AVcxkM=BcCr=2hJ0mMBQ@mail.gmail.com>
 <1483635760.877444.838416369.2C081B0B@webmail.messagingengine.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=rzL6gUgf627XON4EkDSqcnk6Qw6ZnRW3s0Augj8wk2M=;
        b=hVbQ18MCRC8zy7bXtJBXkSOo8bO9RMPtjoIKe7KxuGYWo+wkvql1jpT0Gyk5e0siEm
         eDSiyvU44VQfcFPmEt12+NYWVr31s3k7OJCI+Z5JhzlGcmtn69YfntJl1Uoz1CniFPWg
         sg1yH7JClkdWHhmFzII92EtzCWCwxCUH05Ze2RPQs/FqCB0iOiQHlGlJZciJu5gyHYiY
         135lazIUPmIrgFjb7O5J7vV25HixKjyxJIppCF/ENMRRuQ57JoSEVmM5MbJASAPgg4ru
         ZW9+MCxc6tD90b7EOVE3h4+F/CYzqeRMo49oQTB2+y98VVykYoOJi276EfTeKOroio5s
         iAfg==
In-Reply-To: <1483635760.877444.838416369.2C081B0B@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jehan Tremback <jehan@altheamesh.com>
Cc: netfilter@vger.kernel.org

On Thu, Jan 5, 2017 at 5:02 PM, Jehan Tremback <jehan@altheamesh.com> wrote:
> altheamesh.com

Performance. In my case the rules get updated very often, and a lot of
rules get configured per second. So it all boils down to performance
for me.
