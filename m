From: Uwe Eisner <Uwe.Eisner@globit.com>
Subject: Re: SNAT does not work
Date: Thu, 06 Jun 2002 16:45:42 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFF7596.4090300@globit.com>
References: <3CFF6327.5020306@globit.com> <200206061357.g56DvOA31162@vulcan.rissington.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------020309070609030005010307"
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org


--------------020309070609030005010307
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Antony Stone schrieb:

>On Thursday 06 June 2002 2:27 pm, Uwe Eisner wrote:
>
>Hi.
>
>Having read your email again, I realise that I do not understand what problem 
>you're having...
>
>  
>
>>I'm using a internal ip-range, wherefor I need NAT to connecting to the
>>internet..
>>    
>>
>
>Okay, yes - I understand that.
>
>  
>
>>My problem is, that this rule does not work. When I start a Perl-code at
>>the www, witch shows me my ip-address, it showes me the IP-address of
>>the external interface of the router/firewall.
>>    
>>
>
>Surely that means that your address translation *is* working ?
>
But why is the external ip-address from the firewall showen at the www? 
I specifyed the IP-address 141.12.218.99 not 141.12.129.9 (ext. 
Router-IP-Address)

>
>1. If it were not, the remote web server would not be able to establish a 
>connection.
>
>2. The external address of the firewall is the address you would expect to be 
>coming from when yu use the SNAT rule.
>
>3. If you are running a Perl script, I assume that means that a TCP 3-way 
>handshake has been completed, which means the web server has successfully 
>been able to send packets back to your client.
>
>  
>
>>I can not find the problem.
>>    
>>
>
>What *is* the problem ?
>
>  
>
>>If I set no POSTROUTING rule, it is the same game...
>>    
>>
>
>I do not understand what you mean by this.   Surely you do not mean that if 
>you remove the POSTROUTING rule, you can still connect to a remote web server 
>and have a Perl script tell you your source address ???
>
Yes, that is it! I removed every POSTROUTING rule, but I could still 
connect to the web.

>
>Maybe you can explain a little more for me ?
>
Of cause. :-)
First I configured the Firewall, with a MASQUERADE rule, which shows the 
www the external ip-address of the router/firewall.
I removed the statement from the configuration script and add the new role:
    iptables -A POSTROUTING -t nat -s 192.168.0.0/16 -j SNAT --to-source 
141.12.218.1
Afterwards I typed the flash command 'iptables -F'. Now ALL rules should 
be removed, souldn't it?
I started my configuration script with the new rule (see above), but 
nothing has changed.

First I tought, that iptables -F does not delete the POSTROUTING rules, 
so I did it by hand:
iptables -D POSROUTING -t nat -s 192.168.0.0/16 -j MASQUERADE.

The same procedure, as discribed above and nothing has changed.

My plan is, that our network showes to the www just 1 ip-address, namely 
141.12.218.99 and not the router-ip-address 141.12.129.9

Hope that is more information for you.

Thx
Uwe Eisner


>
>
>Antony.
>  
>


--------------020309070609030005010307
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
<br>
Antony Stone schrieb:<br>
<blockquote type="cite"
 cite="mid200206061357.g56DvOA31162@vulcan.rissington.net">
  <pre wrap="">On Thursday 06 June 2002 2:27 pm, Uwe Eisner wrote:

Hi.

Having read your email again, I realise that I do not understand what problem 
you're having...

  </pre>
  <blockquote type="cite">
    <pre wrap="">I'm using a internal ip-range, wherefor I need NAT to connecting to the
internet..
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Okay, yes - I understand that.

  </pre>
  <blockquote type="cite">
    <pre wrap="">My problem is, that this rule does not work. When I start a Perl-code at
the www, witch shows me my ip-address, it showes me the IP-address of
the external interface of the router/firewall.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Surely that means that your address translation *is* working ?</pre>
</blockquote>
But why is the external ip-address from the firewall showen at the www? I
specifyed the IP-address 141.12.218.99 not 141.12.129.9 (ext. Router-IP-Address)<br>
<blockquote type="cite"
 cite="mid200206061357.g56DvOA31162@vulcan.rissington.net">
  <pre wrap="">

1. If it were not, the remote web server would not be able to establish a 
connection.

2. The external address of the firewall is the address you would expect to be 
coming from when yu use the SNAT rule.

3. If you are running a Perl script, I assume that means that a TCP 3-way 
handshake has been completed, which means the web server has successfully 
been able to send packets back to your client.

  </pre>
  <blockquote type="cite">
    <pre wrap="">I can not find the problem.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
What *is* the problem ?

  </pre>
  <blockquote type="cite">
    <pre wrap="">If I set no POSTROUTING rule, it is the same game...
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I do not understand what you mean by this.   Surely you do not mean that if 
you remove the POSTROUTING rule, you can still connect to a remote web server 
and have a Perl script tell you your source address ???</pre>
</blockquote>
Yes, that is it! I removed every POSTROUTING rule, but I could still connect
to the web.<br>
<blockquote type="cite"
 cite="mid200206061357.g56DvOA31162@vulcan.rissington.net">
  <pre wrap="">

Maybe you can explain a little more for me ?</pre>
</blockquote>
Of cause. :-)<br>
First I configured the Firewall, with a MASQUERADE rule, which shows the
www the external ip-address of the router/firewall.<br>
I removed the statement from the configuration script and add the new role:<br>
&nbsp;&nbsp;&nbsp; <b>iptables -A POSTROUTING -t nat -s 192.168.0.0/16 -j SNAT --to-source
141.12.218.1</b><br>
Afterwards I typed the flash command 'iptables -F'. Now ALL rules should
be removed, souldn't it?<br>
I started my configuration script with the new rule (see above), but nothing
has changed.<br>
<br>
First I tought, that iptables -F does not delete the POSTROUTING rules, so
I did it by hand:<br>
iptables -D POSROUTING -t nat -s 192.168.0.0/16 -j MASQUERADE.<br>
<br>
The same procedure, as discribed above and nothing has changed.<br>
<br>
My plan is, that our network showes to the www just 1 ip-address, namely
141.12.218.99 and not the router-ip-address 141.12.129.9<br>
<br>
Hope that is more information for you.<br>
<br>
Thx <br>
Uwe Eisner<br>
<br>
<br>
<blockquote type="cite"
 cite="mid200206061357.g56DvOA31162@vulcan.rissington.net">
  <pre wrap="">


Antony.
  </pre>
</blockquote>
<br>
</body>
</html>

--------------020309070609030005010307--


