From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: Blocking Google Earth
Date: Sat, 13 Aug 2005 11:14:44 -0300
Message-ID: <42FE0054.5020204@solutti.com.br>
References: <20050812201225.CE6DD2128@juno.tc.df.gov.br>	<42FD06B6.4080209@imag.fr>	<20050812223230.14D0920EB@juno.tc.df.gov.br>
	<200508130431.24772.arny@ats.s.bawue.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508130431.24772.arny@ats.s.bawue.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


    I really dont think it's easy to limit bandwidth usage ONLY for 
Earth Google without making bad experiencies on doing searchs on Google. 
No matter if searches are low-bandwidth. If you get some QoS and band 
limitation on google IPs, be sure that your google earth users will use 
ALL the available bandwidth, thus making google earth as well as google 
serching probably extremely slow.

    I'm actually making some limitations on Google Earth on the HTTP 
proxy, squid. Several of them are running transparent. User doesnt need 
to configure it on the browser. In some cases, I have squid running 
without caching and without logging. They are running JUST for limiting 
that !!!!

    On the actual version, software Google Earth seems to get 
information using HTTP. I just get this from my squid log file:

Sat Aug 13 10:59:51 2005 949 192.168.1.50 TCP_MISS/200 15300 GET 
http://kh.google.com/flatfile?f1-0023212010203-i.4 - 
DIRECT/64.233.179.93 application/octet-stream
Sat Aug 13 10:59:53 2005 1979 192.168.1.50 TCP_MISS/200 2631 GET 
http://kh.google.com/flatfile?f1c-0023212010331-t.1 - 
DIRECT/64.233.179.93 application/octet-stream
Sat Aug 13 10:59:53 2005 4464 192.168.1.50 TCP_MISS/200 18827 GET 
http://kh.google.com/flatfile?f1-0023212010312-i.4 - 
DIRECT/64.233.179.93 application/octet-stream
Sat Aug 13 10:59:54 2005 3026 192.168.1.50 TCP_MISS/200 20208 GET 
http://kh.google.com/flatfile?f1-0023212010320-i.4 - 
DIRECT/64.233.179.91 application/octet-stream
Sat Aug 13 10:59:54 2005 5746 192.168.1.50 TCP_MISS/200 20088 GET 
http://kh.google.com/flatfile?f1-0023212010313-i.4 - 
DIRECT/64.233.179.91 application/octet-stream

    So, using some simpe ACLs (for kh.google.com for example) and Delay 
Access features, you can easily make heavy limitation on Google Earth 
software without making bad experiencies for google searching users.

    Now let's go to Google Maps, http://maps.google.com/

    This is Google Maps in the 'Map' view:

Sat Aug 13 11:10:23 2005 1347 192.168.1.50 TCP_MISS/200 6745 GET 
http://mt.google.com/mt?v=w2.5&x=15294&y=25565&zoom=1 - 
DIRECT/64.233.179.99 image/png
Sat Aug 13 11:10:23 2005 1352 192.168.1.50 TCP_MISS/200 7662 GET 
http://mt.google.com/mt?v=w2.5&x=15294&y=25567&zoom=1 - 
DIRECT/64.233.179.104 image/png
Sat Aug 13 11:10:24 2005 1686 192.168.1.50 TCP_MISS/200 10810 GET 
http://mt.google.com/mt?v=w2.5&x=15294&y=25566&zoom=1 - 
DIRECT/64.233.179.104 image/png

    This is Google Maps in the 'Satellite' view:

