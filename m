From: "Jianqing Zhang" <arrow.jianqing@gmail.com>
Subject: (unknown)
Date: Fri, 31 Oct 2008 02:14:42 -0500
Message-ID: <8a38e1330810310014l25fc5335h70fc2e72f83737f0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=nJbwE+e3nW+YXwEtGddcISfwt+SKALeu/IkbIzYU5OY=;
        b=t/VDvDmlhPNPgf5A6xaoukwHaJxlohQuGlS6LqN+VsltWfP83uV7HiEzzsju0+GSuY
         QyiO4gLYFJTMV/58fJYyw2ayiNOqqIfXs+GvQUTiWtayDQlEW8ke7iQCAkcUW15lm81x
         ldFZ15zfhIEoUxPxYL4vXj+9Zl6cksgMrdzPc=
Subject: 
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I use iptables to filter incoming packets with some particular
protocols, such as ICMP, and the target is QUEUE.

=============================

Chain INPUT (policy ACCEPT)
target prot opt source destination
QUEUE icmp -- anywhere anywhere

Chain FORWARD (policy ACCEPT)
target prot opt source destination

Chain OUTPUT (policy ACCEPT)
target prot opt source destination

============================

How can I check the packets are filtered and put in the QUEUE?

Thanks
