From: ads nat <adsnat@yahoo.com>
Subject: Re: Unwanted Uploading.
Date: Sat, 6 Sep 2003 21:16:53 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030907041653.11017.qmail@web20706.mail.yahoo.com>
References: <3F5A0DAD.7020901@chrisbrenton.org>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-684464782-1062908213=:10967"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5A0DAD.7020901@chrisbrenton.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

--0-684464782-1062908213=:10967
Content-Type: text/plain; charset=us-ascii

Hi,
By giving command "tcpdump -v -nn icmp"
I get follwoing :
*****
09:31:38.307409 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:31:39.308771 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:31:40.310974 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:31:41.312619 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:31:42.314766 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:36:38.961942 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:36:39.964662 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:36:40.967854 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:36:41.969910 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
09:36:42.978050 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) (ttl 58,
 id 0, len 84)
******
 
My Server ethrenet external ID is 202.183.69.130
How to go ahead.
Thanks

Chris Brenton <cbrenton@chrisbrenton.org> wrote:
ads nat wrote:
>
> When talked with users user says their is no extar ordinary 
> increase in uploading or downloading. My ISP say there must be some
> virus/worm in the network.

Sounds like you are one of the sites flooding people with icmp :(

Try this:
tcpdump -v -nn icmp

Look at the source IP's of the echo-request packets and fix your systems.

If that does not help, try a tool like ntop or iptraf which will tell 
you who is generating all the traffic.

HTH,
C




---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-684464782-1062908213=:10967
Content-Type: text/html; charset=us-ascii

<DIV>Hi,</DIV>
<DIV>By giving command "tcpdump -v -nn icmp"</DIV>
<DIV>I get follwoing :</DIV>
<DIV>*****</DIV>
<DIV>09:31:38.307409 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:31:39.308771 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:31:40.310974 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:31:41.312619 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:31:42.314766 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:36:38.961942 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:36:39.964662 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:36:40.967854 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>09:36:41.969910 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len
 84)<BR>09:36:42.978050 202.63.164.12 &gt; 202.183.69.130: icmp: echo request (DF) (ttl 58,<BR>&nbsp;id 0, len 84)<BR>******</DIV>
<DIV>&nbsp;</DIV>
<DIV>My Server ethrenet external ID is 202.183.69.130</DIV>
<DIV>How to go ahead.</DIV>
<DIV>Thanks<BR><BR><B><I>Chris Brenton &lt;cbrenton@chrisbrenton.org&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">ads nat wrote:<BR>&gt;<BR>&gt; When talked with users user says their is no extar ordinary <BR>&gt; increase in uploading or downloading. My ISP say there must be some<BR>&gt; virus/worm in the network.<BR><BR>Sounds like you are one of the sites flooding people with icmp :(<BR><BR>Try this:<BR>tcpdump -v -nn icmp<BR><BR>Look at the source IP's of the echo-request packets and fix your systems.<BR><BR>If that does not help, try a tool like ntop or iptraf which will tell <BR>you who is generating all the traffic.<BR><BR>HTH,<BR>C<BR><BR><BR></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-684464782-1062908213=:10967--

