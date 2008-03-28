From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: nf_conntrack_tcp_timeout_close value
Date: Fri, 28 Mar 2008 09:03:22 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803280857120.5429@blackhole.kfki.hu>
References: <19200036.1321831206651510533.JavaMail.root@vms069.mailsrvcs.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <19200036.1321831206651510533.JavaMail.root@vms069.mailsrvcs.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pyoder3@verizon.net
Cc: netfilter@vger.kernel.org

Hi,

On Thu, 27 Mar 2008, pyoder3@verizon.net wrote:

> Find something which I did not fully understand but I was able to fix by 
> changing the nf_conntrack_tcp_timeout_close value to 1 or 0.
> 
> I had an application connect upto my server via a proxy server. 
> Sometimes we would send a RST to the client which would close the 
> netstat state of the connection but it seems that iptables 
> (ip_conntrack) does not clear the session right away. What you find is
> 
> tcp 6 9 CLOSE src=192.168.13.2 dst=10.12.13.14 sport=22052 dport=18292 
> src=10.12.13.14 dst=192.168.13.2 sport=18292 dport=22052 [ASSURED] use=1
> 
> which I find out will remain like this for a 10 second window (set by 
> nf_conntrack_tcp_timeout_close default value)
> 
> Normally this is not a problem but the client proxy server is sending up 
> an ACK to our RST packet which will now pass the iptables rule I have 
> for ESTABLISHED connections since it is in the ip_conntrack with the 
> ASSURED flag set. We will then send another RST and again an ACK from 
> the client.

The proxy server is broken: a RST segment must never be ACK-ed. As the 
application server is in the CLOSED state, it'll answer the ACK with a RST 
and the result is the loop you found. Fix the proxy server.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
