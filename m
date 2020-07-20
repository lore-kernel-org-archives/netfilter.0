From: "Austin Chamberlin" <austinchamberlin@fastmail.com>
Subject: No packets appear in ulogd.log
Date: Sun, 19 Jul 2020 17:19:44 -0700
Message-ID: <9025b776-21e6-42cb-b5df-60a412f1a9eb@www.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=lhRwrjWpBnVxfnUxcwGmEthjbuWm+moh0W96DaLPZK0=; b=TtqDabsf
        sut+14O/KJM8zlEXQOhD60Kx3K9r76V+eBdsty74mrl+jVo/yjLt4hLSB1VUswxb
        ceu6oDfjWhozz43cHFgdhDLUz+TUxNDcd1nlI+t2eFLRUUs8Ax7QnRu7nyr1O4lb
        gCv06bRLf4jS987UCry/37+E2JuMuhceylJ2uuwjTVBEGsFgjWyJta9a1Ul8g4TC
        W9F5Z+J5CtnZzSiSpH1p7+HKdksgqkR3JmAjBT/ifZoTIGo7JF2ETYSZaA27ybT7
        guFmps0AafUTT6G6fj5iYiXYtGRb9Eu+KkhEQoUe3Qs5saf45rATXhQBTtuectCy
        kohID7y/GRF4LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=lhRwrjWpBnVxfnUxcwGmEthjbuWm+
        moh0W96DaLPZK0=; b=qlRxpmJV6wZEEdLzhSwCbeyPsI21+TjcOLfOcXd8EuQOF
        aF6bdN+9/s8txV4Ywtc0Y3kPORzRfcFTPRFprrW9BPZZOsPagQ5XYHMm65PbmqUl
        rE+LP2P7rCIkSH0KYczPBzNFxKHtCHnVgoQjmnshOQ0qB1imZ9/TCBlTjNvOYvWZ
        ztiYMoVslITLJbOqtn3ZdM8+q8kKibYbYw05IL00q5PlLTt7JNxmV2dI8WasqbkT
        WL8vAF7GZxre6CBGriTAYAhBN0Q05ZspbmJZ4SQVqySa1Xn4k8s6EGtDXyEVMs/1
        XTYNItGcEn6smoW0mXldBnmScXcjHMW+31JMhamEQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all,
I'm attempting to trace icmp packets with ulogd but see no packets in /var/log/ulogd.log
Can you tell me what I've misconfigured?

Here are relevant configurations:

sudo iptables -L -t raw
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        
MARK       icmp --  anywhere             anywhere             MARK set 0x6a608a00
TRACE      all  --  anywhere             anywhere             mark match 0x6a608a00/0x7ffffe00

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        
MARK       icmp --  anywhere             anywhere             MARK set 0x775eca00
TRACE      all  --  anywhere             anywhere             mark match 0x775eca00/0x7ffffe00



cat /proc/net/netfilter/nf_log         
0 NONE (nfnetlink_log)
1 NONE (nfnetlink_log)
2 nfnetlink_log (nf_log_ipv4,nfnetlink_log)
3 NONE (nfnetlink_log)
4 NONE (nfnetlink_log)
5 NONE (nfnetlink_log)
6 NONE (nfnetlink_log)
7 NONE (nfnetlink_log)
8 NONE (nfnetlink_log)
9 NONE (nfnetlink_log)
10 NONE (nfnetlink_log)
11 NONE (nfnetlink_log)
12 NONE (nfnetlink_log)



cat /etc/ulogd.conf
[global]
logfile="/var/log/ulogd.log"
loglevel=1
rmem=131071
bufsize=150000

plugin="/usr/lib/ulogd/ulogd_inppkt_NFLOG.so"
plugin="/usr/lib/ulogd/ulogd_raw2packet_BASE.so"
plugin="/usr/lib/ulogd/ulogd_filter_IP2STR.so"
plugin="/usr/lib/ulogd/ulogd_filter_PRINTPKT.so"
plugin="/usr/lib/ulogd/ulogd_output_LOGEMU.so"
plugin="/usr/lib/ulogd/ulogd_filter_IFINDEX.so"

stack=log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu1:LOGEMU

[log1]
group=1

[emu1]
file=/var/log/ulogd.syslogemu


uname -sr
Linux 5.7.7-arch1-1

Thanks,
Austin
