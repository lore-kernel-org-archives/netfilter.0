From: Dimitar Katerinski <train@bofh.bg>
Subject: Re: Transparent proxy single machine question
Date: Sun, 27 Jun 2004 00:51:40 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DDEFEC.5000205@bofh.bg>
References: <40DDE99C.7060001@triad.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40DDE99C.7060001@triad.rr.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: kscott9@triad.rr.com

ken scott wrote:
> I am trying to build a single machine that  performs web filtering
> (using DansGuardian)  for several users.
> The box (Morphix/Debian system) will be behind a cable router and has
> five users (kids).
> I have running Dansguardian and Squid correctly in normal proxy mode.
> The next step is to make the proxy transparent
> so that users cannot bypass the Danguardian/squid path simply by telling
> their browser to connect directly.
> I have looked around and see instructions on this at several places
> (mostly for non-single machine implementations)
> and know I need a line something like like:
> 
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8181
> 
>       where 8181 is where Dansguardian is listening.
> 
> I also need to configure squid with (I think) :
> 
> http_port 3128     # where squid is listening
> httpd_accel_host virtual
> httpd_accel_port 80
> httpd_accel_with_proxy  on
> httpd_accel_uses_host_header on
> httpd_accel_single_host off
> 
> The question is, on a single machine, will this work?
> The part I can't figure out pertains to when squid finally wants to send 
> out the actual
> request to the internet, isn't that a port 80 request that the above 
> iptables rule will
> redirect back to Dansguardian??
> Please reply all as I am not quite sure than I have joined the list 
> correctly.
> Thanks in advance
> Ken S.

Hello ken,

Yes, on single machine it will work with no problems. You should specify 
an incoming interface for the above iptables rule though. Do it like this:

iptables -t nat -A PREROUTING -i $LAN_IFACE -p tcp --dport 80 -j 
REDIRECT --to-ports 8181

where $LAN_IFACE is the interface connected to your internal network.

And the scheme is as follows:
1. A client sends request for specific page
2. The linux box sees its a request for destination port 80 and 
redirects it to port 8181 where DG is listening.
3. DG takes the request, do what it does (content filtering, etc.), and 
sends it to Squid.
4. Squid request the specific page, and gives it back to DG, which again 
do what it does.
5. DG then, if everything is ok, server the request page to the client.


About your question:
 > ..when squid finally wants to send
 > out the actual
 > request to the internet, isn't that a port 80 request that the above
 > iptables rule will
 > redirect back to Dansguardian??

No basicly it won't. Unless you dont have same rule in the OUTPUT chain 
of the nat table. the PREROUTING chain applies to packets which hit the 
box coming from somewhere outside, and not packets which origin from the 
machine itself.
Hope I was able to clarify all this to you.



Regards,
Dimitar

-- 
"The only thing necessary for the triumph of evil is for good men to do 
nothing."
                                                   --Edmund Burke.

