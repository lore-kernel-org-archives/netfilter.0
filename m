From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Re: Redirection
Date: Fri, 27 Feb 2004 13:41:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403F3AFA.6010304@stupar.homelinux.net>
References: <403F3336.4070400@stupar.homelinux.net> <008b01c3fd2b$f8910320$2a245cc2@cea05>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------090109010409060303010401"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008b01c3fd2b$f8910320$2a245cc2@cea05>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Tomasz Macioszek <tomekm@cea.pl>
Cc: Netfilter-List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------090109010409060303010401
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

OK, I have read it and apply it for me BUT now I have the case that some 
pages won't load. I get this error from squid:
---------


  ERROR


    The requested URL could not be retrieved

------------------------------------------------------------------------

While trying to retrieve the URL: 
/ssc/home.asp?j=1&langid=us&venid=sym&plfid=22&pkj=QZVTFIZTYMWPAZTJWUF 
<http://security1.norton.com/ssc/home.asp?j=1&langid=us&venid=sym&plfid=22&pkj=QZVTFIZTYMWPAZTJWUF> 


The following error was encountered:

    * * Invalid URL *

Some aspect of the requested URL is incorrect. Possible problems:

    * Missing or incorrect access protocol (should be `http://'' or
      similar)
    * Missing hostname
    * Illegal double-escape in the URL-Path
    * Illegal character in hostname; underscores are not allowed

Your cache administrator is root <mailto:root>.
---------------------------------
I can't access a site like www.yahoo.com
What could be the problem here?

Thanx,
Sasa



Tomasz Macioszek pravi:

>Hi
>Read this howto:
>http://en.tldp.org/HOWTO/TransparentProxy.html
>
>Tomek
>
>----- Original Message ----- 
>From: "Sasa Stupar" <sasa@stupar.homelinux.net>
>To: "Netfilter-List" <netfilter@lists.netfilter.org>
>Sent: Friday, February 27, 2004 1:08 PM
>Subject: Redirection
>
>
>  
>
>>Hi!
>>
>>I have setup router with iptables. Now I have also setup a squid proxy 
>>server on another internal machine. What I want is to all http requests 
>>from internal LAN to send thru proxy.
>>Since I am new to iptables I am asking here for some help.
>>How can I do that?
>>
>>Thanks,
>>Sasa
>>
>>
>>
>>    
>>
>
>  
>


--------------090109010409060303010401
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
OK, I have read it and apply it for me BUT now I have the case that
some pages won't load. I get this error from squid:<br>
---------<br>
<h1>ERROR</h1>
<h2>The requested URL could not be retrieved</h2>
<hr>
<p>While trying to retrieve the URL:
<a
 href="http://security1.norton.com/ssc/home.asp?j=1&amp;langid=us&amp;venid=sym&amp;plfid=22&amp;pkj=QZVTFIZTYMWPAZTJWUF">/ssc/home.asp?j=1&amp;langid=us&amp;venid=sym&amp;plfid=22&amp;pkj=QZVTFIZTYMWPAZTJWUF</a>
</p>
<p>The following error was encountered:
</p>
<ul>
  <li><strong>
Invalid URL
    </strong></li>
</ul>
<p>
Some aspect of the requested URL is incorrect. Possible problems:
</p>
<ul>
  <li>Missing or incorrect access protocol (should be `<a class="moz-txt-link-freetext" href="http://">http://</a>'' or
similar)
  </li>
  <li>Missing hostname
  </li>
  <li>Illegal double-escape in the URL-Path
  </li>
  <li>Illegal character in hostname; underscores are not allowed
  </li>
</ul>
Your cache administrator is <a href="mailto:root">root</a>. <br>
---------------------------------<br>
I can't access a site like <a class="moz-txt-link-abbreviated" href="http://www.yahoo.com">www.yahoo.com</a><br>
What could be the problem here?<br>
<br>
Thanx,<br>
Sasa<br>
<br>
<br>
<br>
Tomasz Macioszek pravi:<br>
<blockquote cite="mid008b01c3fd2b$f8910320$2a245cc2@cea05" type="cite">
  <pre wrap="">Hi
Read this howto:
<a class="moz-txt-link-freetext" href="http://en.tldp.org/HOWTO/TransparentProxy.html">http://en.tldp.org/HOWTO/TransparentProxy.html</a>

Tomek

----- Original Message ----- 
From: "Sasa Stupar" <a class="moz-txt-link-rfc2396E" href="mailto:sasa@stupar.homelinux.net">&lt;sasa@stupar.homelinux.net&gt;</a>
To: "Netfilter-List" <a class="moz-txt-link-rfc2396E" href="mailto:netfilter@lists.netfilter.org">&lt;netfilter@lists.netfilter.org&gt;</a>
Sent: Friday, February 27, 2004 1:08 PM
Subject: Redirection


  </pre>
  <blockquote type="cite">
    <pre wrap="">Hi!

I have setup router with iptables. Now I have also setup a squid proxy 
server on another internal machine. What I want is to all http requests 
from internal LAN to send thru proxy.
Since I am new to iptables I am asking here for some help.
How can I do that?

Thanks,
Sasa



    </pre>
  </blockquote>
  <pre wrap=""><!---->
  </pre>
</blockquote>
<br>
</body>
</html>

--------------090109010409060303010401--

