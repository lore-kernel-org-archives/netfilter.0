From: Dave Barnum <dave@leaplab.com>
Subject: Re: Multiple PPTP clients behind iptables.
Date: Wed, 14 Apr 2004 16:24:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407DC81B.9090503@leaplab.com>
References: <GHEILNONPACCGBGKBEKKMEBICFAA.mani@manikandan.org> <001501c41e4b$1f079e70$51a2fea9@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c41e4b$1f079e70$51a2fea9@heretic>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body>
<meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
<title></title>
Is this patch built into the 2.6 kernel?<br>
<br>
Alexis wrote:<br>
<blockquote cite="mid001501c41e4b$1f079e70$51a2fea9@heretic" type="cite">
  <pre wrap="">yes, you need the pptp patch

ive been in the same situation, and applying the patch made it work just
fine.-

see
<a class="moz-txt-link-freetext"
 href="http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-5.html#ss5.6">http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-5.html#ss5.6</a>

----- Original Message ----- 
From: "Manikandan" <a
 class="moz-txt-link-rfc2396E" href="mailto:mani@manikandan.org">&lt;mani@manikandan.org&gt;</a>
To: "Netfilter" <a
 class="moz-txt-link-rfc2396E"
 href="mailto:netfilter@lists.netfilter.org">&lt;netfilter@lists.netfilter.org&gt;</a>
Sent: Friday, April 09, 2004 12:08 PM
Subject: Multiple PPTP clients behind iptables.


  </pre>
  <blockquote type="cite">
    <pre wrap="">Dear friends,

As I am getting more confused about VPN masq., request your help on
this.

My local LAN is 10.35.0.0/24
My Linux box running red hat linux 9.0 with kernel 2.4.20-8. acting as the
gateway for my LAN to Internet.

I need to allow my LAN clients to access Microsoft windows VPN (Windows
    </pre>
  </blockquote>
  <pre wrap=""><!---->2000
  </pre>
  <blockquote type="cite">
    <pre wrap="">Adv. Server) using PPTP over Internet.
I am not able to make more than one connection to the VPN server as my LAN
outgoing traffic to Internet is getting SNAT to single public IP.


I read few guides and howtos to configure my firewall to allow multiple
    </pre>
  </blockquote>
  <pre wrap=""><!---->PPTP
  </pre>
  <blockquote type="cite">
    <pre wrap="">sessions. But still I couldn't get through.

Do I need to patch my kernel? What support do I need to enable this
    </pre>
  </blockquote>
  <pre wrap=""><!---->multiple
  </pre>
  <blockquote type="cite">
    <pre wrap="">PPTP traffic.

Request your views and help on this.


Have a nice day

Regards,
Manikandan.








    </pre>
  </blockquote>
  <pre wrap=""><!---->


  </pre>
</blockquote>
<br>
</body>
</html>

