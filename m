From: Sao Do <saodohv@yahoo.com>
Subject: I can't stop iptables with the command "service iptables stop"
Date: Mon, 10 Mar 2003 00:23:54 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030310082354.83406.qmail@web14807.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-355899760-1047284634=:81892"
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

--0-355899760-1047284634=:81892
Content-Type: text/plain; charset=us-ascii


Dear Sir or Madam,

I have difficulties with iptables v1.2.6a. I have a bridge set on Linux Red hat 7.2 upgraded with kernel 2.4.18. I have installed iptables v1.2.6a. The bridge starts OK, iptables starts OK, but I when I execute the command:

# service iptables stop

the following error occure:

iptables: libiptc/libip4tc.c:384: do_check: Assertion 'h->info.valid_hooks==(1<<0|1<<3)' failed

/etc/init.d/iptables: line -2: 1393 Aborted                              iptables -t $i -F iptables: libiptc/libip4tc.c:384: do_check: Assertion 'h->info.valid_hooks==(1<<0|1<<3)' failed

/etc/init.d/iptables: line -225: 1397 Aborted                              iptables -t $i -X Resetting built-in chains to the default ACCEPT policy: iptables: libiptc/libip4tc.c:384: do_check: Assertion 'h->info.valid_hooks==(1<<0|1<<3)' failed

/etc/init.d/iptables: line -215: 1046 Aborted                              iptables -t mangle -P PREROUTING ACCEPT

                                                                                                       [FAILED]

So, Please help me to solve the problems.

Thank you very much! 



---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, and more
--0-355899760-1047284634=:81892
Content-Type: text/html; charset=us-ascii

<P>Dear Sir or Madam,</P>
<P>I have difficulties with iptables v1.2.6a. I have a bridge set on Linux Red hat 7.2 upgraded with kernel 2.4.18. I have installed iptables v1.2.6a. The bridge starts OK, iptables starts OK, but I when I execute the command:</P>
<P># service iptables stop</P>
<P>the following error occure:</P>
<P>iptables: libiptc/libip4tc.c:384: do_check: Assertion 'h-&gt;info.valid_hooks==(1&lt;&lt;0|1&lt;&lt;3)' failed</P>
<P>/etc/init.d/iptables: line -2: 1393 Aborted&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -t $i -F iptables: libiptc/libip4tc.c:384: do_check: Assertion 'h-&gt;info.valid_hooks==(1&lt;&lt;0|1&lt;&lt;3)' failed</P>
<P>/etc/init.d/iptables: line -225: 1397 Aborted&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -t $i -X Resetting built-in chains to the default ACCEPT policy: iptables: libiptc/libip4tc.c:384: do_check: Assertion 'h-&gt;info.valid_hooks==(1&lt;&lt;0|1&lt;&lt;3)' failed</P>
<P>/etc/init.d/iptables: line -215: 1046 Aborted&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -t&nbsp;mangle -P PREROUTING ACCEPT</P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [FAILED]</P>
<P>So, Please help me to solve the problems.</P>
<P>Thank you very much!&nbsp;</P><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/finance/mailtagline/*http://taxes.yahoo.com/">Yahoo! Tax Center</a> - forms, calculators, tips, and more
--0-355899760-1047284634=:81892--

