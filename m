From: =?iso-8859-1?q?Andreas=20Wright?= <learnvoip@yahoo.co.uk>
Subject: Using PRIO qdisc
Date: Tue, 3 Dec 2002 10:28:46 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021203102846.86260.qmail@web14504.mail.yahoo.com>
References: <31347F3CE518D6118ACB00A0246AD0560B2505@mx.seaan.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-104552463-1038911326=:30129"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <31347F3CE518D6118ACB00A0246AD0560B2505@mx.seaan.net>
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

--0-104552463-1038911326=:30129
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


Hello ,

I want to use PRIO qdisc to priortize packets coming from a known IP address.Can I specify a filter along with PRIO qdisc instead of using the default priomap.

tc qdisc add dev eth0 root handle 1 : [filter]

If such a filter is possible what would be the syntax for specifying the IP address for example 1.2.3.4

Regards,

Andreas.




---------------------------------
With Yahoo! Mail you can get a bigger mailbox -- choose a size that fits your needs

--0-104552463-1038911326=:30129
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<P>Hello ,</P>
<P>I want to use PRIO qdisc to priortize packets coming from a known IP address.Can I specify a filter along with PRIO qdisc instead of using the default priomap.</P>
<P>tc qdisc add dev eth0 root handle 1 : [<FONT color=#ff0000>filter</FONT>]</P>
<P>If such a filter is possible what would be the syntax for specifying the IP address for example 1.2.3.4</P>
<P>Regards,</P>
<P>Andreas.</P><p><p><br><hr size=1><a href="http://uk.yahoo.com/mail/tagline_xtra/?http://uk.docs.yahoo.com/mail_storage.html"><b><font face="Arial" size="2">With Yahoo! Mail you can get a bigger mailbox -- choose a size that fits your needs</font></b></a><br>
--0-104552463-1038911326=:30129--

