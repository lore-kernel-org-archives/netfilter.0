From: ads nat <adsnat@yahoo.com>
Subject: Re: iptables installation problem.
Date: Thu, 11 Sep 2003 06:55:22 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030911135522.4422.qmail@web20704.mail.yahoo.com>
References: <3F607ABB.7040002@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1758022958-1063288522=:4135"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F607ABB.7040002@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

--0-1758022958-1063288522=:4135
Content-Type: text/plain; charset=us-ascii

I have downloaded from netfilter.org and built. If rpm upgrade is easy please guide me and i will do it.
Thanks

Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:


ads nat wrote:
Hi,
I have Linux server REDHAT 8.0 installed with iptables v1.2.6a. I have upgrade it to 
v 1.2.8 by installing 1.2.8. But when I check iptables -V. It shows 1.2.6a version. Do i have to delete iptable file before installing 1.2.8?
Thanks.
Did you install a Redhat iptables update by rpm or did you download and build your own? Normally a Redhat rpm automatically restarts a service after it updates it, but if it didn't

/etc/rc.d/init.d/iptables restart

will do the job. If you installed someone else's rpm or built your own binary from source, make sure that your startup script path points to the new version. I'm not aware of any reason you should have to delete the old version, although it's generally good practice to remove any unused software from a firewall box.

Jeff



---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-1758022958-1063288522=:4135
Content-Type: text/html; charset=us-ascii

<DIV>I have downloaded from netfilter.org and built. If rpm upgrade is easy please guide me and i will do it.</DIV>
<DIV>Thanks</DIV>
<DIV><BR><B><I>Jeffrey Laramie &lt;JALaramie@Loudoun-Fairfax.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><BR><BR>ads nat wrote:<BR>
<BLOCKQUOTE cite="mid20030911130528.41619.qmail@web20709.mail.yahoo.com" type="cite">
<DIV>Hi,</DIV>
<DIV>I have Linux server REDHAT 8.0 installed with iptables v1.2.6a. I have upgrade it to&nbsp;</DIV>
<DIV>v 1.2.8 by installing 1.2.8. But when I check iptables -V. It shows 1.2.6a version. Do i have to delete iptable file before installing 1.2.8?</DIV>
<DIV>Thanks.</DIV></BLOCKQUOTE>Did you install a Redhat iptables update by rpm or did you download and build your own? Normally a Redhat rpm automatically restarts a service after it updates it, but if it didn't<BR><BR>/etc/rc.d/init.d/iptables restart<BR><BR>will do the job. If you installed someone else's rpm or built your own binary from source, make sure that your startup script path points to the new version. I'm not aware of any reason you should have to delete the old version, although it's generally good practice to remove any unused software from a firewall box.<BR><BR>Jeff<BR><BR></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-1758022958-1063288522=:4135--

