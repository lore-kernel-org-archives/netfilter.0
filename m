From: Hang An <anhang610@gmail.com>
Subject: Can Not Send Netlink Messages with Unshare(CLONE_NEWNET)
Date: Thu, 17 Nov 2022 14:58:10 +0800
Message-ID: <CAKdx3iz3u9F5yq+fa1ScJ1BbnEpHaf8PcqrdeYynio=YYPSV_Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JfZR5tZLS1eboO9wLg4sHXYQwOpz2W8fCfO/YbyeNcM=;
        b=af8sHQ9bP4xGVwNGnrHvGy2p8IcPv8Y/1rvCdUJe1deoBGbqWYtk18h3yK8cd9tdLA
         r3Ua4B4KrghOB/yNq7mBsNxvm/ihMsILR5T4j5E+jAs50NvBG/z2G3pGwuzyOk4Ia2NB
         +HDbJ9vIeR3+d95qm0r9/7k/zjkl5m8n2vcGEbweY4ZYQbSpdzLlzoIaPg0Bk3PPUXVY
         uKanRVvhWizio0hgChDlY3WamZG92qbZPCVEr6egFEP9/ZEDTRlDHWrpHxjGPN4Q/FjY
         LaJCfnphWMTxWIwmygScPbZrSTE8jM+G/bSojXRD9KVrIE7ccM1cJHWZuLPcz/rQM9pZ
         Kb/Q==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
A process can not send netlink messages(errno is ECONNREFUSED) after
running unshare(CLONE_NEWNET).

Part of the call stack when process failed:
netlink_sendmsg
netlink_unicast
netlink_getsockbyportid
netlink_lookup(return NULL)

The corresponding pseudocode is shown below:
unshare(CLONE_NEWNET) ;
res_socket = syscall(__NR_socket, 0x10ul, 3ul, 8);
syscall(__NR_sendmsg, res_socket, msghdr, 0ul);

I can't understand  this situation. Is this deliberate design?

Thanks.
