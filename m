From: Timothy Arceri <t_arceri@yahoo.com.au>
Subject: Re: Simulating router breaking idle TCP connections with IPTABLES
Date: Mon, 6 May 2013 00:32:39 -0700 (PDT)
Message-ID: <1367825559.80527.BPMail_high_carrier@web163401.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.au; s=s1024; t=1367825559; bh=/ED3M+x8YXosh881LJHYcC2QzNLAGoQwbYN//TTG0dc=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=QD78TH5a47CTgK7ktmWkjpgIkbZLWKdQ0/KPLq7J+xbG0NFm4T4QLdf49cxO9Nyk9kmmd8MKotEdq5vqrXtImJvE75bAHufPSrms6RYJ42RvzaOWOMO7Y+0Z1lk8JgYCapDUQdLzSc84dW0xW6KffkN7B0ag0AZbe4iRYMkP3NQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


>Why dont you tune the system tcp stack then? All of what your asking for can be done by modifying the tcp settings... Tho of course >under normal cases its not recommended 


Thanks for you reply,


To answer your question: Because I dont know which settings will cause the scenario I described. Are you able to point out which settings I need to change?
I cant see any (with my limited knowledge) that will help.

Thanks,
Tim
