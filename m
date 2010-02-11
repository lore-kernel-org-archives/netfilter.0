From: Payam Chychi <pchychi@gmail.com>
Subject: performance testing iptables...
Date: Wed, 10 Feb 2010 23:46:40 -0800
Message-ID: <f08c15d11002102346n6dade2dgd00185620dc373e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=MLh0JtAe6QQi9sI05We4W7KiQtOj/JE4cOt3L/MlV7k=;
        b=OHZjfPJbv0NFQ91kj2bhtY6VFsJM+T+oN2UaJOvI0P2VQhQH6J06CNUY6um2gAz2bP
         FP+jbOpVqKaLbqAuetGUoXtMEtBm9s6yA4Uz348RDT9QGvHy8eTkZgR0cdfcj6i9Zk0B
         RN7d9XQAUp3Lwtwbkr5yeHrjR0n3nVICsUs3U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Guys,

Ive been reading all over the web on performance tests done against
iptables and its ability to perform both state and non-state
filtering. I am setting up a pretty decent server for some testing and
I was wondering if you guys could give me some ideas on how to fully
push iptables to its limits (different type of traffic, different
usage, string matching/u32 module and such...)

Server consists of:
Quad Cor Intel(R) Xeon(R) CPU           E5420  @ 2.50GHz
32gig Ram
220gig Sata (not worried about this as im trying to keep most things in ram)
Intel Gig nics

Running:
Debian 5.0 + grsec

I will later post results and poc online for others to view
Any/All ideas are welcome =)

Thanks,
-- 
Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer
