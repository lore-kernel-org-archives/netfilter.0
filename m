From: Alan Lee <dbpalan@gmail.com>
Subject: TEE and port forwarding in same host
Date: Tue, 24 Apr 2012 09:58:02 +0800
Message-ID: <CABm9hxH92y8cnzbK2qpgGt8PY0g7rmy=3FKz7OJf2T-G=ysnag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=H8YN9cOI+vTqY8CDrulRdCAv2D+Qrm01TqxxxCF0te4=;
        b=BdOiH/5vKbfJlnr4Ua8HNW2h54JfTYSiCTpmDzxANidRv9rX7teXRUlGjQkcej+qSk
         XIC8wifRm9Xj2GdUD5lS6Dq2OTVL983BbxztKpcGDl1gwB+LBfs+CYt7axgLc3N9qDgA
         d9wV5ruUcAWmRIy9oAnFRbDdftONVznT9UoF7exO1jXhlvXNHREuXRU/aAS8hpVvkMGH
         xJhfb7OJrZ1Op4m0Two1L5zV1NCU1M+3v2G4/1w5fBRaM6DN8v9rvdOnSpHw5hpZJRTm
         QC2UyxWX6GAqfz65o8FlFNrLq76AF94p+9nraxCj+IGM2AxSiQAy57il2bmxxLkUV1k/
         DdzQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Server #1 192.168.1.1 UDP port 516 receiving traffic from multiple
hosts.  I want to make another application also receive the "raw"
incoming traffic to UDP port 2000 without any configuration change to
the syslog application with following attempt:

1. In server #1, setup TEE to replicate the traffic to server #2 port 516

        iptables -A PREROUTING -t mangle -i eth0 -p udp --dport 516 -j
TEE --gateway 192.168.1.2

2. In server #2, setup port forwarding from port 516 --> server #1 port 2000

        iptables -A PREROUTING -t nat -i eth0 -p udp -d 192.168.1.1
--dport 516 -j DNAT --to-destination 192.168.1.1:2000

The configuration works perfectly.  But it does not work without the
help of server #2.

Can anyone advice how to make both rules works only with server #1 ?
