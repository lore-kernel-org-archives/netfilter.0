From: Jochen Radmacher <jradmacher@gmx.de>
Subject: Re: I need a clever solution for two Bittorrent machines behind a
 firewall
Date: Fri, 19 Nov 2004 03:01:05 +0100
Message-ID: <419D53E1.7050406@gmx.de>
References: <00c801c4cd90$8980f090$0400a8c0@bradmorgan>
	<260C0D3A0781D4EBEEED6053@[10.169.6.246]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <260C0D3A0781D4EBEEED6053@[10.169.6.246]>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
Kenneth Porter wrote:

> --On Thursday, November 18, 2004 10:03 AM -0700 Brad Morgan 
> <B-Morgan@concentric.net> wrote:
>
>> I'm using a Linux firewall with IPTables as my home firewall.
>
>
> Take a look at "port triggering". This is a feature in the Linksys 
> WRT54G, which uses uClinux under the hood. When an outbound connection 
> is seen to a particular port, a port forwarding rule is installed for 
> the internal client. I'm guessing this is done by monitoring the 
> iptables logs and installing a custom chain on demand that's removed 
> after a period of inactivity.
>
I'm using a simple script to detect when someone connects to the 
battle.net . The basic Idea is to check for /proc/net/ip_conntrack for 
battle.net connections. Here is a simple version which has to be run 
every n minutes.
Greets
 Jochen Radmacher
---- cut here ----
#!/bin/bash
CONNECTED=0;
#Bugfix for netfilter bug 227
IPADDR=$(/sbin/ifconfig | grep -i "ppp0" -A 1|grep "inet addr"|cut -d " 
" -f 12|
cut -d ":" -f 2)

#you can repeat the following  4 lines with different argument for grep 
to make an 'OR'
egrep '213\.248\.106\.' /proc/net/ip_conntrack |grep $IPADDR >/dev/null
if [ "$?" -eq "0" ]; then
CONNECTED=1;
fi

if [ "$CONNECTED" -eq "1" ]; then
#do something
iptables -A ....
else
iptables -D ....
fi




