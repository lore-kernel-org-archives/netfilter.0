From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Does the INVALID state filter block port (nmap) scans?
Date: Thu, 4 Feb 2010 11:41:58 +0000
Message-ID: <ac5c74141002040341m12a9abeaj9533c77ade2edec8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=t/zFZ1kI9OO1mS45JLG8ItICQ8BpuMfGexIjWXShU40=;
        b=jd7nmgPL4Z2zdgYpteumSgX1Z+wUZSbTcR2eDtt4P+VDV1PG9ReKxKOfPTtpoKeje3
         2PCTt4pPtEerd67sAIGdUaDar0B4TVIgS3ZnQW0eyqRJfseFNKEK8scHg8wjb6/kVq/B
         2KDx6eYVCjN4LDN+W4bquEKboPuEeUhEOwGAo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

Does the INVALID state filter prevent port (nmap) scans?

That is, would the following stateful rule:

iptables -A INPUT -m state --state INVALID -j DROP

do the same job as the following stateless rules?

iptables -A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK -m  -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
etc etc.
