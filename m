From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How to block all ports except port 21,22,80,8080 ???
Date: Tue, 18 Feb 2003 04:02:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302180402.58575.netfilter@newkirk.us>
References: <1045555939.94722.jacob_chan@so-net.net.tw>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045555939.94722.jacob_chan@so-net.net.tw>
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
To: jacob_chan <jacob_chan@so-net.net.tw>
Cc: tashamaillist@yahoo.com, netfilter@lists.netfilter.org

On Tuesday 18 February 2003 03:12 am, jacob_chan wrote:
> How to block all ports except port 21,22,80,8080 ???
>
> Dear all,
>
> I want to block all ports except port 21,22,80,8080.
>
> Any help appreciated.
>
> Best regards,
>
> Jacob

If you mean on input, try:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -p tcp -m multiport --dport 21,22,80,8080 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

These will allow nothing in, nothing out, nothing forwarded, except the=20
four specified TCP ports, replies, and associated traffic.  You'd also=20
need "insmod ip_conntrack_ftp" for both passive and active FTP to work,=20
so that all data communications would be RELATED to the control port 21.=20
(and "insmod ip_conntrack" if you don't have it already, for the state=20
match to work)

j


