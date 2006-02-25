From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: updated iptables doesn't work with old rules
Date: Sat, 25 Feb 2006 20:20:46 +0100
Message-ID: <000301c63a40$94e7e060$8b00000a@sterenborg.info>
References: <5f56302b0602241517w2140ffe7v2531d8543368d253@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602241517w2140ffe7v2531d8543368d253@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi Chinh and Rob,
> 
> Let me first thank you both very much for your help and explanation,

You're welcome.

> now everything works, routing was the problem as well as me not
> understanding the iptables rules properly so was always setting
> something not correct. 

I don't know if you found it already, but I find Oscar's iptables
tutorial a good read :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

>> Additionally, resources on the net regarding PPP connections
>> (usually bound to eth0) has a similar ppp0 configuration as yours.
>> But the associated interface (usually eth0) for a ppp0 connection is
>> usually down and not configured. 
>> 
>> DEVICE=eth0
>> ONBOOT=no
> 
> Thanks for this as well, I changed it to ONBOOT=no.

Are you by any change using an Alcatel/Thomson ADSL modem (don't know if
this is going to work on other modem brands) ? In that case you may be
able to get rid of ppp0 by using SIP spoofing (which has nothing to do
with VOIP) and have the internet IP address directly on your NIC.
I find it easier to use, but the only modem/router I know of that can do
this are manufactured by Alcatel/Thomson.

> At the moment my rules are:
> 
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables --flush
> iptables -t nat --flush
> iptables --delete-chain
> iptables -t nat --delete-chain
> iptables -P FORWARD DROP
> iptables -F FORWARD
> iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
> iptables -A FORWARD -o eth0 -i ppp0 -j ACCEPT

This is effectively the same as having no rules in the FORWARD chain
when it's policy is ACCEPT. (Okay, not completely because you didn't
specify the eth1 device.)

For a start, make that :
iptables -A FORWARD -m state --state NEW -i eth0 -o ppp0 -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

> iptables -t nat -F POSTROUTING
> iptables -t nat -A POSTROUTING -j MASQUERADE
> echo 1 > /proc/sys/net/ipv4/ip_forward


Gr,
Rob


