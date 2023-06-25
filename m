From: "Jason Vas Dias" <jason.vas.dias@ptt.ie>
Subject: Linux netfilter / iptables : How to enable iptables TRACE chain
 handling with nf_log_syslog on RHEL8+?
Date: Sun, 25 Jun 2023 14:25:02 +0100
Message-ID: <hhttuv65e9.fsf@jvdspc.jvds.net>
Reply-To: "Jason Vas Dias" <jason.vas.dias@ptt.ie>,
          "Jason Vas Dias" <jason.vas.dias@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ptt-ie.20221208.gappssmtp.com; s=20221208; t=1687699504; x=1690291504;
        h=mime-version:message-id:date:reply-to:cc:subject:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdx+jmpZvU2v1S6IQOE0hbmqHzeCs2MU52rIPQmTrDI=;
        b=GKXN7WTTkBZsPTq5uXszzK7LhaJmNvfszWgpK4YmwlLFc54cgYsH7QN5OoAzaY82n5
         wTyke1eUmYzAmDj5kgvVFt0LKJG4qwFjF82VT6ZKawtI6dZs3RX4st0ig4L6IwLAnAMH
         PB0w0TxomQ2jtFh302AoZTjwnDAcbqS/ymTafravne1Hx5GnHVr/vvnyuv0sRQLapjHX
         8RRTnWj4MV6WlfLn1Si85IKun3sGg5Es3BgkRgw1ExsZO0FRHSlJMHL0KCsuT/jYXiTs
         RchtO7MLa4/z+CJkkwl/xWRg0EvfThy2Tog69IRCrRcPOXiIDeWMFKM2WlsW/V9LRcIU
         NsGQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org
Cc: Jason Vas Dias <jason.vas.dias@gmail.com>, Jason Vas Dias <jason.vas.dias@ptt.ie>


Good day -

  On a Linux RHEL8 system, I have enabled these iptables rules,
  which I am led to believe should enable ICMP packet syslog
  logging on interface ingress & egress :

    # iptables -L -t raw
    Chain PREROUTING (policy ACCEPT)
    target     prot opt source               destination         
    TRACE      icmp --  anywhere             anywhere            

    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination         
    TRACE      icmp --  anywhere             anywhere            

  As described at : https://access.redhat.com/solutions/2313671 I have done :

    # modprobe  nf_log_ipv4
    # sysctl -w net.netfilter.nf_log.2=nf_log_ipv4

  I also did:

    # modprobe nf_log_syslog

  which I am led to believe replaces all previous nf_log* or ipt_LOG
  modules in modern (RHEL8 4.18.x+) kernels.

  But, when I 'ping' a NAT'd (with iptables) IP address,
  no TRACE log messages appear in 'dmesg -c' output or in
  syslog (systemd.journald in use).

  What am I missing ?

  The most comprehensive discussion I have found on this issue so far on the web is at :

  https://backreference.org/2010/06/11/iptables-debugging/ (thanks waldner!)

  But this is getting rather old (2010-06-11) , and evidently does not
  apply to kernel 4.18+(RHEL) .

  I have duplicated precisely the steps above on Fedora-36
  (kernel v6.2.16) system , and it DOES work, TRACE log messages ARE generated :

  # iptables -t raw -A PREROUTING -p icmp -j TRACE
  # iptables -t raw -A OUTPUT -p icmp -j TRACE
  # modprobe nf_log_ipv4
  # echo nf_log_ipv4 > /proc/sys/net/netfilter/nf_log/2

  But, these steps, when repeated on a RHEL8 kernel 4.18.0-477.13.1
  host, do not work or produce any packet TRACE output in logs -
  this is what I am tearing what remains of my hair out trying to resolve.

  Thanks in advance for any informative replies .

Best Regards,
Jason Vas Dias (SW+SYS+NET)-Engineer, West Cork, Eire.
