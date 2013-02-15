From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 12:04:54 -0600
Message-ID: <20130215180453.GK3672@harrier.slackbuilds.org>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Feb 15, 2013 at 11:24:15AM -0500, John Corps wrote:
> I am having issues with redirecting DNS requests to the internal 
> dns server. I have a very simple setup, if someone is put into vlan 
> 1000 then they do not get internet access at all. If they keep the 
> DNS server assigned by DHCP, which is the IP of the gateway in vlan 
> 1000, every request they make to a website is resolved to this IP 
> and served up the webpage stating no internet is available. If they 
> are clever enough to set there own DNS servers, when they open a 
> browser, they do not get anything at all, just page can't be 
> displayed.

A web browser is not useful as a DNS diagnostic tool. Become familiar 
with dig(1) for that purpose.

> I have not done anything with iptables yet as the 
> internal dns server is just resolving everything to the local IP 
> address. What I want to do is if they set there own DNS, redirect 
> them anyways back to the internal DNS.

This might not be possible, because of the way DNS works. A caching
nameserver doing recursion will require authoritative answers from 
[what it believes are] authoritative NS hosts for a zone. Since it's 
being redirected and not actually contacting the parent zones for 
referral, it will not be seeing the kind of responses it expects.

> Here are the only 2 rules I 
> have tried but they do not work at all, maybe i am missing 
> something? Any help would be greatly appreciated!
> 
> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp 
> --dport 53 -j REDIRECT --to-ports 53
> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp 
> --dport 53 -j REDIRECT --to-ports 53

I'd always restrict any NAT rule by interface, in this case -i for 
the incoming interface.

Use targeted dig commands to find out what's happening. Examples:
$ dig @your.ip.add.ress netfilter.org. any
$ dig @8.8.4.4 netfilter.org. any
$ dig @random.ip.add.ress netfilter.org. any
$ dig @193.175.24.33 netfilter.org. any

(The last of those is one of the NS hosts for netfilter.org.)
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
