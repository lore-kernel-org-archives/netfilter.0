From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables ssh outgoing problem
Date: Fri, 30 Jan 2004 09:19:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040130081911.A0E181B8D7@smtp.ttp.nl>
References: <PJEOLDHINDKCFPBDLONJCECKCAAA.chamindar@sad.gov.lk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PJEOLDHINDKCFPBDLONJCECKCAAA.chamindar@sad.gov.lk>
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

> Fire wall with iptables two Ethernet for LAN and wan. I can 
> do ssh from the fire wall but from the LAN workstations it is 
> not possible. I use ssh client software for windows. do I 
> need to set firewall ip and port at ssh client if so which port.
> 
> $IPTABLES -A FORWARD -p tcp  -s 192.168.145.23  -d
> **.***.***.***  --destination-port 22  -m state --state NEW -j ACCEPT

Is it your intention to let the Windows boxes connect to only 1 IP ?
This rule only let's the initial connection through. Do you also have a
rule like this one (which I would place [almost] in top of your other
rules) :

$IPTABLES -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

And have you turned on IP forwarding ?

echo "1" > /proc/sys/net/ipv4/ip_forward

> This is the command. Do I need to put at the beginning of the 
> forward table?

Unless some other rule is preventing you from reaching this one, no :
you can but don't *need* to.


Gr,
Rob


