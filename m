From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Compiling options for IPTABLES to work.
Date: Tue, 16 Sep 2003 09:15:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F670CDF.3020007@Loudoun-Fairfax.com>
References: <20030916085405.88759.qmail@web20703.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010306060306070907080300"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030916085405.88759.qmail@web20703.mail.yahoo.com>
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
--------------010306060306070907080300
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

ads nat wrote:

> I want to get hands on experience of using iptables, DMZ firewall, 
> DHCP firewall, etc.for which Tutorial says I need to compile kernal 
> with following options OR as modules :
>  
>
>    *
>
>       CONFIG_NETFILTER
>
>    *
>
>       CONFIG_IP_NF_CONNTRACK
>
>    *
>
>       CONFIG_IP_NF_IPTABLES
>
>    *
>
>       CONFIG_IP_NF_MATCH_LIMIT
>
>    *
>
>       CONFIG_IP_NF_MATCH_STATE
>
>    *
>
>       CONFIG_IP_NF_FILTER
>
>    *
>
>       CONFIG_IP_NF_NAT
>
>    *
>
>       CONFIG_IP_NF_TARGET_LOG
>
> I have installed Redhat Linux 8.0 on server machine which by default 
> installs iptables 1.2.6a.
>
> Do Redhat 8.0 install all these modules. How to check whether these 
> modules are installed or not. 
>
> Thanks
>

The stock Redhat kernels load these routines as modules. Run: 
/sbin/lsmod to see which modules are currently loaded. Note that the 
module name is not going to be the exact same name as the kernel option 
i.e.  if kernel option CONFIG_IP_NF_CONNTRACK is loaded as a module it 
will be loaded as module ip_conntrack.

Jeff

--------------010306060306070907080300
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
<title></title>
ads nat wrote:<br>
<blockquote cite="mid20030916085405.88759.qmail@web20703.mail.yahoo.com"
 type="cite">
  <div>I want to get hands on experience of using iptables, DMZ
firewall, DHCP firewall, etc.for which Tutorial says I need to compile
kernal with following options OR as modules :</div>
  <div>&nbsp;</div>
  <ul>
    <li>
      <p>CONFIG_NETFILTER </p>
    </li>
    <li>
      <p>CONFIG_IP_NF_CONNTRACK </p>
    </li>
    <li>
      <p>CONFIG_IP_NF_IPTABLES </p>
    </li>
    <li>
      <p>CONFIG_IP_NF_MATCH_LIMIT </p>
    </li>
    <li>
      <p>CONFIG_IP_NF_MATCH_STATE </p>
    </li>
    <li>
      <p>CONFIG_IP_NF_FILTER </p>
    </li>
    <li>
      <p>CONFIG_IP_NF_NAT </p>
    </li>
    <li>
      <p>CONFIG_IP_NF_TARGET_LOG </p>
    </li>
  </ul>
  <p>I have installed Redhat Linux 8.0 on server machine which by
default installs iptables 1.2.6a. </p>
  <p>Do Redhat 8.0 install all these modules. How to check whether
these modules are installed or not.&nbsp; </p>
  <p>Thanks</p>
</blockquote>
<br>
The stock Redhat kernels load these routines as modules. Run:
/sbin/lsmod to see which modules are currently loaded. Note that the
module name is not going to be the exact same name as the kernel option
i.e.&nbsp; if kernel option CONFIG_IP_NF_CONNTRACK is loaded as a module it
will be loaded as module ip_conntrack.<br>
<br>
Jeff<br>
</body>
</html>

--------------010306060306070907080300--


