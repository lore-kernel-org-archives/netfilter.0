From: Andrew McRory <amcrory@linuxsys.com>
Subject: SNAT Problem / Question
Date: Thu, 17 Jun 2004 23:24:47 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0406172259260.15532-100000@weta.lselinux.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


I am having problem getting SNAT to work with tn3270 clients. My network 
is using private IP address and is connected via freeswan ipsec to the 
remote server. Since a large number of clients connect to the server they 
require that all incoming connections be from our public IP. I setup this 
rule:

  $IPT -t nat -A POSTROUTING -o ipsec0 -j SNAT -d <REMOTE_IP> \
    --to <OUR_PUBLIC_IP>

and verified with tcpdump that the packets going out on the ipsec0 
interface have been SNAT'ed properly. With a single client connection 
everything operates beautifully however when a second client connects the 
first client session breaks and the server responds with 

	"Please close your telnet session. A connection establishment 
	error has been detected."

I am guessing that this is having to do with connection tracking but I am 
not sure. Any help is greatly appreciated as I have not found anything in 
hours of searching!!

Regards,

-- 
Andrew McRory - President
Linux Systems Engineers, Inc.
PO BOX 3791
Tallahassee, FL 32315
Office	850-224-5737
Office	850-575-7213
Mobile	850-294-7567



