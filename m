From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Re: Query: Can Netfilter inspect xml soap traffic
Date: Wed, 26 Mar 2008 16:39:33 +0000
Message-ID: <47EA7C45.4030700@tssg.org>
References: <47E913B6.4080004@tssg.org> <47E92B5A.5030903@riverviewtech.net> <47E93099.9010602@tssg.org> <m3abkmy3ug.fsf@ursa.amorsen.dk> <47E95CE5.2020402@riverviewtech.net>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E95CE5.2020402@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks Benny and Grant,

I whole heartily agree that the term "firewall" is overloaded.

We also now have the term UTM's (Unified Threat Management appliances) 
used to drift away from the "firewall" term but is essentially the same 
thing (access control via firewall, ids, av etc).

A lot of focus in relation to web services is on xml firewalls (or other 
relevant ALG's). There seems to be no role for network-level firewalls 
like Netfilter (that can also filter to a degree at layer 7).

I still stand over the idea that:

"deploying a network level firewall provisioned for Enterprise Web 
Services is not simply about opening port 80 on the server for all 
traffic; one may wish to deny certain nodes (IP addresses, etc.), only 
accept HTTP traffic from some nodes, require other nodes to use HTTPS 
and also deal with HTTP traffic that is tunneled through proxies 
available on other ports."

But I have found no examples in literature. The above is something that 
an XML firewall cannot do.

Is there anyone out there that can give a typical enterprise web service 
scenario/architecture that justifies network level firewall protection?

What is actual practice? Surely is not just a simple firewall rule:

iptables -A FORWARD -p tcp --dport http -j ACCEPT

Surely its more complicated than what the application developers suggest 
is required.

For example: only permit a business partners subnet to and from a 
specific web service.

iptables -A FORWARD -i eth0 -s 193.1.1.0/0 -d  -p tcp --dport http -j ACCEPT
iptables -A FORWARD -o eth1 -s 192.168.1.1 -d 192.168.1.1 -p tcp --sport 
http -j ACCEPT

an other example might be to limit dos attacks at a network level to an 
enterprise web service:
iptables -A FORWARD -i eth0  -d 192.168.1.1-p tcp -dport http --syn -m 
limit --limit 5/s -j ACCEPT


any other examples of protecting web services at a network level are 
welcome?

I realize the firewalls are prone to "tunnel" problems over 80 and 443, 
in that how can we decipher what is genuine http traffic, soap, skype 
and so forth. DPI helps to an extent.

What happens if you are running both a standard web server and a web 
service that both use port 80? Would it be normal practice to assign a 
different port for example 8080 to the web service.

Surely Web Services don't have to operate over 80 and 443!

If anyone knows of any documentation that specifically includes the 
importance of firewalls (in particular, network firewalls) in an SOA 
please let me know.

In terms of compliance standards like HIPPA, PCI DSS and so forth a 
firewall is mandatory even though some people are calling for an end to 
firewalls using the term "de-perimeterization".

regards,
Will.


Grant Taylor wrote:
> On 03/25/08 14:56, Benny Amorsen wrote:
>> Anyway, with the Level-7 match or Deep Packet Inspection or whichever 
>> buzz words you prefer, packet filters are closer in capabilities than 
>> ever before. At the same time application level proxies are faster 
>> than ever before. It's hard to pick a winner.
> 
> Very good point.
> 
> I suppose one thing to think about is who is going to maintain what. 
> Developers would probably be able to maintain (add / change / delete 
> rules) an ALG better where as network administration staff would 
> probably be able to maintain a hardware firewall better.  Of course, why 
> not use some of each.  Use the hardware firewall for the lower end 
> simpler aspects of it while using the ALG for the higher end more 
> specific aspects.  Let the hardware ASICs do what they do best while 
> letting the ALG do what it does best.
> 
> 
> 
> Grant. . . .
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William M. Fitzgerald,
PhD Student,
Telecommunications Software & Systems Group,
ArcLabs Research and Innovation Centre,
Waterford Institute of Technology,
WIT West Campus,
Carriganore,
Waterford.
Office Ph: +353 51 302937
Mobile Ph: +353 87 9527083
Web: www.williamfitzgerald.org
      www.linkedin.com/in/williamfitzgerald
      www.ryze.com/go/wfitzgerald



