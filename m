From: Pascal Rodrigue <pascal.rodrigue@crc.ca>
Subject: Re: user package filter
Date: Wed, 10 Jul 2002 11:53:40 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D2C5884.3090303@crc.ca>
References: <ACB9EEE02202C449B0158F02DDD8AD0C038855@exquila.lirex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: Nikolai Abromov <NAbromov@lirex.bg>
Cc: netfilter@lists.samba.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
Hi Nikolai,<br>
<br>
&nbsp; &nbsp;I'm new into the netfilter world but yes it's possible. By using netfilter
and iptables together you can make a program in userspace for filtering packets.
Use the special QUEUE iptables target to queue the packet for userspace handling.
&nbsp;By using ip_queue module and libipq API you will be able to make something
interresting. Hope this will help you! (My primary language isn't english,
i'm sorry too :p ) <br>
<br>
-------------------------------<br>
 Pascal Rodrigue<br>
 Communications research center<br>
 Broadband networking technologies department<br>
 Ottawa, Ontario<br>
 Canada<br>
 <br>
<br>
Nikolai Abromov wrote:<br>
<blockquote type="cite"
 cite="midACB9EEE02202C449B0158F02DDD8AD0C038855@exquila.lirex.com">
  <pre wrap="">  Hello , 
 
  I would like to know whether it is possible to put traffic filter on the user's base - for instance how many syn and udp packages can         
  send for a precise time , if this is possible where can I find more information about it .

sorry for bad english


br,Nikolay Abromov </pre>
</blockquote>
<div class="moz-signature">
<title></title>
        
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
<br>
</div>
<br>
</body>
</html>


