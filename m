From: =?iso-8859-1?q?Fabrizio=20Di=20Meo?= <fabriziodimeo@yahoo.it>
Subject: Iptables bug?!
Date: Thu, 20 Feb 2003 23:01:43 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030220220143.4515.qmail@web10302.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1163979379-1045778503=:4387"
Content-Transfer-Encoding: 8bit
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

--0-1163979379-1045778503=:4387
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


Hi,

 I'm using suse 7.3 and iptables v1.2.2.

Performing a prerouting operation like the folowing one:

iptables -t nat -A PREROUTING -p tcp --dport 139 -i ppp0 -j DNAT --to 192.168.1.5:139

I got an anomaly because even though it's really working fine it goes on to forward the packets when removed by this:

iptables -t nat -D PREROUTING -p tcp --dport 139 -i ppp0 -j DNAT --to 192.168.1.5:139

I couldn't explain that such iptables' behaviour....is here anyone who can?

Thank you,

 Fabrizio



---------------------------------
Yahoo! Cellulari: loghi, suonerie, picture message per il tuo telefonino
--0-1163979379-1045778503=:4387
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<P>Hi,</P>
<P>&nbsp;I'm using suse 7.3 and iptables v1.2.2.</P>
<P>Performing a prerouting operation like the folowing one:</P>
<P>iptables -t nat -A PREROUTING -p tcp --dport 139 -i ppp0 -j DNAT --to 192.168.1.5:139</P>
<P>I got an anomaly because even though it's really working fine it goes on to forward the packets when removed by this:</P>
<P>iptables -t nat -D PREROUTING -p tcp --dport 139 -i ppp0 -j DNAT --to 192.168.1.5:139</P>
<P>I couldn't explain that such iptables' behaviour....is here anyone who can?</P>
<P>Thank you,</P>
<P>&nbsp;Fabrizio</P><p><br><hr size=1><A HREF="http://it.yahoo.com/mail_it/foot/?http://it.mobile.yahoo.com/index2002.html"><b>Yahoo! Cellulari</a></b>: loghi, suonerie, picture message per il tuo telefonino
--0-1163979379-1045778503=:4387--

