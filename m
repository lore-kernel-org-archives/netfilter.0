From: "iic1tls" <iic1tls@yahoo.com>
Subject: RE: Bastion Firewall Host Redirect Question
Date: Tue, 14 Dec 2010 09:10:31 -0600
Message-ID: <000401cb9ba1$0d6da300$2848e900$@com>
Reply-To: <iic1tls@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1292339461; bh=rk/EDwuaMq67TMSqEtKEVf+c+TLI0q361hPbZS8BvUk=; h=X-Yahoo-Newman-Id:Received:X-Yahoo-SMTP:X-YMail-OSG:X-Yahoo-Newman-Property:Reply-To:From:To:Subject:Date:Organization:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language; b=fxet06W3+nWsVqQr9AudAAGFBME0JqoDS68PYK1DUmjlhKRl1eLngWpiEWmpvafT1mbBboWwX7R3Gm/MDesuUXIygyYIV1UXg5H60xTFwfLFppJhfAwQYzJDoIekUuGlb4zlAPacwOPjjc+adWI46nKxcHSgd9TDVAAi5od+GLI=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

From: iic1tls [mailto:iic1tls@yahoo.com] 
Sent: Tuesday, December 14, 2010 9:10 AM
To: 'Jonathan Tripathy'; 'netfilter@vger.kernel.org'
Subject: RE: Bastion Firewall Host Redirect Question

Thanks Jonathan, but I can not modify the DNS.  I need an IPTables solution.

THANK YOU

-----Original Message-----
From: Jonathan Tripathy [mailto:jonnyt@abpni.co.uk] 
Sent: Tuesday, December 14, 2010 8:59 AM
To: iic1tls@yahoo.com; netfilter@vger.kernel.org
Subject: Re: Bastion Firewall Host Redirect Question


>
> QUESTION
> Given that clients on the internal network can freely surf the internet:
if
> the clients select a specific web site (ie www.website.com), my goal is to
> configure IPTables to instead redirect the client to the internal web
> server.
>
> - If the client web browser is going to surf www.website.com, then
iptables
> redirects the client to 149.10.10.25
> - If the client web browser is going to surf any other website, then
> iptables permits the client to forward to the internet.
>
>
Use a local DNS server and set the hostname of the site that you want to 
re-direct to your local webserver. You can secure this setup a bit more 
by using a proxy server (Squid + SquidGuard) to prevent clients entering 
the IPs directly. The only thing that IPTables would do is make sure 
that only your proxy server can access the internet directly

