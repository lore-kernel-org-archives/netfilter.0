From: Cyberdude Murli <murli_laptop@yahoo.com>
Subject: Re: Problem With Yahoo Voice chat
Date: Fri, 18 Jul 2003 10:51:06 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030718175106.31885.qmail@web13302.mail.yahoo.com>
References: <069801c34c40$dee874e0$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1153069148-1058550666=:30836"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <069801c34c40$dee874e0$c2bf09ca@Housecall>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: B H R Balaji <balaji@sol.net.in>, netfilter@lists.samba.org

--0-1153069148-1058550666=:30836
Content-Type: text/plain; charset=us-ascii

I have faced a problem like this.
 
But it affected all natted users. I changed the SNAT  IP and it was sorted out.
 
I contacted yahoo support 2 times and got layman response. Looks like yahoo support don'[t read email message before replying.
 
To me it was like they blocked my nat ip probably due to the fact of lot of incoming connections.
 
But for me it was all private IPs and not just some.
Regards,
 
murli

B H R Balaji <balaji@sol.net.in> wrote:
Hi all

Iam running Iptables on Redhat 9.0
iptables version 1.2.8 with additional -P-O-M patch
iam running transparent cache with Squid

i have one Public IP and 350 users, with private IP
192.168.10.0, 192.168.20.0, 192.168.20.0
with 4 NIC

1 ethernet iam using for Internet
3 NIC for home users

iam doing masq with external interface
everything work fine

but when i try to join Voice chat is yahoo
You are not authorise to join voice conference

but some of them are working..

my doubt is , is there any limitation of yahoo chat will does for some
connections coming with one IP

any body have same kind of problem
Please any solution will be appriciated

hare




---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
--0-1153069148-1058550666=:30836
Content-Type: text/html; charset=us-ascii

<DIV>I have faced a problem like this.</DIV>
<DIV>&nbsp;</DIV>
<DIV>But it affected all natted users. I changed the SNAT&nbsp; IP and it was sorted out.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I contacted yahoo support 2 times and got layman response. Looks like yahoo support don'[t read email message before replying.</DIV>
<DIV>&nbsp;</DIV>
<DIV>To me it was like they blocked my nat ip probably due to the fact of lot of incoming connections.</DIV>
<DIV>&nbsp;</DIV>
<DIV>But for me it was all private IPs and not just some.<BR>Regards,</DIV>
<DIV>&nbsp;</DIV>
<DIV>murli</DIV>
<DIV><BR><B><I>B H R Balaji &lt;balaji@sol.net.in&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px; WIDTH: 100%">Hi all<BR><BR>Iam running Iptables on Redhat 9.0<BR>iptables version 1.2.8 with additional -P-O-M patch<BR>iam running transparent cache with Squid<BR><BR>i have one Public IP and 350 users, with private IP<BR>192.168.10.0, 192.168.20.0, 192.168.20.0<BR>with 4 NIC<BR><BR>1 ethernet iam using for Internet<BR>3 NIC for home users<BR><BR>iam doing masq with external interface<BR>everything work fine<BR><BR>but when i try to join Voice chat is yahoo<BR>You are not authorise to join voice conference<BR><BR>but some of them are working..<BR><BR>my doubt is , is there any limitation of yahoo chat will does for some<BR>connections coming with one IP<BR><BR>any body have same kind of problem<BR>Please any solution will be appriciated<BR><BR>hare<BR><BR><BR></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</a> - Now only $29.95 per month!
--0-1153069148-1058550666=:30836--

