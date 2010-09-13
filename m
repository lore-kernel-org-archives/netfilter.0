From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: ULOGD and other logs
Date: Mon, 13 Sep 2010 18:42:37 +0530
Message-ID: <AANLkTi=tPs=39vmRzc=41z=Vt8kHmK7vygKrfn5=0rh=@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=vm4gb1G9NZ+iiR6CisohzQu8QmXusJwA9yAgmSCSAr0=;
        b=YEDVxIYsMHO3yfozyy1ILivUW36c/b3JCUk93QcsQr4cmVH5dnBX8VLjxlRZL7fzrC
         F/D97kZN7XAlYXsf+OhHrQmD8VNu145ftz3jh7mHcfIUDoMeVsGkz4yD9DZQtKTvZkhw
         /413hXHwlQRihh2b56ssAkcZlI/KtDaRdjeQ0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>, laforge@gnumonks.org

Hi ,

 I am using ulogd to   store iptables logs to /tmp/logfile.txt.  There
is an application ( say X ) running on userspace ( using nfqueue  in
FORWARD chain in filter table ) to do some kind of blocking  packets
based on time ( some  thing like a minimal parental control feature ).
I would also want to generate some logs and put into the same
/tmp/logfile.txt file.  Since  ulogd and  X are using same file , we
need some file locking mechanism. Is there any other way to forward
these message to netlink socket and ulogd can itself handle, so that i
dont have to do any kind of synchronization.

May be i can put the question in this way: Kernel is sending some
message and ulogd listens and receives the message on netlink socket.
Could any other application in userspace  , send some  message  to
this socket and ulogd can read and write to the log file f ?

Thanks,
Ratheesh
