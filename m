From: Sandeep Balakrishnan <sandeeptcr@yahoo.com>
Subject: user based packet filtering
Date: Tue, 8 Apr 2003 06:33:06 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030408133306.6936.qmail@web10412.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-314388046-1049808786=:6516"
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

--0-314388046-1049808786=:6516
Content-Type: text/plain; charset=us-ascii


Sir/Madam,

Is it possible to do user based packet filtering in Linux
 say i need to allow telnet access to all but i want to block 
port
 80(outbound) to some users
 while allowing others ?

 something like packet filter checks first checks uid and
 then apply the
 existing rule ?
 so you may say:
 iptables -A output -p tcp --dport 80 --uid-owner luser -j RE



---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
--0-314388046-1049808786=:6516
Content-Type: text/html; charset=us-ascii

<P>Sir/Madam,</P>
<P>Is it possible to do user based packet filtering in Linux<BR>&nbsp;say i need to allow telnet access to all but i want to block <BR>port<BR>&nbsp;80(outbound) to some users<BR>&nbsp;while allowing others ?<BR><BR>&nbsp;something like packet filter checks first checks uid and<BR>&nbsp;then apply the<BR>&nbsp;existing rule ?<BR>&nbsp;so you may say:<BR>&nbsp;iptables -A output -p tcp --dport 80 --uid-owner luser -j RE</P><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/finance/mailsig/*http://tax.yahoo.com">Yahoo! Tax Center</a> - File online, calculators, forms, and more
--0-314388046-1049808786=:6516--

