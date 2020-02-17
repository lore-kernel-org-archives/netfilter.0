From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: NFQUEUE/iptables and kernel warning messages for net/ipv4/tcp_output.c
Date: Mon, 17 Feb 2020 18:30:48 +0100
Message-ID: <CABLYT9gNPFh7RpwE8P3uZyLKBM-_6ctpg7_8BPo4iCN3PWMQOQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=eJYq///UjqxDgrvVT6wuAefz/4j/Z2xeEPYJTav8wqE=;
        b=oYrIoNKrBlEMY1tYF7IpUB3oNMDfKYEF88BqiJYMuoZWLi6afDHFn4ncH2qVoED5OO
         3YueU8AvGJVh4YYw0pX0iU1biutHd7KDl4RCjNATF8Axn/D8lmIJWADZdgGnZTtlcXYg
         SUPgkYg5y1w+OdfsJOClT6JQWeKvdH3SGnSPS3EYdk3M4JEjODmPvWq6IpZu+i8KXL1X
         M04uhWLKzPIR4ozLjTi9ikuDwVvZcwGEidU0eLbAiNEtqwY9/172smN4+M4MMt1K0zR8
         tPVvPtMXbD7Emns3gxdOIyxxATQrzjGBde8DMXXoN2KJsOtSPVaxGvqx0UomiThZJ2xP
         9+VQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Whenever I use NFQUEUE/iptables to send traffic to an IDS/IPS (eg.
Suricata), I get an ugly kernel warning which can sometimes and on the
long run turn into a system freeze.

I'm using NFQUEUE 0:5, and I'm running Suricata with -q 0 -q 1 -q 2 -q
3 -q 4 -q 5 as arguments.

I've already reported the issue on the LKML here:

https://lkml.org/lkml/2020/2/13/1255

However, I've been told by the Suricata ML to try and post here too.

The message "WARNING: CPU: * at net/ipv4/tcp_output.c:915" does not
appear when I stop using Suricata with NFQUEUE.

Regards,

Vieri
