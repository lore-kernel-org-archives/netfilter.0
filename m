From: gonet wireless <gonet_noc@yahoo.com>
Subject: iptables and http port(80)
Date: Tue, 14 Jan 2003 10:43:38 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030114184338.80245.qmail@web14606.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-725360051-1042569818=:79686"
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

--0-725360051-1042569818=:79686
Content-Type: text/plain; charset=us-ascii


Hello world,

I have a link on my web server router linux mandrake 8.2 which shows nothing(white page) inside and outside of my network. I add INPUT( -A INPUT -i eth1 -p tcp -m tcp --dport 80 -j ACCEPT) rule in my firewall(iptables 1.2.5) and now i can browse this link inside my network but none outside. I add OUTPUT( -A OUTPUT -o eth0 -p tcp -m tcp --dport 80 -j ACCEPT)  rule but I'm not able to browse this link outside my network. I don't catch what's wrong

Any help will be more appreciated



---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-725360051-1042569818=:79686
Content-Type: text/html; charset=us-ascii

<P>Hello world,</P>
<P>I have a link on my web server router linux mandrake 8.2 which shows&nbsp;nothing(white page) inside and outside of my network. I add INPUT( -A INPUT -i eth1 -p&nbsp;tcp -m tcp --dport 80 -j ACCEPT)&nbsp;rule in my firewall(iptables 1.2.5) and now i can browse this link&nbsp;inside my network but none outside. I add OUTPUT( -A OUTPUT -o eth0 -p&nbsp;tcp -m tcp --dport 80 -j ACCEPT)&nbsp; rule but I'm not able to browse this link outside my network. I don't catch what's wrong</P>
<P>Any help will be more appreciated</P><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-725360051-1042569818=:79686--

