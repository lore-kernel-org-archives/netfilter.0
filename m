From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: network range
Date: Sat, 3 Apr 2004 23:32:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040403213201.243C93A93@sterenborg.info>
References: <web-275929490@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-275929490@mail01.infosat.net>
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
To: 'IT Clown' <iptables@mailbox.co.za>, netfilter@lists.netfilter.org

> > How do you specifiy more than one netwrk range in a rule, is it 
> > possible?

No.

> > i want to do the following:
> > iptables -A INPUT -s 10.0.0.0/8 169.254.0.0/16 -j DROP

You can't ;).

> How can i create a chaine and a rule that will block all the 
> non routed network ranges from entering the network from the 
> external interface incase someones trying to spoof you?

Like this :

iptables -N spoof
iptables -A spoof -i <if_inet> -s 10.0.0.0/8 -j DROP
iptables -A spoof -i <if_inet> -s 169.254.0.0/16 -j DROP
...

iptables -A INPUT -j spoof
iptables -A FORWARD -j spoof


Gr,
Rob


