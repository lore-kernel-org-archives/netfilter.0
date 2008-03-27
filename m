From: <pyoder3@verizon.net>
Subject: nf_conntrack_tcp_timeout_close value
Date: Thu, 27 Mar 2008 15:58:30 -0500 (CDT)
Message-ID: <19200036.1321831206651510533.JavaMail.root@vms069.mailsrvcs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Find something which I did not fully understand but I was able to fix by changing the nf_conntrack_tcp_timeout_close value to 1 or 0.

I had an application connect upto my server via a proxy server. Sometimes we would send a RST to the client which would close the netstat state of the connection but it seems that iptables (ip_conntrack) does not clear the session right away. What you find is 

tcp      6 9 CLOSE src=192.168.13.2 dst=10.12.13.14  sport=22052 dport=18292 src=10.12.13.14 dst=192.168.13.2  sport=18292 dport=22052 [ASSURED] use=1                 

which I find out will remain like this for a 10 second window (set by nf_conntrack_tcp_timeout_close default value)

Normally this is not a problem but the client proxy server is sending up an ACK to our RST packet which will now pass the iptables rule I have for ESTABLISHED connections since it is in the ip_conntrack with the ASSURED flag set. We will then send another RST and again an ACK from the client.

I can stop/prevent this with the above change nf_conntrack_tcp_timeout_close value to 0.

Now my real question is there a reason I should not set that value to 0. The only time I see any mention to the timeout_close value is for a RST packet and I can not think of a reason to keep this in an ASSURED state in the firewall. If setting this to 0 is not the ideal fix any suggestion to another fix is greatly appreciated. 

Thanks 
Peter

