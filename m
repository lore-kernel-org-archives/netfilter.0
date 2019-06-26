From: Naruto Nguyen <narutonguyen2018@gmail.com>
Subject: Question about nf_conntrack_proto for IPsec
Date: Wed, 26 Jun 2019 18:06:45 +0700
Message-ID: <CANpxKHHXzrEpJPSj3x83+WE23G1W0KPz9XbG=fCVzS21+-BpfQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=m90tKDbIoQ6CgI7EuX/tJe0WMVlu0RpWKVwGqLrxzg0=;
        b=Xhnj6sHva5UgsbQUfTH3AGwsXB5sHyc7flB/orpM2Uc3SBKpX8A12ny3WjMpvVTWaP
         iWkR61qaItmgLRydDB1KtD7ELxeoxlagk8C/+ouGutlJLkEpn9r7yj9JJSDAioDARr3N
         zxQAOWJSL0V8zU6saDbOHBUG1vsMS4q0tK2JF0ta+hgF9QTq4MMO4a+qKlhekU7W0JNw
         s94teqE5PKmGLMTXb7T5+LxJW9+KEETa6ViEuQFLYJW4WBqYZ7mBDUmPJQPTpH7BJeyQ
         RI/Hmr9Z0VxpIl7lS3lknTKMqW3F98sF3PeK7KYbhDUF73mBKF0Rrmyh1/eRkoS3T7Mo
         DlGQ==
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org

Hi everyone,

In linux/latest/source/net/netfilter/ folder, I only see we have
nf_conntrack_proto_tcp.c, nf_conntrack_proto_udp.c and some other
conntrack implementations for other protocols but I do not see
nf_conntrack_proto for IPsec, so does it mean connection tracking
cannot track ESP or AH protocol as a connection. I mean when I use
"conntrack -L" command, I will not see ESP or AH  connection is saved
in conntrack list. Could you please help me to understand if conntrack
supports that and any reasons if it does not support?

Thanks a lot,
Brs,
Naruto
