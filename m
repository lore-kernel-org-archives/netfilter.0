From: Simon Kowallik <sub@offlineprovider.de>
Subject: Re: Question on PREROUTING and INPUT chains
Date: Sat, 09 Nov 2002 15:55:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCD21FC.6010402@offlineprovider.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------090207030800080602020301"
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
To: netfilter@lists.netfilter.org


--------------090207030800080602020301
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

  Antony Stone wrote:

>On Monday 04 November 2002 8:46 pm, Carlos Fa=C4=BFanha wrote:
>
> =20
>
>>I have a Linux box used as NAT server and firewall. All
>>requests on its port 80 are forwarded to a local webserver
>>inside my network. I want to block access to all services
>>including http from a specific external host.
>>
>>I'm using the following rule to block the host
>>
>>iptables -A INPUT -i $extint -s $hostip -j DROP
>>
>>and this one to do the NAT
>>
>>iptables -t nat -A PREROUTING -p tcp --dport 80 -d $extip -j
>>DNAT --to $webserverip:80
>>
>>The problem is that the host is blocked from accessing all
>>services but http. I've already checked if there are any
>>rules before that ACCEPT the request. It seems that prerouted
>>packets are bypassing the INPUT chain.
>>
>>Is it correct? If not, what am I doing wrong?
>>   =20
>>
>
>It is correct that routed packets bypass the INPUT chain.   Only packets=20
>destined for the firewall machien go through INPUT - packets which are goi=
ng=20
>somewhere else go through FORWARD.
>
>Therefore put your blocking rule in the FORWARD chain instead and it shoul=
d=20
>do what you want.
>
>Antony.
>
> =20
>
Perhaps this helps to better understand the "flow":
http://offlineprovider.de/site/netfilter/netfilter.php

Regards,
Simon


--------------090207030800080602020301
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
  
</head>
<body>
 Antony Stone wrote:<br>
<blockquote type="cite"
 cite="mid20021109130720.HYMA20191.mta03-svc.ntlworld.com@there">  
  <pre wrap="">On Monday 04 November 2002 8:46 pm, Carlos Fa&Auml;&iquest;anha wrote:

  </pre>
  
  <blockquote type="cite">    
    <pre wrap="">I have a Linux box used as NAT server and firewall. All
requests on its port 80 are forwarded to a local webserver
inside my network. I want to block access to all services
including http from a specific external host.

I'm using the following rule to block the host

iptables -A INPUT -i $extint -s $hostip -j DROP

and this one to do the NAT

iptables -t nat -A PREROUTING -p tcp --dport 80 -d $extip -j
DNAT --to $webserverip:80

The problem is that the host is blocked from accessing all
services but http. I've already checked if there are any
rules before that ACCEPT the request. It seems that prerouted
packets are bypassing the INPUT chain.

Is it correct? If not, what am I doing wrong?
    </pre>
  </blockquote>
  
  <pre wrap=""><!---->
It is correct that routed packets bypass the INPUT chain.   Only packets 
destined for the firewall machien go through INPUT - packets which are going 
somewhere else go through FORWARD.

Therefore put your blocking rule in the FORWARD chain instead and it should 
do what you want.

Antony.

  </pre>
</blockquote>
Perhaps this helps to better understand the "flow":<br>
<a class="moz-txt-link-freetext"
 href="http://offlineprovider.de/site/netfilter/netfilter.php">http://offlineprovider.de/site/netfilter/netfilter.php</a><br>
<br>
Regards,<br>
Simon<br>
<br>
</body>
</html>

--------------090207030800080602020301--


