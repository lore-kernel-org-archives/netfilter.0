From: "Jesse W. Asher" <jasher1@tampabay.rr.com>
Subject: Re: Natted IRC "inherently insecure"?
Date: Mon, 08 Jul 2002 19:26:00 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D2A1F88.9040102@tampabay.rr.com>
References: <3D243492.6090408@tampabay.rr.com> <20020708001941.GC653@ns>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------040300060309030401000402"
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
To: netfilter@lists.samba.org


--------------040300060309030401000402
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


So, if the firewall is set up securely so that ports above 1024 are not 
unfiltered and a "helper application" is in place to help with DCC, then 
IRC is not "inherently insecure"?

Stephen Frost wrote:

>* Jesse W. Asher (jasher1@tampabay.rr.com) wrote:
>  
>
>>Someone recently indicated to me that they believed that natting IRC 
>>through a firewall was "inherently insecure" and I wanted to get 
>>opinions on that statement.  I guess, in my mind, it isn't any more or 
>>less secure than any other service natted through the firewall - it all 
>>depends on how comfortable you feel with the inherent security of the 
>>client/tool that you're using.
>>
>>Comments?
>>    
>>
>
>The client/tool is one thing but I think what they were probably getting
>at is the issue of DCC.  The problem with DCC is that it expects to be
>able to reach any >1024 port on the remote system.  The two clients work
>out, over the IRC network, the ports to use.  If your firewall doesn't
>allow connections to high ports outbound or inbound, and you don't use
>some kind of IRC helper in your firewall, then DCC won't work.  This may
>be acceptable to you but some people feel they need DCC.  Using an IRC
>helper in your firewall can mitigate these problems some.  They can't
>fix everything though because of the way in which the DCC protocol
>works.  A user using DCC can potentially allow a scan of the high ports
>on at least the machine they're IRC'ing from.
>
>Unfortunately I'm not very familiar with the internals of the netfilter
>IRC-helper module or what checks it does but there are some things it
>has no way to know due simply to where it has to be and what it gets to
>see.  I havn't heard of many people getting attacked in such a way
>though so the chances of you being exploited in that way are probably
>pretty slim.  Unless you have someone going for you specifically using
>an IRC helper will probably be enough.  Most attackers are going for
>'easy' targets, things they can sweep large network blocks for; such as
>the recent OpenSSH holes, various Windows-based services, etc.
>
>	Stephen
>  
>

-- 
Jesse W. Asher

"They that can give up essential liberty to purchase a little temporary
safety, deserve neither liberty or safety."  - Benjamin Franklin



--------------040300060309030401000402
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
<br>
So, if the firewall is set up securely so that ports above 1024 are not unfiltered
and a "helper application" is in place to help with DCC, then IRC is not
"inherently insecure"?<br>
<br>
Stephen Frost wrote:<br>
<blockquote type="cite" cite="mid20020708001941.GC653@ns">
  <pre wrap="">* Jesse W. Asher (<a class="moz-txt-link-abbreviated" href="mailto:jasher1@tampabay.rr.com">jasher1@tampabay.rr.com</a>) wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Someone recently indicated to me that they believed that natting IRC 
through a firewall was "inherently insecure" and I wanted to get 
opinions on that statement.  I guess, in my mind, it isn't any more or 
less secure than any other service natted through the firewall - it all 
depends on how comfortable you feel with the inherent security of the 
client/tool that you're using.

Comments?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
The client/tool is one thing but I think what they were probably getting
at is the issue of DCC.  The problem with DCC is that it expects to be
able to reach any &gt;1024 port on the remote system.  The two clients work
out, over the IRC network, the ports to use.  If your firewall doesn't
allow connections to high ports outbound or inbound, and you don't use
some kind of IRC helper in your firewall, then DCC won't work.  This may
be acceptable to you but some people feel they need DCC.  Using an IRC
helper in your firewall can mitigate these problems some.  They can't
fix everything though because of the way in which the DCC protocol
works.  A user using DCC can potentially allow a scan of the high ports
on at least the machine they're IRC'ing from.

Unfortunately I'm not very familiar with the internals of the netfilter
IRC-helper module or what checks it does but there are some things it
has no way to know due simply to where it has to be and what it gets to
see.  I havn't heard of many people getting attacked in such a way
though so the chances of you being exploited in that way are probably
pretty slim.  Unless you have someone going for you specifically using
an IRC helper will probably be enough.  Most attackers are going for
'easy' targets, things they can sweep large network blocks for; such as
the recent OpenSSH holes, various Windows-based services, etc.

	Stephen
  </pre>
</blockquote>
<br>
<pre class="moz-signature" cols="$mailwrapcol">-- 
Jesse W. Asher

"They that can give up essential liberty to purchase a little temporary
safety, deserve neither liberty or safety."  - Benjamin Franklin
</pre>
<br>
</body>
</html>

--------------040300060309030401000402--


