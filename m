From: J Webster <jw.jwebster@gmail.com>
Subject: masquerade error
Date: Tue, 11 Oct 2011 08:01:12 +0100
Message-ID: <4E93E9B8.3010005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=8yY7gfeWxBsWptWGS4UZMN9uofI1DehpaZ4bmRRXpJk=;
        b=H4AiZxGESDsOcsqVVjL0ijJNoPMU1QaRq+ERYvDECZtAGXzH/OYiYJHeMIXJTyry8d
         tLfZZKXPEzaQEv5VrCF920bMgc/08M0HZveNxygymJsgFgozFvEj3h0P4qb+WXN8BEi/
         peedZRanBVn/YbfBFcatQ47Fcu4DFwe6kUUPg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to add forwarding rules for openvpn but I get an unknown
error on my virtual server.

Also, after running the command lines, none of the additions are
entered into the iptables script.

[root@vps8259 myscripts]# echo 1>  /proc/sys/net/ipv4/ip_forward
[root@vps8259 myscripts]# iptables -A FORWARD -m state --state  RELATED,ESTABLISHED -j ACCEPT
[root@vps8259 myscripts]# iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT
[root@vps8259 openvpn]# iptables -A FORWARD -s 172.16.0.0/24 -j ACCEPT
[root@vps8259 openvpn]# iptables -A FORWARD -j REJECT
[root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
iptables: Unknown error 4294967295
[root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
iptables: Unknown error 4294967295
  		 	   		

