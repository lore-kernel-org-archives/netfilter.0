From: Meszaros Gergely <monk@geotronic.hu>
Subject: Re: Masquarede stalls?
Date: Tue, 10 Aug 2004 20:56:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040810205631.797831f1.monk@geotronic.hu>
References: <D5C9032B2B09C64EA2409D6214E91AC9051263@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051263@asimail2.alphanumeric.com>
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
To: netfilter@lists.netfilter.org


Dear Antony and Jason! Many thanks for the quick response! I'm enthralled.

Unfortunately "tcpdump -n -nn -p -i ppp0 icmp" gives nothing (I hope i did it well :)).
(what is -nn ? I cannot find that in the manpage.)

Are you sure this is a ICMP related problem? I can ping everything very quickly and correctly from the internal net. The things go wrong somewhere during the connections. :-( However you must be right, im not guru.


Anthony, my ext interface is the following: 

ppp0      Link encap:Point-to-Point Protocol  
          inet addr:xxx.xxx.xxx.xxx  P-t-P:192.168.0.254  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:2255 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3300 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:133634 (130.5 KiB)  TX bytes:1083394 (1.0 MiB)

MTU: 1492.  But I dunno it is bad or good :)

Its less than 1500 bytes, however by only 8. Its bad? 
And whats  that clamp-mss-to-mtu thing ? :)


thank you !

1 MonK

