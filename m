From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables installation problem.
Date: Thu, 11 Sep 2003 10:30:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F6086E8.7020106@Loudoun-Fairfax.com>
References: <20030911135522.4422.qmail@web20704.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------070809020208050203000607"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030911135522.4422.qmail@web20704.mail.yahoo.com>
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
--------------070809020208050203000607
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

ads nat wrote:

> I have downloaded from netfilter.org and built. If rpm upgrade is easy 
> please guide me and i will do it.
> Thanks
>

Redhat makes update RPMs available for all the packages in their 
distros. You can configure and run "Update Agent" or you can go to their 
site at http://www.redhat.com/apps/download/ to find them. You can also 
find the update file tree at a mirror site. This is the one I use:

ftp://mirrors.kernel.org/redhat/redhat/linux/updates/8.0/en/os/i386.

Download the file then run:

rpm -Uvh /yourfilepath/yourfilename

This will update iptables, but it won't change your config files. If the 
current version isn't running correctly then updating probably won't 
solve your problem. Hope this helps,  Jeff


--------------070809020208050203000607
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
ads nat wrote:<br>
<blockquote type="cite"
 cite="mid20030911135522.4422.qmail@web20704.mail.yahoo.com">
  <div>I have downloaded from netfilter.org and built. If rpm upgrade
is easy please guide me and i will do it.</div>
  <div>Thanks</div>
  <div><br>
  </div>
</blockquote>
<br>
Redhat makes update RPMs available for all the packages in their
distros. You can configure and run "Update Agent" or you can go to
their site at <a class="moz-txt-link-freetext" href="http://www.redhat.com/apps/download/">http://www.redhat.com/apps/download/</a> to find them. You
can also find the update file tree at a mirror site. This is the one I
use:<br>
<br>
<a class="moz-txt-link-freetext" href="ftp://mirrors.kernel.org/redhat/redhat/linux/updates/8.0/en/os/i386">ftp://mirrors.kernel.org/redhat/redhat/linux/updates/8.0/en/os/i386</a>.<br>
<br>
Download the file then run:<br>
<br>
rpm -Uvh /yourfilepath/yourfilename<br>
<br>
This will update iptables, but it won't change your config files. If
the current version isn't running correctly then updating probably
won't solve your problem. Hope this helps,&nbsp; Jeff<br>
<br>
</body>
</html>

--------------070809020208050203000607--


