From: =?ISO-8859-1?Q?Javier_Prieto_Mart=EDnez?= 
	<javier.prieto.ext@juntadeandalucia.es>
Subject: Re: Redirecting ports in a bridge
Date: Tue, 22 Apr 2008 17:10:55 +0200
Message-ID: <480DFFFF.7090807@juntadeandalucia.es>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <4808B26F.4060205@riverviewtech.net> <480C3A6A.3090206@juntadeandalucia.es> <480D3FA2.4050000@riverviewtech.net> <480D8272.1020200@juntadeandalucia.es> <480DF644.8010302@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480DF644.8010302@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>


>> Thanks for the advice. I'll try with EBTables, then.
>
> *nod*
>
> Except for possibly some syntactical change your rules should be very 
> similar and operate in the same fashion.
>
> Based on your previous statement "I don't want to mess with the real 
> IPs" it sounds like you don't even want to change source / destination 
> IPs of the traffic going to the back end system.  Am I understanding 
> you correctly that you indeed want to not alter the source and / or 
> destination IP?  If this is the case, be aware that you do not want to 
> NAT the IP and that you will be down to NATing the MAC address (which 
> can be done but is another discussion) as the frame is passing through 
> the bridge.
>
> I guess I should ask:
>
> +---+         +---+   +---+   +---+
> | C +-- - - --+ R +---+ A +---+ S |
> +---+         +---+   +---+   +---+
>
> Presuming that C is the client, R is the router, A is the appliance, 
> and S is one or more of the servers, do you want S to see the source 
> and destination IP that the client connected to?  Or is it ok for the 
> appliance to munge the source and / or destination IP (as seen by the 
> server) in the process of redirecting to the server?

Well.. I don't speak English very well, so it's easy to misunderstand my 
posts :-)

In your graph, "S" is my LAN with my all my servers and local 
workstations. When I say that "I don't want to mess with the real IPs", 
I mean I don't want to make any change within my LAN.

The point of the redirection is that, when I need to make a change in 
one of my servers, I'd like my appliance to redirect all the traffic 
coming from the extranet ("C") to another server. For example, if I have 
to stop the web server while upgrading, I'd like all the traffic coming 
from outside to reach another web server with a catched version of my 
web page.

The proccess should be something like that:

* C starts a connection to S1, port 80
* R routes that packet to my LAN
* A captures that packet, and changes the destintation to S2, port 80
* S2 generates a response to C
* A captures that packet, and changes its source to S1, port 80
* R routes that packet to the outside network
* C gets a packet from S1, port 80

I'm making some tests with EBTables in my lab enviroment.
I'll tell you the results.

Thanks a lot.
