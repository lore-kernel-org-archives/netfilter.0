From: Wendy Moore <wenmoore@yahoo.com>
Subject: masquerading
Date: Thu, 11 Sep 2003 19:09:57 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030912020957.81068.qmail@web41109.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2122243790-1063332597=:80892"
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

--0-2122243790-1063332597=:80892
Content-Type: text/plain; charset=us-ascii

Hi All,
 
I want to setup a internet gateway/firewall for my local network by using iptables:

iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE

ip forwarding is enabled,....

 

I can browse on a local workstation to eg. www.openldap.org

(Everything works fine on this site) However other websites do not work eg. www.shoutcast.com. These sites are online (tested them by browsing on the FW computer). 

The browser says it is finding the website, but is waiting for a reply?

Anyone any idea?

FILTER table

Chain INPUT (policy ACCEPT)

target prot opt source destination 

Chain FORWARD (policy ACCEPT)

target prot opt source destination 

Chain OUTPUT (policy ACCEPT)

target prot opt source destination 

 

NAT table:

Chain PREROUTING (policy ACCEPT)

target prot opt source destination 

Chain POSTROUTING (policy ACCEPT)

target prot opt source destination 

MASQUERADE all -- anywhere anywhere 

Chain OUTPUT (policy ACCEPT)

target prot opt source destination 

 

Chain PREROUTING (policy ACCEPT)

target prot opt source destination 

Chain INPUT (policy ACCEPT)

target prot opt source destination 

Chain FORWARD (policy ACCEPT)

target prot opt source destination 

Chain OUTPUT (policy ACCEPT)

target prot opt source destination 

Chain POSTROUTING (policy ACCEPT)

target prot opt source destination 



---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-2122243790-1063332597=:80892
Content-Type: text/html; charset=us-ascii

<DIV>Hi All,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I want to setup a internet gateway/firewall for my local network by using iptables:</DIV>
<DIV><FONT size=2>
<P>iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE</P>
<P>ip forwarding is enabled,....</P>
<P>&nbsp;</P>
<P>I can browse&nbsp;on a local workstation to eg. <A href="http://www.openldap.org">www.openldap.org</A></P>
<P>(Everything works fine on this site) However other websites do not work eg. <A href="http://www.shoutcast.com">www.shoutcast.com</A>. These sites are online (tested them by browsing on the FW computer). </P>
<P>The browser says it is finding the website, but is waiting for a reply?</P>
<P>Anyone any idea?</P>
<P>FILTER table</P><FONT size=2>
<P>Chain INPUT (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>Chain FORWARD (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>Chain OUTPUT (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>&nbsp;</P>
<P>NAT table:</P><FONT size=2>
<P>Chain PREROUTING (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>Chain POSTROUTING (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>MASQUERADE all -- anywhere anywhere </P>
<P>Chain OUTPUT (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>&nbsp;</P><FONT size=2>
<P>Chain PREROUTING (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>Chain INPUT (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>Chain FORWARD (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>Chain OUTPUT (policy ACCEPT)</P>
<P>target prot opt source destination </P>
<P>Chain POSTROUTING (policy ACCEPT)</P>
<P>target prot opt source destination </P></FONT></FONT></FONT></FONT></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-2122243790-1063332597=:80892--

