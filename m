From: ads nat <adsnat@yahoo.com>
Subject: Re: Can IPTABLES be used to send alerts!
Date: Wed, 27 Aug 2003 19:28:36 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030828022836.63124.qmail@web20705.mail.yahoo.com>
References: <E19s10M-00014S-Ge@kashyyyk.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1516299412-1062037716=:62123"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E19s10M-00014S-Ge@kashyyyk.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: dir@att.net, Deshwal Chand <CDD@kampsax.co.in>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

--0-1516299412-1062037716=:62123
Content-Type: text/plain; charset=us-ascii

I am not C developer. But fairly good in php.
Is it possible to extract details of file (100 %) by using php.
Thanks


dir@att.net wrote:
Yes, this would be pretty straightforward to do if you are a C developer.

You can use the QUEUE target to queue all HTTP traffic to userland. You 
would then build a userland program to monitor packets for a set of suspect 
keywords.

This approach wouldn't be bullet-proof because the HTTP traffic will be 
fragmented to the MTU size, but it would probably catch 99% of the keywords 
you care about. With a little more code, you could demux the TCP traffic to 
rebuild the entire TCP stream, thereby making it 100%, but that's a lot more 
effort for little return IMO.

Regards, dir

> HI,
> 
> I don't know whether this is the right place to raise this post.
> 
> I am using IPTABLES and Squid. I want to monitor all the traffic going out
> of this box. Suppose someone sends his/her CV from our network using his/her
> Yahoo or Hotmail account, then I may get an alert.
> 
> Can IPTABLES do this by using some addones!!
> 
> Pls. pardon me if i am being wrong in posting this question on this list.



---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-1516299412-1062037716=:62123
Content-Type: text/html; charset=us-ascii

<DIV>I am not C developer. But fairly good in php.</DIV>
<DIV>Is it possible to extract details of file&nbsp;(100 %) by using php.</DIV>
<DIV>Thanks</DIV>
<DIV><BR><BR><B><I>dir@att.net</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">Yes, this would be pretty straightforward to do if you are a C developer.<BR><BR>You can use the QUEUE target to queue all HTTP traffic to userland. You <BR>would then build a userland program to monitor packets for a set of suspect <BR>keywords.<BR><BR>This approach wouldn't be bullet-proof because the HTTP traffic will be <BR>fragmented to the MTU size, but it would probably catch 99% of the keywords <BR>you care about. With a little more code, you could demux the TCP traffic to <BR>rebuild the entire TCP stream, thereby making it 100%, but that's a lot more <BR>effort for little return IMO.<BR><BR>Regards, dir<BR><BR>&gt; HI,<BR>&gt; <BR>&gt; I don't know whether this is the right place to raise this post.<BR>&gt; <BR>&gt; I am using IPTABLES and Squid. I want to monitor all the traffic going out<BR>&gt; of this box. Suppose someone sends his/her CV from our network using
 his/her<BR>&gt; Yahoo or Hotmail account, then I may get an alert.<BR>&gt; <BR>&gt; Can IPTABLES do this by using some addones!!<BR>&gt; <BR>&gt; Pls. pardon me if i am being wrong in posting this question on this list.<BR><BR></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-1516299412-1062037716=:62123--

