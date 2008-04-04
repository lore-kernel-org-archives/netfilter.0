From: "Joel Pearson" <joel.pearson@gmail.com>
Subject: iptables equivalent of ssh local port forward.
Date: Sat, 5 Apr 2008 10:35:05 +1100
Message-ID: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=d1+iVMrPzanok6HmK7RovnsPD9WhXP/SGAskT0xQm4o=;
        b=bdC5N0c5n/WHhjMVvzYTin5rU6KjKrTKZ/s9ZKSO7DZEUJC8GdhgI31KKT7I6ZjIgZXDUUTT5/ckP9wr187bniDBHSZmXW0UHgCk8fUzGpRhXjfYYNG6RssvcBwOjfo3Qhb4bld7heXpDhj0JMLMktRgo+2zUkaZFxQZi8sj+P0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

What I'm trying to do seem simple, but I haven't managed to get it to work yet.

I can get ssh to do what I want, but it seems a little excessive.

This is my working ssh command:

ssh -f -N -g -L 143:192.168.1.4:143 root@192.168.1.4 (this is run from
192.168.1.3)

Basically I'm trying to forward imap from 192.168.1.3 to 192.168.1.4,
but for when I am connecting from the 192.168.1.x network.

I can get iptables forwarding to work fine if the source address is
from the internet, well a different interface anyway.  Using a DNAT
works fine in these circumstances.  But a DNAT doesn't work to forward
within the same subnet/interface it seems.

I'm sure this possible, but I can't figure out the correct rule.

So to be really clear I want to be able to connect to port 143 on
192.168.1.3 from 192.168.1.29 (for example) and have that request
forwarded to port 143 on 192.168.1.4

Can someone point me in the right direction?

Cheers,

-Joel
