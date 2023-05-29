From: Igor de Paula <igordptx@gmail.com>
Subject: Using netfilter to listen on events not working
Date: Mon, 29 May 2023 17:48:04 +0100
Message-ID: <CALDr01QiRCzU4ADjAVHLzevGAfYOGQz60hh3sBNLCxU9+xXFqw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378895; x=1687970895;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eipSs2hqF4R1UvFja9tDktP9VtdP3SH9KgnViqx0nNQ=;
        b=oRxxNEi3gvpEh/KVFMnW+6sfpPDTNVeR+aHVtiY0LvzR8bpGiRAmxYqFjgEaPwFFeb
         xfXUPc4D214mDftdHZ/M4mboFI+/TDXvHiMwBc3s431QDqAY5FYhmSXnFObmpQjHZbnw
         CLTXt56aiYIKd5d7SrpyKwZOGLfuudbHfkoOAgAaXOGlNNXtrX6FTEClqXluLFhuNT34
         D6r2x8fGXQ5VfHDcx+XtJxBk1A+moiC1FQIyL7Zme8hV+rPNScCgkZVSBw/BG/TNv0Ec
         IcfudD6wYFOTm2EqqqaWiW2guqedvIZre6Mcc1UFX3j6H6jza8V6MnDTCqx0B8TXYwnR
         jkpQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
I have a DPDK application, and for every HW port the DPDK uses I have
a virtio_user port with the vhost-kernel as an interface to the
kernel.
For example, my goal is to be able to run TCPDUMP on the port that is
used by the DPDK.
For that I have a promiscuous flag that I want to turn on when TCPDUMP
is trying to get the packet going to the port, so DPDK will send all
packets to the virtio_user port.
To do that I have set up a netfiler listener like so:
    struct mnl_socket *nl;
    char buf[MNL_SOCKET_BUFFER_SIZE];
    int ret;

    nl = mnl_socket_open(NETLINK_ROUTE);
    if (nl == NULL)
    {
        perror("mnl_socket_open");
        exit(EXIT_FAILURE);
    }

    if (mnl_socket_bind(nl, RTMGRP_LINK | RTMGRP_IPV4_IFADDR,
MNL_SOCKET_AUTOPID) < 0)
    {
        perror("mnl_socket_bind");
        exit(EXIT_FAILURE);
    }

    ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
    while (ret > 0)
    {
        ret = mnl_cb_run(buf, ret, 0, 0, data_cb, NULL);
        if (ret <= 0)
            break;
        ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
    }
    if (ret == -1)
    {
        perror("error");
        exit(EXIT_FAILURE);
    }

    mnl_socket_close(nl);

    return 0;

I have a problem that I see the interfaces I have created using "ip a".
But no packets arrive from the netlink socket.
I am setting it up in a different namespace, can that cause an issue?
I thought as long as "ip a" shows the interfaces, it should work.

Any help will be appreciated
