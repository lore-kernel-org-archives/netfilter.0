From: Theo Cabrerizo Diem <diem-netfilter@carpediem.sh>
Subject: Problem determining the correct route
Date: 07 May 2003 11:52:04 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052319124.768.28.camel@noname.javali.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi !

I have a question about conntrack ...

I have one box, action as router, with 2 internet connections (one ADSL
and one Wifi) and a connection to my network ...

I have some DNAT rules, for example, to redirect port 25 on my 'router'
to my mail server (IP 192.168.1.2) ...

the problem is .. actually I only use ADSL for other services and Wifi
for email .. (I use FWMARK and IPROUTE2 to do this) ... 

There isn't any way to conntrack/other methods to do a redirect in both
links .. and conntrack (using ESTABLISHED state information) to decide
witch route to take .. or any rules I can mark it using this info and
decide with iproute2 ?

Actually I use iptroute2 with matches a FWMARK created with this
iptables rule :
iptables -t mangle -A FORWARDING -s $MY_SMTP -m tcp -p tcp --sport smtp
-j MARK --set-mark 0xa2

but if my wifi link goes down, i have to manually remove this mark to
allow packets comming from my SMTP to take ADSL route :o/ ...

Thanks !

Theo


