From: "Julien Didron" <admin@tripnotik.dyndns.org>
Subject: Forwarding GnomeMeeting to internal network
Date: Wed, 12 Nov 2003 10:35:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031112102230.M85506@tripnotik.dyndns.org>
References: <Pine.LNX.4.58.0311111558160.8003@fhynpb.envafyvqr.arg> <Pine.LNX.4.33.0311120009030.26051-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0311120009030.26051-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Vigil <nvnwdfuq02@sneakemail.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hello list,

I wish to use GnomeMeeting, for which I assume the only port that needs 
opening is 1720.
Now, how can I forward all incoming traffic to port 1720 on the router, to 
one machine on the network that doesn't have a fixed IP (DHCP), but has name 
on the domain thanks to DDNS (ex : abox.mydomain.net).

Another question regarding ip_conntrack. After 5 days of use, I get the 
following error in syslog : "ip_conntrack table full, dropping packet.". I 
then increased the value in /proc/sys/net/ipv4/ip_conntrack_max, from 3048 to 
8192, but I think this is a quick fix that won't get me too far ... Is there 
a mean of flushing that table ? If not, how can I lower the TCP connection 
timeouts ?

Thanks in advance.

--
Open WebMail Project (http://openwebmail.org)

