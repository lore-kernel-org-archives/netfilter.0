From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: forwarding based on hostname
Date: Sun, 03 Aug 2003 13:55:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2D76AA.6040903@smgtec.com>
References: <000601c35a00$0083bfc0$8c01a8c0@blackice3>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010704030808060608010107"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000601c35a00$0083bfc0$8c01a8c0@blackice3>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ian McBeth <imcbeth@telus.net>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------010704030808060608010107
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

If you don't change the firewall rules between the two attempts, there 
are only a few things that can go wrong:

1. Does the hostname point to the server that the ip address does? Make 
sure with a packet sniffer.
2. If you are inside the network trying to connect to 192.168.0.x 
directly, it is different from connecting to it through the hostname 
address when you are inside the network. Generally for internal 
devicesm, you want to point them at an internal DNS server that manages 
all the 192.168.0.0/16 addresses. Then, have an external DNS managing 
what the world sees.

Iptables does not play nicely doing an interface loop like the following:

HSTA:IFA -> HSTB:IFA -> HSTB:IFB --|
                                   |
HSTC:IFA <- HSTB:IFA <- HSTB:IFB <-|

Ideally, it should look like one of the two following examples:

HSTA:IFA -> HSTB:IFA --|
                       |
HSTA:IFA <- HSTB:IFA <-|

OR

HSTA:IFA -> HSTC:IFA

The difference here is that the first example needs to loop through an 
external interface and then pass back in, but since its source is from 
itself, there is invariably problems doing the loopback. I am not sure 
if there is a quick-and-dirty fix to this problem. I haven't found one 
as of yet.

If this has nothing to do with your problem, then I must say *doh*


--------------010704030808060608010107
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
If you don't change the firewall rules between the two attempts, there
are only a few things that can go wrong:<br>
<br>
1. Does the hostname point to the server that the ip address does? Make
sure with a packet sniffer.<br>
2. If you are inside the network trying to connect to 192.168.0.x
directly, it is different from connecting to it through the hostname
address when you are inside the network. Generally for internal
devicesm, you want to point them at an internal DNS server that manages
all the 192.168.0.0/16 addresses. Then, have an external DNS managing
what the world sees.<br>
<br>
Iptables does not play nicely doing an interface loop like the
following:<br>
<br style="font-family: monospace;">
<span style="font-family: monospace;">HSTA:IFA -&gt; HSTB:IFA -&gt;
HSTB:IFB --|</span><br style="font-family: monospace;">
<span style="font-family: monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; |</span><br style="font-family: monospace;">
<span style="font-family: monospace;">HSTC:IFA &lt;- </span><span
 style="font-family: monospace;"><span style="font-family: monospace;">HSTB:IFA
&lt;- HSTB:IFB</span></span><span style="font-family: monospace;">
&lt;-|<br>
<br>
Ideally, it should look like one of the two following examples:<br>
<br>
</span><span style="font-family: monospace;"><span
 style="font-family: monospace;">HSTA:IFA -&gt; HSTB:IFA --|</span><br
 style="font-family: monospace;">
<span style="font-family: monospace;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</span><br
 style="font-family: monospace;">
<span style="font-family: monospace;">HSTA:IFA &lt;- </span><span
 style="font-family: monospace;"><span style="font-family: monospace;">HSTB:IFA
</span></span><span style="font-family: monospace;">&lt;-|<br>
<br>
OR<br>
<br>
</span></span><span style="font-family: monospace;"><span
 style="font-family: monospace;"><span style="font-family: monospace;">HSTA:IFA
-&gt; HSTC:IFA</span><br style="font-family: monospace;">
<span style="font-family: monospace;"></span><span
 style="font-family: monospace;"></span><br>
The difference here is that the first example needs to loop through an
external interface and then pass back in, but since its source is from
itself, there is invariably problems doing the loopback. I am not sure
if there is a quick-and-dirty fix to this problem. I haven't found one
as of yet.<br>
<br>
If this has nothing to do with your problem, then I must say *doh*<br>
</span></span><br>
</body>
</html>

--------------010704030808060608010107--


