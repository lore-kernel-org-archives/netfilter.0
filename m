From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: non-standard FTP ports and connection tracking (redux)
Date: Tue, 10 Dec 2002 08:52:31 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212100849050.9625-100000@blackhole.kfki.hu>
References: <200212092146.39732.apapadop@cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212092146.39732.apapadop@cmu.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandros Papadopoulos <apapadop@cmu.edu>
Cc: netfilter@lists.netfilter.org

On Mon, 9 Dec 2002, Alexandros Papadopoulos wrote:

> /sbin/iptables -P OUTPUT DROP
>
> #####################
> #### CHAIN INPUT ####
> #####################
>
> ## Accept everything incoming on loopback interface
> /sbin/iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -i lo -j ACCEPT
>
> ## Accept all incoming traffic from related or established connections
> /sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> ## Allow connections to our ftp server
> /sbin/iptables -A INPUT -p tcp --dport 2121 -j ACCEPT
>
> ..but still, the packets with the SYN flag set when the client tries to
> establish the new data connection are dropped. Someone please tell me
> what am I missing? I'm sure it's something obvious but I can't seem to
> find it!

What about the rules in the OUTPUT chain?

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



