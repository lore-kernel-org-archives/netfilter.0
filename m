From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Squid Redirection
Date: Mon, 4 Jan 2010 10:31:25 -0800
Message-ID: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=Lvl/O9LVc1n1AG924h8VyMhfb2JMbAx0ux0AjEiO3kE=;
        b=FZNh8HsnLQSiYFhcrFnmopRKYqDlY7WSp7YLKR2jBqG5yWTkdjw/vlJCoCKWCKTAx9
         UxfrgkOSweNYAIGQlIuj3GPMVJyIUrZq8U4sk5GdEpYN3K4dLwOG4mbSySd0M2kNnapj
         e8Y2inU5thNwTYpavhG4kP+OFTTsRuekrYpxA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm running Squid on my gateway router (on the internal ethernet only
of course) and have been struggling to figure out how to redirect port
80 traffic to it (transparent proxy).  All the instructions I've seen
are for Squid hosted on another server.  Anyone have any tips?

-- 
Aaron Clausen
mightymartianca@gmail.com
