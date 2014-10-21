From: vDev <vijaypas@gmail.com>
Subject: TCP LAST ACK incorrectly treated as invalid
Date: Mon, 20 Oct 2014 20:58:10 -0500
Message-ID: <CAC=w+U4oyXTXX1v04=yAYzt-+n5Lt=tLaKmD16m-QgjmUB9wNQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=OvYXlw3Ka04111/7sSBp2j5W0td+iIyQrRRbkJuF6KY=;
        b=Lq5exiWp6oxIXyxfwzT/CdI3jAL3iaD8Pth9MRTHZQkwkRZXhe8q5xpOB5BxdhJbhc
         KwnUBKWE1iIVufI93PN/qoBK9EIgjeE5o+QSJ7k8EJgnMJrvagsbgCn83r8rD7j8g2xP
         oOrcbo/PF2pYh3XIP/XV/Rt8OCcjZRlSi629ZZh3bGonCP2FRamdUhOAqIc39MVGLruA
         TftbygvS9dDIeRr08T7BVDxRf2ptWpBElcR0RsLAu66DrooUVvYpMyfbqTZA/Q6sKVts
         c0/On4fJL/EbZ9p9WX0ZvUfNiXQ0YxZRqXcJ6COsTZImRHN5zsRKBrG3hGZIp9riTcq6
         KW5w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

It looks like TCP conntrack is incorrectly treating "LAST ACK" (ACK
from peer for last FIN) as the sequence number comparison does not
take into account that the last ACK sequence number will be one
greater than the previous sequence number.

Here's the code that seems to be the cause of it in tcp_in_window()
[nf_conntrack_proto_tcp.c]:

       pr_debug("tcp_in_window: I=%i II=%i III=%i IV=%i\n",
                 before(seq, sender->td_maxend + 1),
                 after(end, sender->td_end - receiver->td_maxwin - 1),
                 before(sack, receiver->td_end + 1),
                 after(sack, receiver->td_end - MAXACKWINDOW(sender) - 1));

        if (before(seq, sender->td_maxend + 1) &&
            after(end, sender->td_end - receiver->td_maxwin - 1) &&
            before(sack, receiver->td_end + 1) &&
            after(sack, receiver->td_end - MAXACKWINDOW(sender) - 1)) {

III in pr_debug will be 0 as "before(sack, receiver->td_end + 1)" will
evaluate to false as sack will be equal to (receiver->td_end + 1) for
the last ACK. The sequence number will be one greater in the last ACK.

Any feedback will be helpful. Thanks for looking into this.
