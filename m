From: "Ian Douglas" <ian@icreditvision.com>
Subject: RE: using iptables for poor-man's load balancing?
Date: Wed, 19 Feb 2003 15:17:48 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEBKOCKLOOEJGIOMFAPAEJNFJAA.ian@icreditvision.com>
References: <HMEBKOCKLOOEJGIOMFAPAEGOFJAA.ian@icreditvision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <HMEBKOCKLOOEJGIOMFAPAEGOFJAA.ian@icreditvision.com>
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

> Say for argument's sake that our public IP is 1.2.3.4 and our
> internal LAN machines are:
>   192.168.1.1
>   192.168.1.12

(cut two of them out since they're not actually ready to run yet)

> Just curious if the following rules would work to round-robin the connections:
>
> /sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 80  -j DNAT \
>    --to-destination 192.168.1.1:80 \
>    --to-destination 192.168.1.12:80
> /sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 433  -j DNAT \
>    --to-destination 192.168.1.1:80 \
>    --to-destination 192.168.1.12:80

I tested this last night and it didn't work - every request went to 1.1

Should I be using "--to 192.168.1.1:80" instead of "--to-destination
192.168.1.1:80" ? I've seen documentation show the use of --to and a working
script for port forwarding that uses --to-destination

As a followup:

# uname -a
Linux icv.com 2.4.18-18.7.x #1 Wed Nov 13 20:29:30 EST 2002 i686 unknown

# rpm -qa | grep iptables
iptables-1.2.5-3
iptables-ipv6-1.2.5-3

# iptables -V
iptables v1.2.5

Andrej (Tink) suggested I write the list again and ask what version of iptables
introduced 'multiple targets' for port forwarding.

-id


