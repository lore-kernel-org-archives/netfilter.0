From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: rx interrupt in userspace
Date: Tue, 20 Apr 2010 23:01:38 +0530
Message-ID: <p2mcfeab66d1004201031u233ce827w8874c7ecf45575f6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=uG3dAaJlNVBGrNuzd1hFtflEE57mMOmNu+d1+DCcOeU=;
        b=Xo2kP4C+6ordmiQEendECanTrYBcqNVMSw/hfictaQum01WLi89/YcHN+eItF87IYL
         1hGSwbCIXlB+u7V8NGNQePpKesyAaJo5fQf0IBtukHvynnQKEqI/5RJ9aHQWyttrqCvX
         VpvUwL+tXAga4TcRZlBFS8Pg9XtSGKI1j92Zs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi ,

 When flooding of network  packets happens on network card  ,  my
linux embedded box becomes unrepsonsive because softirq_rx eats up
hell a lot of CPU . I want  top half of tx interrupt to be in User
space . I want to implement some alogoritm in userspace  to drop
packets on high flooding and to keep other processes's some cycles .

Could you guide me a little on this , any online turorials or articles
or books , i can refer ?
Any similar implementation like this ?


Thanks,
Ratheesh.
