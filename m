From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help with POP3/SMTP and MASQ
Date: Thu, 13 Jun 2002 19:58:13 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131858.g5DIwDA15473@Networker.rockstone.co.uk>
References: <F91a1nJI4PE0ts5O8re000189a0@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F91a1nJI4PE0ts5O8re000189a0@hotmail.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 10 June 2002 10:12 pm, Felix D. Cat wrote:

> I've had had no luck getting POP3/SMTP going through my RedHat 7.1 2.4
> kernel iptables box.  I have been able to setup incoming FTP connections
> through my firewall, but no luck on the email.  Here's my script...
>
> #for POP3 and SMTP mail
> iptables -t nat -A POSTROUTING -p tcp -j MASQUERADE --to-ports 25
> iptables -t nat -A POSTROUTING -p tcp -j MASQUERADE --to-ports 110
>
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 25 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 110 -j ACCEPT
>
> iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 110 -j ACCEPT
>
> iptables -t nat -A POSTROUTING -p tcp --sport 25 -j ACCEPT
> iptables -t nat -A POSTROUTING -p tcp --sport 110 -j ACCEPT

You have no FORWARDing rules to allow reply packets back in.

You either need rules to allow packets from source port 25 & source port 110, 
or preferably, a single rule allowing ESTABLISHED,RELATED packets in.

eg iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

 

Antony.

