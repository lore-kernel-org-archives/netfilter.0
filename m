From: Bart <b-m@pandora.be>
Subject: Re: Newbie question
Date: Tue, 10 Dec 2002 14:09:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF5E780.8080802@myland.org>
References: <AAEOLIGMOIBLFHGNBBEMCEIECBAA.glens@cybercorpinc.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------060501010404060404090102"
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
To: Net Filter <netfilter@lists.netfilter.org>


--------------060501010404060404090102
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Glen Spidal wrote:

> What IPTables commands do I need to issue in a script to allow port 25 
> and 110 (email) to work.  See attached PDF file.

Can't you set up the Windows 2000 Pro as a client, and use Linux as the 
main router ?

Otherwise you need to do:

1) add destination(192.168.254.X)-gateway(192.168.0.47) route for each 
client PC on the windows PC,  
since the client IP's are dynamic, this is impractical.
OR
2) enable MASQUERADING on the linuxbox
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


In both cases enable ip_forwarding on the linuxbox.
echo "1" > /proc/sys/net/ipv4/ip_forward

This offcourse doesn't matter for http if you use a proxy, but anything 
else 
won't work without one of the two mentioned above.

Then you can add some rules like:
  iptables -P forward drop

  iptables -A forward -i eth0 -o eth1 -sport 25 -m state --state 
ESTABLISHED -j ACCEPT
  iptables -A forward -i eth1 -o eth0 -dport 25 -j ACCEPT

  iptables -A forward -i eth0 -o eth1 -sport 110 -m state --state 
ESTABLISHED -j ACCEPT
  iptables -A forward -i eth1 -o eth0 -dport 110 -j ACCEPT


The ip of eth0 (192.168.254.250) is the same as the dhcp-server 
(192.168.254.250) which
doesn't make sense (to me).

( eth0 = connected to windows, eth1 connect to switch )

HTH
greetz
B.Mermuys


>  
> Glen Spidal
> Hillsboro Oregon USA
> PH: 503-681-9786  FX: 503-615-2936 
> www.cybercorpinc.com <http://www.cybercorpinc.com/>
>  



--------------060501010404060404090102
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
<br>
Glen Spidal wrote:<br>
<blockquote type="cite"
 cite="midAAEOLIGMOIBLFHGNBBEMCEIECBAA.glens@cybercorpinc.com">  
  <meta http-equiv="Content-Type" content="text/html; ">
 
  <meta content="MSHTML 6.00.2800.1106" name="GENERATOR">
 
  <div><font face="Arial" size="2"><span class="449013523-08122002">What
IPTables  commands do I need to issue in a script to allow port 25 and 110
(email) to  work.&nbsp; See attached PDF file.</span></font></div>
 </blockquote>
Can't you set up the Windows 2000 Pro as a client, and use Linux as the main
router ?<br>
<br>
Otherwise you need to do:<br>
<br>
1) add destination(192.168.254.X)-gateway(192.168.0.47) route for each client
PC on the windows PC, &nbsp;<br>
since the client IP's are dynamic, this is impractical.<br>
OR <br>
2) enable MASQUERADING on the linuxbox <br>
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<br>
<br>
<br>
In both cases enable ip_forwarding on the linuxbox.<br>
echo "1" &gt; /proc/sys/net/ipv4/ip_forward<br>
<br>
This offcourse doesn't matter for http if you use a proxy, but anything else&nbsp;
<br>
won't work without one of the two mentioned above.<br>
<br>
Then you can add some rules like:<br>
&nbsp; iptables -P forward drop<br>
<br>
&nbsp; iptables -A forward -i eth0 -o eth1 -sport 25 -m state --state ESTABLISHED
-j ACCEPT<br>
&nbsp; iptables -A forward -i eth1 -o eth0 -dport 25 -j ACCEPT<br>
<br>
&nbsp; iptables -A forward -i eth0 -o eth1 -sport 110 -m state --state ESTABLISHED
-j ACCEPT<br>
&nbsp; iptables -A forward -i eth1 -o eth0 -dport 110 -j ACCEPT<br>
<br>
<br>
The ip of eth0 (192.168.254.250) is the same as the dhcp-server (192.168.254.250)
which <br>
doesn't make sense (to me).<br>
<br>
( eth0 = connected to windows, eth1 connect to switch )<br>
<br>
HTH<br>
greetz<br>
B.Mermuys<br>
<br>
<br>
<blockquote type="cite"
 cite="midAAEOLIGMOIBLFHGNBBEMCEIECBAA.glens@cybercorpinc.com">
  <div><font face="Arial" size="2"><span class="449013523-08122002"></span></font>&nbsp;</div>
 
  <div><font face="Arial" size="2">Glen Spidal</font></div>
 
  <div><font face="Arial"><font size="2">Hillsboro Oregon<span
 class="449013523-08122002"> USA</span></font></font></div>
 
  <div><font face="Arial" size="2">PH: 503-681-9786&nbsp; FX: 503-615-2936&nbsp;  </font></div>
 
  <div><font face="Arial" size="2"><a
 href="http://www.cybercorpinc.com/">www.cybercorpinc.com</a></font></div>
 
  <div>&nbsp;</div>
</blockquote>
<br>
</body>
</html>

--------------060501010404060404090102--


