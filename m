From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: debugging a libnetfilter_queue program and stdout
Date: Wed, 17 Feb 2016 14:12:20 -0500
Message-ID: <0O2P00CI3HCLQG40@vms173025.mailsrvcs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I wrote a program using libnetfilter_queue. Call it "tst". 
It normally runs as a service, but when I am debugging it, I
put some printf statements in it and run it in the foreground
by typing:

   tst

and the printf results appear on the screen as expected. However,
if I expect a long output, I would rather type:

   tst > log

hoping to see the results in the file "log".  However, "log" is
always empty, even though I have other indications that "tst" is
running.

Why is this?  Is there anything I could do to get the printf
results to appear in "log"?

Thanks,
Mike.

--
Michael D. Berger
m.d.berger@ieee.org
http://www.rosemike.net/
 

