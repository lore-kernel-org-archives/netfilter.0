From: ken scott <kscott9@triad.rr.com>
Subject: Transparent proxy single machine question
Date: Sat, 26 Jun 2004 17:14:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DDE74E.2000103@triad.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am trying to build a single machine that  performs web filtering 
(using DansGuardian)  for several users.
The box (Morphix/Debian system) will be behind a cable router and has 
five users (kids).  
I have running Dansguardian and Squid correctly in normal proxy mode.  
The next step is to make the proxy transparent
so that users cannot bypass the Danguardian/squid path simply by telling 
their browser to connect directly.
I have looked around and see instructions on this at several places 
(mostly for non-single machine implementations)
and know I need a line something like like:

 iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8181

       where 8181 is where Dansguardian is listening.

I also need to configure squid with (I think) :

 http_port 3128     # where squid is listening
 httpd_accel_host virtual
 httpd_accel_port 80
 httpd_accel_with_proxy  on
 httpd_accel_uses_host_header on        //
 httpd_accel_single_host off

The question is, on a single machine, will this work?  
The part I can't figure out pertains to when squid finally wants to send out the actual
request to the internet, isn't that a port 80 request that the above iptables rule will 
redirect back to Danguardian??
Please reply all as I am not quite sure than I have joined the list correctly.
Thanks in advance
Ken S.


                




                http_port 3128
                httpd_accel_host virtual
                httpd_accel_port 80
                httpd_accel_with_proxy  on
                httpd_accel_uses_host_header on
                

Squid 2.4 needs an /additional/ line added:

                httpd_accel_single_host off
                





