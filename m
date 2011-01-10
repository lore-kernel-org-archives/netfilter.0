From: Ajay Lele <ajay.lele@gmail.com>
Subject: nfq_bind_pf() simultaneously in 2 separate programs?
Date: Mon, 10 Jan 2011 12:31:42 -0800
Message-ID: <AANLkTikumMyi8wSQt1ipz10w0TDyjqo6g8Wet-QJ63Pq@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=2xn4l+403AuLNeyxhaiu2KctLlcDtqeV9ipLNa+ttd0=;
        b=QvJ6HB8HboNN0PTlFlZhWWlPSOFXvQM4i+Bf0guo7WPrpMdh9YbkstkLTO4lO5xNyK
         k4SNN+rRf//romQ4Zqhx9+zAJjrE5tceZCy1ygFDaDFI5tqy7XbWJTCqhx1McqKWnyrS
         V6Y1q5hyVuoSBOofKULQdjs/z8oPr+2ygXEw8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All

I am using netfilter_queue library (version 1.0.0, nfnetlink version
1.0.0) to queue certain packets to user-space and it works great

Now I want to run 2 instances on this program simultaneously with each
program receiving and processing packets received on a different
queue. The 1st instance of program runs fine, but call to
nfq_unbind_pf()/nfq_bind_pf() for AF_INET fail in the 2nd instance

Is it not possible to use netfilter_queue APIs simultaneously in 2
programs when each one of them is listening to a separate queue? Any
other approach which can be used to get this to work? - I don't want
to merge the processing of packets on the 2 queues into a single
program

Thanks in advance

Regards
Ajay
