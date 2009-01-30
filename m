From: Mr Vandeley <mr.vandeley@gmail.com>
Subject: newbie question: UDP is stateless ... right?
Date: Fri, 30 Jan 2009 15:50:46 -0300
Message-ID: <87fa72960901301050n7d982887waadc1fc090fc96ed@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=igp9mPRELA/EK79J9ug5apMOxl7y/n2T57teBouPLp8=;
        b=anTw5vOEmnnO8C+biqh71Pk4YCfr0y1nFMRsI+QubPIvkA5ZjSNhyU5SsMFvKgAMrq
         aFUECQWOudxX1aYzvli1U4cOiU2TVYjWEM96NnvajjoJo7Oi9vS2GsinK8L7SOWh50kC
         6fE8JhF6A0VQmTdHU27XdDXie/fTSrAdqLxlk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
Please, excuse me this newbie question, but I don't understand
correctly. For what I know, UDP connections are not statefull, so I
can't track them... right?
What I've been doing on my firewalls was explicitely accepting
incoming packets from UDP privileged ports and so accepting answers to
my UDP requests. Now I have found that if I accept RELATED,ESTABLISHED
traffic without saying anything about the protocol, UDP answers will
be accepted.
I know that this isn't a question related to Netfilter but is the only
place I know to ask about this.

thanks.
