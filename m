From: Michael <freeware@adsl-209-204-165-151.sonic.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local
 machine to another
Date: Tue, 01 Jul 2003 09:24:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F01B5BD.5090401@adsl-209-204-165-151.sonic.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <20030630142908.GA29083@cannon.eng.us.uu.net> <3F00986E.4040306@adsl-209-204-165-151.sonic.net> <200307010200.00067.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------000504010800000700030005"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307010200.00067.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------000504010800000700030005
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alistair Tonner wrote:

>On June 30, 2003 04:07 pm, Michael wrote:
>  
>
>>The OUTPUT chain in the nat table is
>>
>>Chain OUTPUT (policy ACCEPT)
>> target prot opt in out source     destination
>> DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.5     multiport dports 80,443
>>to:192.168.0.8 DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.6     multiport
>>dports 80,443 to:192.168.0.9
>>    
>>
>	Please read this page
>	
>	http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-3.html
>
I've read it before. How is it relevant?

>	Why are you DNATting in OUTPUT?
>
Because the packets are originating on the firewall, from Squid. Squid 
thinks xxx.org is at 1.2.3.5, so DNAT is needed to change that to 
192.168.0.8.

I also have identical rules in the PREROUTING chain of the nat table, if 
you were wondering. Those rules work for requests from the Internet.


--------------000504010800000700030005
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
Alistair Tonner wrote:<br>
<blockquote type="cite" cite="mid200307010200.00067.Alistair@nerdnet.ca">
  <pre wrap="">On June 30, 2003 04:07 pm, Michael wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">The OUTPUT chain in the nat table is

Chain OUTPUT (policy ACCEPT)
 target prot opt in out source     destination
 DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.5     multiport dports 80,443
<a class="moz-txt-link-freetext" href="to:192.168.0.8">to:192.168.0.8</a> DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.6     multiport
dports 80,443 <a class="moz-txt-link-freetext" href="to:192.168.0.9">to:192.168.0.9</a>
    </pre>
  </blockquote>
  <pre wrap=""><!---->	Please read this page
	
	<a class="moz-txt-link-freetext" href="http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-3.html">http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-3.html</a></pre>
</blockquote>
I've read it before. How is it relevant?<br>
<blockquote type="cite" cite="mid200307010200.00067.Alistair@nerdnet.ca">
  <pre wrap="">	Why are you DNATting in OUTPUT?</pre>
</blockquote>
Because the packets are originating on the firewall, from Squid. Squid
thinks xxx.org is at 1.2.3.5, so DNAT is needed to change that to
192.168.0.8.<br>
<br>
I also have identical rules in the PREROUTING chain of the nat table,
if you were wondering. Those rules work for requests from the Internet.<br>
<br>
</body>
</html>

--------------000504010800000700030005--


