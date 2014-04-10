From: Rohit Bhat <rohitbhat.nitk@gmail.com>
Subject: Read stats for a single rule
Date: Wed, 9 Apr 2014 21:52:13 -0500
Message-ID: <CAD2=Ax2nR5fwWqNa5K+AQ7DN_gbEWD1gSx_uNB0esu2cEQri_w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=C/n3EjpoGk6b9hM7LI4UHwsSjvMQGz36Bbu/qY/xQjQ=;
        b=LnM1UMVllcQe5u+vuYivfFYCPFnJHbEMmUppL5dwbrTCmkGcb60JR/z6rqVWCtPVxn
         kMEGmOuYehvYJ1C44L/1JUuNTOhb3dIm45+cIMYPHxL7i8iJsos9IA+xWD1DnufqaA7E
         gRGwG+q7+y/BzZ5R1RDrCUNAAYYKqHJCPmnPjBQiU3w5JbCD3iXBG8QMH36FNYw8LxwT
         1kZCl0eoS3c1H2/n8K/eAiJvVupFZwRI13xn3oFRPbZ6/AmA+a2Yz5JnEHRo7ENb85js
         uuXg+lsZ6YBtqwVIYHW1ohtaqqIFfLddXxhUjNdeLQmk6RSfb/JjteyIuvD7tNBsLmf2
         n7Cg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have installed multiple rules using iptables on my machines. These
rules keep a track of how much data has been sent to/from my machine
on a specific TCP socket.

Once a TCP connection terminates, i want to read the data transferred
over that socket.
Currently i am using "iptables -vnL <chain_name>" to read stats of all
installed rules and then filter out the one that matches the recently
closed socket.

Is there a way by which i can just get stats of a specific rule rather
then fetching data for all installed rules?

Thanks,
Rohit
