From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 18:15:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC53412.4060200@Loudoun-Fairfax.com>
References: <1069853846.3fc4ac966be15@paris-hme1> <20031126151015.GB4486@cannon.eng.us.uu.net> <1069879109.3fc50f45e7331@paris-hme1> <200311262048.49827.Antony@Soft-Solutions.co.uk> <1069886478.3fc52c0e61202@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069886478.3fc52c0e61202@paris-hme1>
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
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
zynkx wrote:<br>
<blockquote type="cite" cite="mid1069886478.3fc52c0e61202@paris-hme1">
  <pre wrap="">antony: 

the only reason why i am doing this is because i am 
blocking all incoming connectios to my box except 
portuguese connections. i manage to get all the 
portuguese ip ranges, put the forward chain to drop 
and a accepted all the sources i want to get 
connections from. this way i will only be accepting 
connetions from portugal, since that the ammount of 
users i administrate is not enough for that machine to 
be opened to the whole world. 

there are in fact lots of users expecting mail to come 
from those 2 most known smtps, so this forces me to 
accept connectiosn from those domains :))

the way i see it, filtering with qmail doesn&acute;t make 
any sense, because what i want is not to filter but to 
accept :)))
  </pre>
</blockquote>
<br>
It depends on your approach. Whether you let all the mail through
iptables and filter at qmail, or filter at iptables and allow qmail to
accept everything, the result is the same. The difference is that MTAs
are specifically designed to allow filtering of mail in many different
ways including by smtp source.<br>
<br>
The advange qmail has over iptables is that it can filter by domain and
resolve the IPs itself (I don't use qmail but I'm assuming it has the
same features as other MTAs). That means that if you want to allow
Yahoo.com qmail can resolve that to *any* Yahoo.com mail address
whereas iptables can only block the IPs you specify. If Yahoo goes out
and gets assigned new IPs your way would block them. A qmail filter
would resolve the IP based on the domain and let it through. That's why
I recommend the qmail solution<br>
<br>
Jeff<br>
</body>
</html>


