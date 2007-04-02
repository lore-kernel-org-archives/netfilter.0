From: edwardspl@ita.org.mo
Subject: Re: view function of Bind 9
Date: Mon, 02 Apr 2007 21:05:38 +0800
Message-ID: <4610FFA2.5050803@ita.org.mo>
References: <460FBE05.7040706@ita.org.mo>	<1175439824.4451.3.camel@serge.lan.cameratim.com>	<460FD2E3.5020108@ita.org.mo>
	<1175481417.3195.69.camel@serge.lan.cameratim.com>
Reply-To: For users of Fedora <fedora-list@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1881610430=="
Return-path: <fedora-list-bounces@redhat.com>
In-Reply-To: <1175481417.3195.69.camel@serge.lan.cameratim.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/fedora-list>
List-Post: <mailto:fedora-list@redhat.com>
List-Help: <mailto:fedora-list-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=subscribe>
Sender: fedora-list-bounces@redhat.com
Errors-To: fedora-list-bounces@redhat.com
To: For users of Fedora <fedora-list@redhat.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--===============1881610430==
Content-Type: multipart/alternative;
	boundary="------------020408030207020000060208"

This is a multi-part message in MIME format.
--------------020408030207020000060208
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Tim wrote:

>On Sun, 2007-04-01 at 23:42 +0800, edwardspl@ita.org.mo wrote:
>
>  
>
>>Does your system as the following sample ?
>>
>>eg : 
>>For Public IP ( from ISP ) : 
>>IP range : 202.175.123.123 ~ 202.175.123.129 ( I want to use
>>202.175.123.123 trasnfer to 192.168.0.1 Server machine )
>>    
>>
>
>Your router needs to associate those last two addresses together.  Are
>you using a configurable one?
>
>Depending on your network, you might connect 202.175.123.123 to
>192.168.0.1 with rules.  You might set that computer to use
>202.175.123.123 as its address, directly.  If you have a series of
>public addresses that you can use, you *can* use them directly.
>
>  
>
>>subnet mask : 255.255.255.240 ( I want to trasnfer to 255.255.255.0 )
>>    
>>
>
>Don't know what you mean.
>
>  
>
>>Router IP : 202.175.123.128 ( So, how to trasnfer to 192.168.0.254,
>>due to via the Router machine first ! )
>>    
>>
>
>Can't understand that, either.  It's an incoherent mix of words.
>
>How is your network physically set up?  Do you have a modem connected to
>a router, connected to a network of computers?  Is the modem a
>combination modem and router?  Is your router a "router" or a computer
>working as one?  How are the other computers connected?
>
>  
>
>>For Private IP ( All of Server under LAN environment ) : 
>>IP :  192.168.0.1 ( I want to tranfer to 202.175.123.123 ) 
>>subnet mask : 255.255.255.0 ( I want to tranfer to 255.255.255.240 ) 
>>Router IP : 192.168.0.254 ( I want to tranfer to 202.175.123.128 ) 
>>
>>For Client IP ( via NAT + DHCP of the Server ) : 
>>Ip : 192.168.1.1 ~ 192.168.1.50
>>    
>>
>
>Don't know what you mean.  You want to set up a DHCP server to dole out
>those addresses?  You want to enable NAT?
>
>  
>
Hello,

After apply a leased line connection with Internet from ISP, there is a
segemnt IP addresses ( Public IP ) and a Router machine ( can't to be
enabled the firewall function ) by ISP also :

For sample :
IP range : 202.175.123.123 ~ 202.175.123.129
subnet mask : 255.255.255.240
Router IP : 202.175.123.128

Now, I'm setting up a Internet Server ( all service in the same machines ) :
There are Ethernat 0 and Ethernet 1 two Interfaces with the Server :
Ethernet 0 for connecting with HUB_A and Router, but want to use Private IP address ( eg : 192.168.0.1 ) instead of public IP ( eg : 202.175.123.123 )
Ethernet 1 for connecting with HUB_B, provide NAT + DHCP for Clients ( ip range : 192.168.1.0 / 24 )

