From: "Andrew J. Meader" <ameader@corp.lcom.net>
Subject: Re: Can somebody help me with setting up a server behind a sdsl router?
Date: Mon, 16 Dec 2002 12:39:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFE1DDF.70109@corp.lcom.net>
References: <010801c2a527$782dcbd0$5d01a8c0@jason>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------070703020507000901020208"
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
To: Jason Corekin <jason@corekin.no-ip.com>, netfilter@lists.netfilter.org


--------------070703020507000901020208
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jason,

Does the service provider (telco) allow more than one IP address (more 
than one rfc 1483 tunnel) for your connection? Does the router require 
separate (unique) vc's for this to work? If the provider will allow you 
to do this then getting a connection for your mail server is a matter of 
getting the right machine to talk to the right interface on the router. 
Just a couple of ideas.

Good luck!

Andy

> Now he wants to use another one of his publicly registered static ip's 
> for his mail server, which we are trying to plug into one of the 
> unused jacks on the built it hub on the R7100.  The problem is that we 
> can not get the R7100 to respond to more then one public address. 



--------------070703020507000901020208
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
Jason,<br>
<br>
Does the service provider (telco) allow more than one IP address (more than
one rfc 1483 tunnel) for your connection? Does the router require separate
(unique) vc's for this to work? If the provider will allow you to do this
then getting a connection for your mail server is a matter of getting the
right machine to talk to the right interface on the router. Just a couple
of ideas.<br>
<br>
Good luck!<br>
<br>
Andy<br>
<br>
<blockquote type="cite" cite="mid010801c2a527$782dcbd0$5d01a8c0@jason">
  <div><font face="Arial" size="2">Now he wants to use  another one of his
publicly registered static ip's for his mail server, which we  are trying
to plug into one of the unused jacks on the built it hub on the  R7100.&nbsp;
The problem is that we can not get the R7100 to respond to more  then one
public address.&nbsp; </font></div>
</blockquote>
<br>
</body>
</html>

--------------070703020507000901020208--


