From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: [Fwd: Re: Blocking Netranges Based on IP-to-Country CSV]
Date: Thu, 16 Sep 2004 13:29:59 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4149DBA7.4060309@pbl.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010706090203080704000902"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------010706090203080704000902
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Probably needed to end up on the list...

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

--------------010706090203080704000902
Content-Type: message/rfc822;
	name="Re: Blocking Netranges Based on IP-to-Country CSV"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="Re: Blocking Netranges Based on IP-to-Country CSV"

Return-Path: <nib@cookinglinux.org>
Received: from wav.pbl.ca
	by pbl.ca (8.12.0/8.12.0) with ESMTP id i8GI4nqe011572
	for <amilivojevic@pbl.ca>; Thu, 16 Sep 2004 13:04:49 -0500
Received: from wav.pbl.ca by pbl.ca (foo/bar) with SMTP id i8GI4nOv001001
	for <amilivojevic@wav1.pbl.ca>; Thu, 16 Sep 2004 13:04:49 -0500 (CDT)
Received: from wav1.pbl.ca ([192.168.200.11])
	by wav.pbl.ca with SMTP id M2004091613044805575
	for <amilivojevic@wav1.pbl.ca>; Thu, 16 Sep 2004 13:04:48 -0500
Received: from pbl.ca ([192.168.210.67])
	by wav1.pbl.ca with SMTP id M2004091613044829036
	for <amilivojevic@wav1.pbl.ca>; Thu, 16 Sep 2004 13:04:48 -0500
Received: from quasar.cookinglinux.org
	by pbl.ca (foo/bar) with ESMTP id i8GI4mgP031828
	for <amilivojevic@pbl.ca>; Thu, 16 Sep 2004 13:04:49 -0500
Received: from mail.cookinglinux.org (localhost [127.0.0.1])
	by quasar.cookinglinux.org (Postfix) with ESMTP id 4E6B6AFFC2
	for <amilivojevic@pbl.ca>; Thu, 16 Sep 2004 13:56:53 -0400 (EDT)
Received: from 207.162.80.7
	(SquirrelMail authenticated user nib@cookinglinux.org);
	by mail.cookinglinux.org with HTTP;
	Thu, 16 Sep 2004 13:56:53 -0400 (EDT)
Message-ID: <25974.207.162.80.7.1095357413.squirrel@207.162.80.7>
Date: Thu, 16 Sep 2004 13:56:53 -0400 (EDT)
Subject: RE: Blocking Netranges Based on IP-to-Country CSV
From: "Nicolas Bouliane" <nib@cookinglinux.org>
To: amilivojevic@pbl.ca
User-Agent: SquirrelMail/1.4.3a
X-Mailer: SquirrelMail/1.4.3a
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal

Gary & Mic McFall wrote:

>Due to a number of issues, my organization is reviewing the ability to
>block certain country domains at the firewall.  To be proactive, we want
>to automate that process via iptables & the CSV available at
><http://ip-to-country.webhosting.info>.

I currently work on a match geoip based on the maxmind database.
You can observe my development state to:
http://codepoet.cookinglinux.net/cgi-bin/blosxom.cgi

and my current source code at:
http://www.cookinglinux.org/projects/netfilter-iptables/geoip_alpha-0.3/

Anyway I really dont know if my concept is ok. Using netlink in a match. I
was wait to have a usable code to post.

If you plan to use my source code, please let me know, thanks.


--
Nicolas Bouliane
nib@cookinglinux.org




--------------010706090203080704000902--