So...how to config the firewall rules by using iptables as the following condition :
1, how to clear up the default setting ?
2, how to disable all services ?
3, how to enable the service which needed ?
4, how to transfer the ip address ( public from / to private ) ?
5, how to enable NAT + DHCP for clients users connection with Internet ?

Edward.




--------------020408030207020000060208
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=Big5" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Tim wrote:<br>
<blockquote cite="mid1175481417.3195.69.camel@serge.lan.cameratim.com"
 type="cite">
  <pre wrap="">On Sun, 2007-04-01 at 23:42 +0800, <a class="moz-txt-link-abbreviated" href="mailto:edwardspl@ita.org.mo">edwardspl@ita.org.mo</a> wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">Does your system as the following sample ?

eg : 
For Public IP ( from ISP ) : 
IP range : 202.175.123.123 ~ 202.175.123.129 ( I want to use
202.175.123.123 trasnfer to 192.168.0.1 Server machine )
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Your router needs to associate those last two addresses together.  Are
you using a configurable one?

Depending on your network, you might connect 202.175.123.123 to
192.168.0.1 with rules.  You might set that computer to use
202.175.123.123 as its address, directly.  If you have a series of
public addresses that you can use, you *can* use them directly.

  </pre>
  <blockquote type="cite">
    <pre wrap="">subnet mask : 255.255.255.240 ( I want to trasnfer to 255.255.255.0 )
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Don't know what you mean.

  </pre>
  <blockquote type="cite">
    <pre wrap="">Router IP : 202.175.123.128 ( So, how to trasnfer to 192.168.0.254,
due to via the Router machine first ! )
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Can't understand that, either.  It's an incoherent mix of words.

How is your network physically set up?  Do you have a modem connected to
a router, connected to a network of computers?  Is the modem a
combination modem and router?  Is your router a "router" or a computer
working as one?  How are the other computers connected?

  </pre>
  <blockquote type="cite">
    <pre wrap="">For Private IP ( All of Server under LAN environment ) : 
IP :  192.168.0.1 ( I want to tranfer to 202.175.123.123 ) 
subnet mask : 255.255.255.0 ( I want to tranfer to 255.255.255.240 ) 
Router IP : 192.168.0.254 ( I want to tranfer to 202.175.123.128 ) 

For Client IP ( via NAT + DHCP of the Server ) : 
Ip : 192.168.1.1 ~ 192.168.1.50
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Don't know what you mean.  You want to set up a DHCP server to dole out
those addresses?  You want to enable NAT?

  </pre>
</blockquote>
Hello,<br>
<br>
After apply a leased line connection with Internet from ISP, there is a
segemnt IP addresses ( Public IP ) and a Router machine ( can't to be
enabled the firewall function ) by ISP also :<br>
<pre wrap="">For sample :
IP range : 202.175.123.123 ~ 202.175.123.129
subnet mask : 255.255.255.240
Router IP : 202.175.123.128

Now, I'm setting up a Internet Server ( all service in the same machines ) :
There are Ethernat 0 and Ethernet 1 two Interfaces with the Server :
Ethernet 0 for connecting with HUB_A and Router, but want to use Private IP address ( eg : 192.168.0.1 ) instead of public IP ( eg : 202.175.123.123 )
Ethernet 1 for connecting with HUB_B, provide NAT + DHCP for Clients ( ip range : 192.168.1.0 / 24 )

So...how to config the firewall rules by using iptables as the following condition :
1, how to clear up the default setting ?
2, how to disable all services ?
3, how to enable the service which needed ?
4, how to transfer the ip address ( public from / to private ) ?
5, how to enable NAT + DHCP for clients users connection with Internet ?

Edward.
</pre>
<br>
<br>
</body>
</html>

--------------020408030207020000060208--


--===============1881610430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
fedora-list mailing list
fedora-list@redhat.com
To unsubscribe: https://www.redhat.com/mailman/listinfo/fedora-list
--===============1881610430==--

