From: edwardspl@ita.org.mo
Subject: [Fwd: Question with WebMail + Mail Server]
Date: Sat, 24 Apr 2004 20:50:24 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408A6290.B684D53D@ita.org.mo>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------A046F312AFABC15D2848CBAA"
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

This is a multi-part message in MIME format.
--------------A046F312AFABC15D2848CBAA
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by itahost1.ita.org.mo id i3OEWxK26048

Many thank for your help !
=A0

--------------A046F312AFABC15D2848CBAA
Content-Type: message/rfc822
Content-Disposition: inline

Return-Path: <netfilter-announce-admin@lists.netfilter.org>
Received: from lakshmi.netfilter.org (mail@lakshmi.netfilter.org [62.128.28.23])
	by itahost1.ita.org.mo (8.11.6/8.11.6) with ESMTP id i3O0uYK22503
	for <edwardspl@ita.org.mo>; Sat, 24 Apr 2004 08:56:34 +0800
Received: from vishnu.netfilter.org ([213.95.27.115])
	by lakshmi.netfilter.org with esmtp (Exim 4.22 #1 (Debian))
	id 1BH9ce-0007bF-1n; Sat, 24 Apr 2004 00:58:16 +0200
Received: from [202.175.64.238] (helo=itahost1.ita.org.mo)
	by vishnu.netfilter.org with esmtp (Exim 4.22 #1 (Debian))
	id 1BH3Lv-0003c2-6U
	for <netfilter-announce@lists.netfilter.org>; Fri, 23 Apr 2004 18:16:35 +0200
Received: from ita.org.mo (c51line8.dialup2.ctm.net [202.175.35.9])
	(authenticated)
	by itahost1.ita.org.mo (8.11.6/8.11.6) with ESMTP id i3NI3mK20145
	for <netfilter-announce@lists.netfilter.org>; Sat, 24 Apr 2004 02:03:48 +0800
Message-ID: <4089428A.5597C592@ita.org.mo>
From: edwardspl@ita.org.mo
X-Mailer: Mozilla 4.7 [en] (WinNT; I)
X-Accept-Language: en,zh-TW
MIME-Version: 1.0
To: netfilter-announce@lists.netfilter.org
Subject: Question with WebMail + Mail Server
Content-Type: multipart/alternative;
 boundary="------------3993D8932BB5A83BACBB8B3E"
X-Spam-Score: 2.2 (++)
X-Spam-Report: 2.2/5.0
	This mail is probably spam.  The original message has been attached
	along with this report, so you can recognize or block similar unwanted
	mail in future.  See http://spamassassin.org/tag/ for more details.
	Content preview:  Dear All, There is Firewall + WebMail + Mail Server in
	a computer machine ( Linux Server ) : Firewall is using iptables,
	protocol of WebMail ( IMP 3.2.3 , http://horde.org/imp ) is using
	imap/notls and port is using 143, and the Mail Server is using imap (
	come with Fedora Core 1 Linux ). [...] 
	Content analysis details:   (2.20 points, 5 required)
	NO_REAL_NAME       (0.8 points)  From: does not include a real name
	X_ACCEPT_LANG      (-0.1 points) Has a X-Accept-Language  header
	HTML_10_20         (1.4 points)  BODY: Message is 10% to 20% HTML
	HTML_MESSAGE       (0.1 points)  BODY: HTML included in message
Sender: netfilter-announce-admin@lists.netfilter.org
Errors-To: netfilter-announce-admin@lists.netfilter.org
X-BeenThere: netfilter-announce@lists.netfilter.org
X-Mailman-Version: 2.0.11
Precedence: bulk
List-Help: <mailto:netfilter-announce-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter-announce@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-announce>,
	<mailto:netfilter-announce-request@lists.netfilter.org?subject=subscribe>
List-Id: Official announces of the netfilter project <netfilter-announce.lists.netfilter.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-announce>,
	<mailto:netfilter-announce-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter-announce/>
Date: Sat, 24 Apr 2004 00:21:30 +0800
X-Mozilla-Status2: 00000000


--------------3993D8932BB5A83BACBB8B3E
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: 7bit

Dear All,

There is Firewall + WebMail + Mail Server in a computer machine ( Linux
Server ) :

Firewall is using iptables, protocol of WebMail ( IMP 3.2.3 ,
http://horde.org/imp ) is using imap/notls and port is using 143, and
the Mail Server is using imap ( come with Fedora Core 1 Linux ).

iptables ruls :

iptables -P INPUT DROP
iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT

But I have the following the problem :
http://marc.free.net.ph/message/20040318.053223.3f53fbd8.html

So, who can help me to fix this kind of problem ?

Many thank for your help too much !

Edward.

--------------3993D8932BB5A83BACBB8B3E
Content-Type: text/html; charset=big5
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Dear All,
<p>There is Firewall + WebMail + Mail Server in a computer machine ( Linux
Server ) :
<p>Firewall is using iptables, protocol of WebMail ( IMP 3.2.3 , <A HREF="http://horde.org/imp">http://horde.org/imp</A>
) is using imap/notls and port is using 143, and the Mail Server is using
imap ( come with Fedora Core 1 Linux ).
<p>iptables ruls :
<p>iptables -P INPUT DROP
<br>iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
<br>iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
<p>But I have the following the problem :
<br><a href="http://marc.free.net.ph/message/20040318.053223.3f53fbd8.html">http://marc.free.net.ph/message/20040318.053223.3f53fbd8.html</a><a href="http://marc.free.net.ph/message/20040318.053223.3f53fbd8.html"></a>
<p>So, who can help me to fix this kind of problem ?
<p>Many thank for your help too much !
<p>Edward.</html>

--------------3993D8932BB5A83BACBB8B3E--



--------------A046F312AFABC15D2848CBAA--



