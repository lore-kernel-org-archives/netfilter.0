From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: samba and iptables
Date: Fri, 17 Oct 2003 11:32:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031017122406.524271B9B8@smtp.ttp.nl>
References: <F22386C3FEB012449238672E38ED61E70A8D53@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E70A8D53@overlord.overturemedia.com>
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
To: 'Fritz Mesedilla' <fritz.mesedilla@overturemedia.com>, "'Netfilter Mailing List (E-mail)'" <netfilter@lists.netfilter.org>

> I still can't seem to make samba and iptables work properly.
> 
> First connection - I need to turn iptables off
> Succeeding connections - I can turn iptables on
> 
> I have done this already:
> $IPTABLES -A INPUT -p tcp -s 190.200.5.51 --dport 137:139 -j ACCEPT
> $IPTABLES -A INPUT -p udp -s 190.200.5.51 --dport 137:139 -j ACCEPT
> $IPTABLES -A INPUT -p tcp -s 190.200.5.51 --dport 445 -j ACCEPT
> 
> It's being blocked in the 1st attempt so I need to turn 
> iptables off to make it work.
> Based on "iptables -nvL" the 3 lines above produce accepted packets.
> Now what else do I need to add to make the 1st transaction to work?
> 
> By the way, I have 2 network cards. How do I know which one 
> is being used by samba?

Do you also have something like :
$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


Gr,
Rob


