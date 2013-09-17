From: Anand Raj Manickam <anandrm@gmail.com>
Subject: nftables setup
Date: Tue, 17 Sep 2013 22:32:59 +0530
Message-ID: <CAEyr1FS_PgdDjk=TLLTi=ut0eUu-X7zPZgJuhy2PP4ovJ2fSwQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=PJGnNhJWne4ubgIG14K6j+D5nFPTMtLvr1k5vd53V6A=;
        b=gBPkM/MxnvN8S45ySvEZrtE0o3pr5lWpBBbJwRv1zg3UbfWBwLrvHYs6U7rn1Ah3ts
         teGou+v5aJHONrYU/6mP6qtanpJt/KuRQXhkmnHVLKSMzilHHPkx33JduVSobQQE0YLj
         G0zAQTjV5MGyUFx0wdXiN6JlTk/IjKOJP2I8nZ0YZqvi3gjAezhAOsCia2q5noAvsp7H
         iSmZNqFA6X/U/Z1i49cqjkmubh0OEiACK0Hb9xKzCMFC6gYN61nwIoYP+2HJlv9z2iG9
         zXVOw+688v40vsI7afjHErrtpcdf5o2ZRyJh5Mbk9mTqKE2fd9YgpbXyxVXejfYUwvUJ
         QXKw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

  I have the setup running with help from
  https://home.regit.org/netfilter-en/nftables-quick-howto/ .
  I have done some basic rule add / delete /drop tests .
  At this point i  dn't see a option to replace a rule , which used to
  be with iptables.

  After upgrading the git to latest , rebuilding the kernel and other tools.
  Now i face this problem :

  #nft -f files/nftables/ipv4-filter

  In file included from internal:0:0-0:
  files/nftables/ipv4-filter:4:35-38: Error: syntax error, unexpected hook
  chain input { hook NF_INET_LOCAL_IN 0; }
                                    ^^^^
  Can you help me with some pointer to proceed...
Thanks,
Anand
