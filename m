From: =?UTF-8?B?SHViZXJ0IFN0cmF1w58=?= <strauss.hubert@gmx.de>
Subject: Modify SSL packets with Scapy
Date: Sun, 03 May 2015 20:11:39 +0200
Message-ID: <554664DB.4040007@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
currently I am trying to modify SSL Client Hello packets that are sent 
from client A to server B.
I have set up iptables to move packets into nfqueue:
iptables -t mangle -A PREROUTING -p tcp --dport 443 -j NFQUEUE
Here is the definition of the callback function for the received SSL 
packets:
def callback(i,payload):
   data = payload.get_data()
   pkt = IP(data)

   if pkt.haslayer(SSLv2ClientHello):
     pkt.show()

   payload.set_verdict(nfqueue.NF_ACCEPT)

So far everything works fine, if I create a SSL connection between A and 
B, the packets get redirected through the nfqueue. If the Client Hello 
shows up, it will be displayed. It should also be noted that I use the 
scapy-ssl_tls library (https://github.com/tintinweb/scapy-ssl_tls) to 
get a SSL layer for scapy.
But displaying Client Hello is not everything I want to do, I actually 
want to modify it. So I tried the following:
def callback(i,payload):
   data = payload.get_data()
   pkt = IP(data)

   if pkt.haslayer(SSLv2ClientHello):
     pkt.show()

   ret = payload.set_verdict_modified(nfqueue.NF_ACCEPT, str(pkt), len(pkt))
   print ("ret = {}".format(ret))

This should not modify the packet at all. Basically I just use 
set_verdict_modified instead of set_verdict. I used this simple test to 
see if the method that I will need later on, for real modification, 
works. Also there is no need to recompute the length or checksum (at 
least I think so). But now the trouble begins, If I create a SSL 
connection between A and B, the connection will not be established. The 
method returns "88" (I could not find a source to figure out what that 
means) and Wireshark shows a lot of TCP Retransmissions for Client Hello.

My guess is that the packet gets modified somehow and therefore a manual 
forward (set_verdict_modified) does not work, whereas the automatic 
forwarding (set_verdict) does work because the packet is not modified. 
Hopefully someone can help me with this quite specific problem.

Best regards,
Hubert
