From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: udp port 135
Date: Thu, 14 Aug 2003 07:35:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c36225$e166d270$0401000a@sterenborg.info>
References: <3F3B0EF9.5040002@belfordhk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F3B0EF9.5040002@belfordhk.com>
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
To: 'Netfilter Group' <netfilter@lists.netfilter.org>

> iptables -A INPUT -i $EXT_DEV -p tcp -d $EXT_DEV --dport 135 -j DROP
> iptables -A INPUT -i $EXT_DEV -p udp -d $EXT_DEV --dport 135 -j DROP
                                       ^^^^^^^^^^^

I guess the above and below is are typos ? It should be -d $EXT_IP.

> iptables -A OUTPUT -o $EXT_DEV -p tcp -d $EXT_DEV --dport 135 -j DROP
> iptables -A OUTPUT -o $EXT_DEV -p udp -d $EXT_DEV --dport 135 -j DROP

-d $EXT_IP --dport 135 should be -s $EXT_IP --sport 135.

> But with :
> 
> nmap -sU -P0 -p 135 <ext ip>,
> 
> I get a (135/udp open).

I have the same results.

> Can someone explain to me what I'm doing wrong or what
> information I have forgotten?    Does it even matter
> if the udp 135 port is open?  I'm currently in
> the process of closing all unneccessary ports
> (be it tcp or udp).

No. I am interested too in why udp shows "open" from a foreign host,
while tcp shows filtered.
How can I check if an udp port is really closed/filtered or opened ?


Gr,
Rob


