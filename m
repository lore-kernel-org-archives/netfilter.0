From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: block ports
Date: Mon, 16 Sep 2002 00:28:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPEELOCOAA.stewart.thompson@shaw.ca>
References: <0H2I00K6GRXQU3@l-daemon>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <0H2I00K6GRXQU3@l-daemon>
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
To: PayalR <payal@hotpop.com>, netfilter@lists.netfilter.org

Hi Payal:

	The rule below would allow all connections except
On port 22 because of the !.. Set your policy to Drop and
then have a rule allowing each port you want to let in.

#iptables -A INPUT -i eth0 -p tcp --dport  22 -j ACCEPT

Stu........

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of PayalR
Sent: September 16, 2002 12:03 AM
To: netfilter@lists.netfilter.org
Subject: block ports

Hi all,
I have a stupid question. I want to have incoming internet access for only
port 22, 25, 80 and 110. How do I go abut it?
I thought of this rule first,

#iptables -A INPUT -i eth0 -p tcp --dport ! 22 -j DROP

and go for the other ports as well. But my problem is that if a packet
arrives from port 110, it will be checked for rule 1 above and since it is
not for port 22 it will be dropped disregarding the next rules. Right?

What can I do about this? How do I exactly frame the rules?
Thanks a lot and bye.
-Payal



