From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables installation problem.
Date: Thu, 11 Sep 2003 09:38:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F607ABB.7040002@Loudoun-Fairfax.com>
References: <20030911130528.41619.qmail@web20709.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------090401020901050502060105"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030911130528.41619.qmail@web20709.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------090401020901050502060105
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



ads nat wrote:

> Hi,
> I have Linux server REDHAT 8.0 installed with iptables v1.2.6a. I have 
> upgrade it to 
> v 1.2.8 by installing 1.2.8. But when I check iptables -V. It shows 
> 1.2.6a version. Do i have to delete iptable file before installing 1.2.8?
> Thanks.

Did you install a Redhat iptables update by rpm or did you download and 
build your own? Normally a Redhat rpm automatically restarts a service 
after it updates it, but if it didn't

/etc/rc.d/init.d/iptables restart

will do the job. If you installed someone else's rpm or built your own 
binary from source, make sure that your startup script path points to 
the new version. I'm not aware of any reason you should have to delete 
the old version, although it's generally good practice to remove any 
unused software from a firewall box.

Jeff


--------------090401020901050502060105
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<br>
<br>
ads nat wrote:<br>
<blockquote type="cite"
 cite="mid20030911130528.41619.qmail@web20709.mail.yahoo.com">
  <div>Hi,</div>
  <div>I have Linux server REDHAT 8.0 installed with iptables v1.2.6a.
I have upgrade it to&nbsp;</div>
  <div>v 1.2.8 by installing 1.2.8. But when I check iptables -V. It
shows 1.2.6a version. Do i have to delete iptable file before
installing 1.2.8?</div>
  <div>Thanks.</div>
</blockquote>
Did you install a Redhat iptables update by rpm or did you download and
build your own? Normally a Redhat rpm automatically restarts a service
after it updates it, but if it didn't<br>
<br>
/etc/rc.d/init.d/iptables restart<br>
<br>
will do the job. If you installed someone else's rpm or built your own
binary from source, make sure that your startup script path points to
the new version. I'm not aware of any reason you should have to delete
the old version, although it's generally good practice to remove any
unused software from a firewall box.<br>
<br>
Jeff<br>
<br>
</body>
</html>

--------------090401020901050502060105--