(here's our kh.google.com again !!)

Sat Aug 13 11:11:14 2005 2169 192.168.1.50 TCP_MISS/200 19040 GET 
http://kh.google.com/kh?v=3&t=tqtsrrqsssrt - DIRECT/64.233.179.93 image/jpeg
Sat Aug 13 11:11:14 2005 2169 192.168.1.50 TCP_MISS/200 11572 GET 
http://kh.google.com/kh?v=3&t=tqtsrrqsssst - DIRECT/64.233.179.91 image/jpeg
Sat Aug 13 11:11:14 2005 2321 192.168.1.50 TCP_MISS/200 14974 GET 
http://kh.google.com/kh?v=3&t=tqtsrrqssssq - DIRECT/64.233.179.93 image/jpeg
Sat Aug 13 11:11:16 2005 1701 192.168.1.50 TCP_MISS/200 11026 GET 
http://kh.google.com/kh?v=3&t=tqtsrrqsssts - DIRECT/64.233.179.91 image/jpeg
Sat Aug 13 11:11:16 2005 1511 192.168.1.50 TCP_MISS/200 13554 GET 
http://kh.google.com/kh?v=3&t=tqtsrrqssstq - DIRECT/64.233.179.93 image/jpeg

    And this is Google Maps in the 'Hybrid' view:

Sat Aug 13 11:11:49 2005 385 192.168.1.50 TCP_MISS/200 4454 GET 
http://mt.google.com/mt?v=w2t.1&x=476&y=796&zoom=6 - 
DIRECT/64.233.179.104 image/png
Sat Aug 13 11:11:49 2005 442 192.168.1.50 TCP_MISS/200 3052 GET 
http://mt.google.com/mt?v=w2t.1&x=479&y=800&zoom=6 - 
DIRECT/64.233.179.99 image/png
Sat Aug 13 11:11:49 2005 465 192.168.1.50 TCP_MISS/200 2917 GET 
http://mt.google.com/mt?v=w2t.1&x=477&y=796&zoom=6 - 
DIRECT/64.233.179.99 image/png
Sat Aug 13 11:11:49 2005 571 192.168.1.50 TCP_MISS/200 2674 GET 
http://mt.google.com/mt?v=w2t.1&x=475&y=800&zoom=6 - 
DIRECT/64.233.179.104 image/png
Sat Aug 13 11:11:49 2005 445 192.168.1.50 TCP_MISS/200 1083 GET 
http://mt.google.com/mt?v=w2t.1&x=475&y=797&zoom=6 - 
DIRECT/64.233.179.104 image/png
Sat Aug 13 11:11:49 2005 389 192.168.1.50 TCP_MISS/200 2862 GET 
http://mt.google.com/mt?v=w2t.1&x=479&y=796&zoom=6 - 
DIRECT/64.233.179.99 image/png
Sat Aug 13 11:11:49 2005 391 192.168.1.50 TCP_MISS/200 3782 GET 
http://mt.google.com/mt?v=w2t.1&x=476&y=800&zoom=6 - 
DIRECT/64.233.179.99 image/png

    And let's not forget the new Google Moon:

Sat Aug 13 11:13:13 2005 2366 192.168.1.50 TCP_MISS/200 22795 GET 
http://moon.google.com/kh?v=2&t=ttqqq - DIRECT/66.102.7.99 image/jpeg
Sat Aug 13 11:13:13 2005 2678 192.168.1.50 TCP_MISS/200 22970 GET 
http://moon.google.com/kh?v=2&t=tqttq - DIRECT/64.233.187.99 image/jpeg
Sat Aug 13 11:13:13 2005 3703 192.168.1.50 TCP_MISS/200 24877 GET 
http://moon.google.com/kh?v=2&t=trsss - DIRECT/66.102.7.147 image/jpeg
Sat Aug 13 11:13:14 2005 3365 192.168.1.50 TCP_MISS/200 23140 GET 
http://moon.google.com/kh?v=2&t=tqttt - DIRECT/66.102.7.104 image/jpeg
Sat Aug 13 11:13:15 2005 2579 192.168.1.50 TCP_MISS/200 25423 GET 
http://moon.google.com/kh?v=2&t=tsrrr - DIRECT/66.102.7.99 image/jpeg


    With these URLs and a transparent http proxy running, you can surely 
imply hard limitations on bandwidth usage for Google Earth/Maps/Moon 
services.

    Only with iptables/QoS features ? Can be done, but i'm sure it will 
not be so efficient and maybe not low-CPU solution as with squid. Of 
course you can use string and look for 'kh.google.com' .... but that 
would certainly blow your CPUs. You can use layer7, but you would have a 
great amount of CPU usage as well.


    Sincerily,
    Leonardo Rodrigues



Thilo Schulz escreveu:

>On Saturday 13 August 2005 00:38, fabricio bianco abreu wrote:
>  
>
>>I would like to block it because a user using Google Earth consumes about
>>256kbps bandwith. I have 600+ users and only a 2Mbps link to the Internet.
>>    
>>
>
>I don't see how you would do that without doing a packet inspection for all 
>packets directed at www.google.com, as maps.google.com is - as you 
>undoubtedly already know - is an alias for www.google.com
>You would have to do packet inspection and filter for maps.google.com. This 
>could be easily circumvented by using an SSL capable proxy.
>
>Maybe QoS could do the trick for you. While allowing access to google earth, 
>it might discourage that user from excessively using it by restricting his 
>bandwidth to something like 64kbit/s while google itself is still perfectly 
>usable. It is generally a sensible idea to make use of QoS on a setup like 
>yours.
>
>  
>
