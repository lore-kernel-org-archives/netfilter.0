From: "Cyrille Colin" <shishico@hotmail.com>
Subject: Netfilter and SCTP
Date: Wed, 30 Apr 2003 12:50:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law8-F94rhYQYx3G5aY000150f0@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi,

I would like to know how Netfilter's translator deals with SCTP / IP packets 
(Stream Control Transmission Protocol, IP protocol 132).

similarly to UDP, it should be able to translate the source adress in the IP 
header, and the source port in the SCTP common header, if needed. And 
recompute SCTP and IP headers checksums.

is this currently supported ? if not how Netfilter behave when receiving 
such a packet ??

any help on this would be very much appreciated... seems that NAT boxes do 
not like SCTP very much...


Thanks

Cyrille





_________________________________________________________________
MSN Messenger : discutez en direct avec vos amis ! 
http://www.msn.fr/msger/default.asp


