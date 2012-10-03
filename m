From: "Colin 't Hart" <colin@sharpheart.org>
Subject: Application Level Gateway for HTTP?
Date: Wed, 3 Oct 2012 15:23:58 +0200
Message-ID: <CAMon-aRHugAWLrS=eCyUTLeDeDGsj7mWRY7C+b853ZNeV2Pdhg@mail.gmail.com>
References: <CAMon-aTpTkZgpXfCfNEZCXqQvna53UeG9AJd6C0X+KNQq-Cfmg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=XxkKNVNa2RHIROPUFzleRuBJ5b+mVxA4yDhrVv5VoKA=;
        b=NHHqGh7inXxoJj5DLCZslng/TQMFCPo+zAJJHhRV0Y/enS9EyXMdinyfeZD7ngD7Qa
         idXQWBKqSLhzJtEQSjxAf3MEE93F3TO8WmQhAc/yJlRUM8Sw7ZIO/GNhiHtxC9gzBhXV
         ahrnsNoroRNPzMMR+Q30jbw7aej7pzWgSbkU0nt33KsfUbnioGo9nT/owFDiVQs0sXsZ
         aMoZW50/+nAZJSAKd0O5xlD1FBtQedEPQOoMJw6M8xvEF0etOXZqIDIRos7p1iyna/ba
         m7tPH5ChMpowdthd5gpuBpZnIT6UmJD4JqhNOY62LDR3Q3r0N4v2gin6KYBZ5Hvu7kK6
         7XUw==
In-Reply-To: <CAMon-aTpTkZgpXfCfNEZCXqQvna53UeG9AJd6C0X+KNQq-Cfmg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Has anyone here used netfilter to make an Application Level Gateway for HTTP?

What I'm looking for is an "HTTP router" or "HTTP reverse proxy" that
can route requests for resources received via HTTP to the appropriate
(internal) web server.

We develop and host applications for our clients and such an HTTP
router would simply admin for us significantly.


While I can install an HTTP reverse proxy server, I don't need any of
the other features that such a server would provide, purely the
routing part, so I thought that netfilter should be able to do the
job.

In particular, could string matching be used to achieve this?


Thanks,

Colin
