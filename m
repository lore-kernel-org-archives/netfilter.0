From: Stefan Praszalowicz <stefan@avedya.com>
Subject: masquerading setting bogus source IP address
Date: 10 Sep 2002 20:04:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031681096.5122.12.camel@bilbol>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yU/vaR1xSZD5+Vc4YL8Y"
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
To: netfilter@lists.netfilter.org


--=-yU/vaR1xSZD5+Vc4YL8Y
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi guys,

We're using a Linux 2.4 box as an ASDL gateway for our company office.

Today after rebooting this server we catched a very strange problem...

The gateway itself could access the net, but not the masqueraded
machines.
Running tcpdump, we saw that the gateway was setting the wrong source IP
for the masqueraded connections.

Basically, the packets it sent had src-addr set to 10.0.0.0.

After restarting the pppoe/PPP link to the dsl modem, the source IP
seemed to be incremented. I don't know for sure but at one point the IP
was 10.0.0.17 and next 10.0.0.18.

I solved the problem by adding a SNAT rule before the MASQ one:
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -I POSTROUTING 1 -j SNAT --to 217.128.104.14

Has anybody seen this before ?
Could it be related to the order in which we start things (like ppp,
firewall scripts, ...)

Thanks anyway

=======================
Some details about the tcpdump results:

** packets originating from the masqueraded hosts, with bogus src ip:

19:09:19.693511 10.0.0.0.33514 > 128.8.10.90.domain:  29756 A?
tracker.ambrosia.net. (38) (DF)
19:09:19.693539 10.0.0.0.33514 > 193.252.19.3.domain:  17779+ A?
login.oscar.aol.com. (37) (DF)
mail.avedya.com. (33) (DF)
19:09:20.693477 10.0.0.0.33514 > 128.63.2.53.domain:  6018 A?
mail.edi-presse.fr. (36) (DF)

** packets originating from the gateway itself, src is OK
19:09:23.985905 217.128.104.14.1049 > 193.252.19.3.domain:  11374+ A?
yahoo.com. (27) (DF)
19:09:24.128264 193.252.19.3.domain > 217.128.104.14.1049:  11374 2/5/5
A 66.218.71.198, A 64.58.79.230 (229) (DF)



--=-yU/vaR1xSZD5+Vc4YL8Y
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.0">
</HEAD>
<BODY>
Hi guys,
<BR>

<BR>
We're using a Linux 2.4 box as an ASDL gateway for our company office.
<BR>

<BR>
Today after rebooting this server we catched a very strange problem...
<BR>

<BR>
The gateway itself could access the net, but not the masqueraded machines.
<BR>
Running tcpdump, we saw that the gateway was setting the wrong source IP for the masqueraded connections.
<BR>

<BR>
Basically, the packets it sent had src-addr set to 10.0.0.0.
<BR>

<BR>
After restarting the pppoe/PPP link to the dsl modem, the source IP seemed to be incremented. I don't know for sure but at one point the IP was 10.0.0.17 and next 10.0.0.18.
<BR>

<BR>
I solved the problem by adding a SNAT rule before the MASQ one:
<BR>
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
<BR>
iptables -t nat -I POSTROUTING 1 -j SNAT --to 217.128.104.14
<BR>

<BR>
Has anybody seen this before ?
<BR>
Could it be related to the order in which we start things (like ppp, firewall scripts, ...)
<BR>

<BR>
Thanks anyway
<BR>

<BR>
=======================
<BR>
Some details about the tcpdump results:
<BR>

<BR>
** packets originating from the masqueraded hosts, with bogus src ip:
<BR>

<BR>
19:09:19.693511 10.0.0.0.33514 &gt; 128.8.10.90.domain:&nbsp; 29756 A? tracker.ambrosia.net. (38) (DF)
<BR>
19:09:19.693539 10.0.0.0.33514 &gt; 193.252.19.3.domain:&nbsp; 17779+ A? login.oscar.aol.com. (37) (DF)
<BR>
mail.avedya.com. (33) (DF)
<BR>
19:09:20.693477 10.0.0.0.33514 &gt; 128.63.2.53.domain:&nbsp; 6018 A? mail.edi-presse.fr. (36) (DF)
<BR>

<BR>
** packets originating from the gateway itself, src is OK
<BR>
19:09:23.985905 217.128.104.14.1049 &gt; 193.252.19.3.domain:&nbsp; 11374+ A? yahoo.com. (27) (DF)
<BR>
19:09:24.128264 193.252.19.3.domain &gt; 217.128.104.14.1049:&nbsp; 11374 2/5/5 A 66.218.71.198, A 64.58.79.230 (229) (DF)
<BR>

<BR>

</BODY>
</HTML>

--=-yU/vaR1xSZD5+Vc4YL8Y--


