From: ads nat <adsnat@yahoo.com>
Subject: Re: Unwanted Uploading.
Date: Sat, 6 Sep 2003 08:36:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030906153632.82952.qmail@web20704.mail.yahoo.com>
References: <20030906153148.58336.qmail@web20705.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-842865211-1062862592=:81859"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030906153148.58336.qmail@web20705.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

--0-842865211-1062862592=:81859
Content-Type: text/plain; charset=us-ascii

My /etc/rc.d/rc.local file settinga re as follows.
********
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT

iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
*****


ads nat <adsnat@yahoo.com> wrote:
Hi,
My network has slowed drastically, It was working o.k. with same bandwidth fro last 3 months but from last 2 weeks it has slowed down. When checked with my ISP says their is lot of uploading from my users side. When talked with users user says their is no extar ordinary increase in uploading or downloading. My ISP say there must be  some 
virus/worm in the network.
I donlt know anything about it but very mush interested to solve problem. 
Can you guide me to detetc whether their is any unwanted uploading from user. Is their any tool or technology to detect and stop this. Can iptables check this problem.
Help apprecieated.
Thanks
 


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software

---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-842865211-1062862592=:81859
Content-Type: text/html; charset=us-ascii

<DIV>My /etc/rc.d/rc.local file settinga re as follows.</DIV>
<DIV>********</DIV>
<DIV>iptables --flush<BR>iptables --table nat --flush<BR>iptables --delete-chain<BR>iptables --table nat --delete-chain<BR>iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE<BR>iptables --append FORWARD --in-interface eth1 -j ACCEPT</DIV>
<DIV><BR>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128<BR>*****<BR><BR><BR><B><I>ads nat &lt;adsnat@yahoo.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">
<DIV>Hi,</DIV>
<DIV>My network has slowed drastically, It was working o.k. with same bandwidth fro last 3 months but from last 2 weeks it has slowed down. When checked with my ISP says their is lot of uploading from my users side. When talked with users user says their is no extar ordinary increase in uploading or downloading. My ISP say there must be&nbsp; some </DIV>
<DIV>virus/worm in the network.</DIV>
<DIV>I donlt know anything about it but very mush interested to solve problem. </DIV>
<DIV>Can you guide me to detetc whether their is any unwanted uploading from user. Is their any tool or technology to detect and stop this. Can iptables check this problem.</DIV>
<DIV>Help apprecieated.</DIV>
<DIV>Thanks</DIV>
<DIV>&nbsp;</DIV>
<P>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</A> - Free, easy-to-use web site design software</BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-842865211-1062862592=:81859--

