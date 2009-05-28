From: Emiliano Romero <emilianoromero@gmail.com>
Subject: iptables+nat+Tcp KeepAlive Problem
Date: Thu, 28 May 2009 18:19:11 -0300
Message-ID: <4A1EFFCF.9030500@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=EvbSe6YVx3y1G8qt1yROjiaIdXxaMqKYSYPOT4rE6t0=;
        b=x7O+t5Pad5gFxRSJ8Kv03UtITLbp2XguxolRDZpcD5ZihdDhTlK7RkATaLuVKlkOdO
         tO0VzAzeKqQOWzU08uGC7vG5o3URthBpvnvT3D0lH6vhPxDrAaZ2cvWeSaOgrOTzqhhi
         Mqd61onPZ70Ug1Wh2SU+PdnsJtQRDiRcbr2S8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi List!, I'm having some issue with iptables when I use DNAT. Using 
DNAT, when my router (iptables) gets a tcp KeepAlive Packet from remote 
site, it don't forward the tcp KeepAlive Request and responds with a TCP 
packet with ACK=1 and RST=1. So remote site thinks that there is no 
connection after some time. The problem is only with KeepAlive Packets, 
If I send normal Tcp Packets with data, they arrive to the destination I 
used in DNAT.

Any help or idea of where start looking? Iptables support Tcp KeepAlive 
redirects?

iptables version: v1.4.1.1
Kernel: 2.6.28-11-generic

iptable rule:
iptables -t nat -A PREROUTING -p tcp --dport 5555 -j DNAT 
--to-destination 192.168.1.100

Wireshark TCP Packets:
186449	11772.258110	200.49.201.26=>172.16.102.11	TCP	[TCP ZeroWindow] 
[TCP Keep-Alive] 14032 > 5555 [] Seq=10 Win=0 Len=0
188417	11835.763745	172.16.102.11=>200.49.201.26	TCP	5555 > 48538 [RST, 
ACK] Seq=1012825070 Ack=10 Win=0 Len=0


Thanks and Regards.
