From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Evil bug in netfilter/kernel 2.4.x?
Date: Tue, 11 Feb 2003 01:22:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030211012258.3b6f5cb8.arnt@c2i.net>
References: <3E482780.2090903@lucidpixels.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E482780.2090903@lucidpixels.com>
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

On Mon, 10 Feb 2003 17:28:16 -0500, 
jpiszcz <jpiszcz@lucidpixels.com> wrote in message 
<3E482780.2090903@lucidpixels.com>:

> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> "As a secondary note, if you use connection tracking you will not see 
> any fragmented packets, since they are dealt with before hitting any 
> chain or table in iptables."
> 
> PROBLEM:
> 
> root@p300:/etc/rc.d# iptables -t filter -I INPUT -f -j LOG --log-level
> 3 --log-prefix "FRAG: "
> root@p300:/etc/rc.d# iptables -I INPUT -f -j LOG --log-level 3 
> --log-prefix "FRAG: "
> root@p300:/etc/rc.d# iptables -I INPUT -f -j LOG --log-level 3 
> --log-prefix "FRAG: "
> root@p300:/etc/rc.d# iptables -I INPUT -f -j DROP
> 
> I've tried all of these, each one by itself.
> 
> However, when I run tcpdump, I can clearly see these are not getting 
> dropped or logged by the kernel.
> 
> I like conn_track for DCC/FTP connections, however, to get logging & 
> dropping of fragmented packets working properly, I must recompile 
> without the conn_tracker's?
> 
> Wouldn't this be considered as a bug?  Someone could be 
> pounding/scanning you with fragmented packets, and you would never see
> 
> it, as many people run the DCC and/or FTP connection trackers!
> 
> box1# nmap -sS -P0 -f -p 1-65535 box2.com
> 
> 17:11:52.659286 box1.com > box2.com: (frag 2729:4@16)
> 17:11:52.661416 box1.com > box2.com: (frag 986:4@16)
> 17:11:52.663400 box1.com > box2.com: (frag 61814:4@16)
> 17:11:52.665398 box1.com > box2.com: (frag 30216:4@16)
> 17:11:52.667401 box1.com > box2.com: (frag 4100:4@16)
> 17:11:52.669392 box1.com > box2.com: (frag 61387:4@16)
> 
> 947 packets received by filter
> 0 packets dropped by kernel
> 
> Is it possible in anyway to log/drop/match fragmented packets with 
> connection tracking turned on?

..not tested etc;  tried this in PREROUTING instead of INPUT?

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



