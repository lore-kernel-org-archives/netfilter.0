From: Michael <freeware@adsl-209-204-165-151.sonic.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local
 machine to another
Date: Wed, 02 Jul 2003 14:39:37 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F035119.8000907@adsl-209-204-165-151.sonic.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <200307010200.00067.Alistair@nerdnet.ca> <3F01B5BD.5090401@adsl-209-204-165-151.sonic.net> <200307020206.13952.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------040201070200040100010109"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307020206.13952.Alistair@nerdnet.ca>
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
--------------040201070200040100010109
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alistair Tonner wrote:

>On July 1, 2003 12:24 pm, Michael wrote:
>  
>
>>Alistair Tonner wrote:
>>    
>>
>>>	Why are you DNATting in OUTPUT?
>>>      
>>>
>>Because the packets are originating on the firewall, from Squid. Squid
>>thinks xxx.org is at 1.2.3.5, so DNAT is needed to change that to
>>192.168.0.8.
>>
>>I also have identical rules in the PREROUTING chain of the nat table, if
>>you were wondering. Those rules work for requests from the Internet.
>>    
>>
>	Okay .. .after reading up some on 1.2.8 ... that *should* 
>	work.  BUT .. to me it seems evil ... I'm forever bound by 
>	the concept that mangling the destination (or source for that matter)
>	should be done before or after the basic network routing has been done.
>
Routing is done to locally-generated packets after OUTPUT. See 
http://www.netfilter.org/documentation/HOWTO//netfilter-hacking-HOWTO-3.html

>	it seems unessesary to me for this reason:
>
>	squid calls to the resolved ip (your outside ip) ...which should route
>	out of the firewall, and back to its outside IP .. then the PREROUTING 
>	rules should catch these packets and reroute them correctly,
>	then the RETURN path would make sense.  It seems to me that 
>	DNATTING directly in output to force the packets out to the 
>	inside IP shortcuts things, and then breaks the return path.
>
If I remove the nat table's OUTPUT chain rules, I get a "connection 
refused", because there is no Web server running on 1.2.3.5 port 80. 
Locally-generated packets do not go through PREROUTING. They don't go 
"out of the firewall" unless they get routed there, and if that happens, 
they aren't coming back unless another machine returns them.

I'll post to LARTC.


--------------040201070200040100010109
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
<blockquote type="cite" cite="mid200307020206.13952.Alistair@nerdnet.ca">
  <pre wrap="">On July 1, 2003 12:24 pm, Michael wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Alistair Tonner wrote:
    </pre>
    <blockquote type="cite">
      <pre wrap="">	Why are you DNATting in OUTPUT?
      </pre>
    </blockquote>
    <pre wrap="">Because the packets are originating on the firewall, from Squid. Squid
thinks xxx.org is at 1.2.3.5, so DNAT is needed to change that to
192.168.0.8.

I also have identical rules in the PREROUTING chain of the nat table, if
you were wondering. Those rules work for requests from the Internet.
    </pre>
  </blockquote>
  <pre wrap=""><!---->	Okay .. .after reading up some on 1.2.8 ... that *should* 
	work.  BUT .. to me it seems evil ... I'm forever bound by 
	the concept that mangling the destination (or source for that matter)
	should be done before or after the basic network routing has been done.</pre>
</blockquote>
Routing is done to locally-generated packets after OUTPUT. See
<a class="moz-txt-link-freetext" href="http://www.netfilter.org/documentation/HOWTO//netfilter-hacking-HOWTO-3.html">http://www.netfilter.org/documentation/HOWTO//netfilter-hacking-HOWTO-3.html</a><br>
<blockquote type="cite" cite="mid200307020206.13952.Alistair@nerdnet.ca">
  <pre wrap="">	it seems unessesary to me for this reason:

	squid calls to the resolved ip (your outside ip) ...which should route
	out of the firewall, and back to its outside IP .. then the PREROUTING 
	rules should catch these packets and reroute them correctly,
	then the RETURN path would make sense.  It seems to me that 
	DNATTING directly in output to force the packets out to the 
	inside IP shortcuts things, and then breaks the return path.</pre>
</blockquote>
If I remove the nat table's OUTPUT chain rules, I get a "connection
refused", because there is no Web server running on 1.2.3.5 port 80. 
Locally-generated packets do not go through PREROUTING. They don't go
"out of the firewall" unless they get routed there, and if that
happens, they aren't coming back unless another machine returns them.<br>
<br>
I'll post to LARTC.<br>
<br>
</body>
</html>

--------------040201070200040100010109--


