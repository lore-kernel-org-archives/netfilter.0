From: "John Lumby" <johnlumby@hotmail.com>
Subject: how to override OUTPUT routing (like mangle ROUTE --oif)
Date: Tue, 06 Dec 2005 17:50:13 -0500
Message-ID: <BAY108-F24B61E17FE9E13D5218AC0A3400@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On my machine (linux 2.6.7 but could upgrade to current), I sometimes have 
two ppp interfaces,
ppp0     is a pppoE using ADSL
ppp1     is a pt-to-pt traditional pppd over the serial port
These are both  "on the internet", i.e. both have genuine external internet 
addresses, let's say
ppp0     66.66.66.66
ppp1     129.129.129.129

(relevant part of) My route -n looks something like this



64.64.64.64     0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
165.165.165.165 0.0.0.0         255.255.255.255 UH    0      0        0 ppp1
0.0.0.0         64.64.64.64     0.0.0.0         UG    0      0        0 ppp0

where the first two are the remote ends of the pt-to-pt's.

I would like all tcp/udp traffic that has a source port of 25 (SMTP) to go 
out on ppp1, regardless of destination address (which could be any mail 
exchanger anywhere).    (Reason explained below)   Is there any way I can do 
this without alterning my default route?

I thought maybe I could use mangle POSTROUTING -p tcp --sport 25 -j ROUTE 
--oif=ppp1
BUT then I read this in the netfilter extensions howto:
--oif ifname

    Send the packet out using `ifname' network interface. The destination 
host must be on the same link or the interface must be a tunnel. Otherwise, 
arp resolution cannot be performed and the packet is dropped.

If I understand this, then my idea won't work as the destination address is 
many links distant.   (Didn't actually try it as it appears I don't actually 
even have the libipt_ROUTE.so).

Would iproute2 help here?      Or what?       Code it myself?     (Would try 
if feasible).   Hoping it's easier than that.

John

Reason I want to do this:     very simple - my ADSL ISP blocks SMTP traffic 
as they want to be the sole e-mail server.      Occasionally I need to 
receive large e-mails directly to my machine (into sendmail) and have a 
dial-up ISP that permits this, but I don't want any other traffic to go over 
this dial-up interface.         I arrange for the sending email MX to send 
to my ppp1 address, but (my) sendmail then likes to establish a reverse 
connection back to the external MX, and of course that goes out via the 
default gw on ppp0 - and dies at the hands of the ADSL ISP.     Currently I 
can do this the "hard" way by setting an OUTPUT log rule on --sport 25 so 
that I can see who it is going to and then selectively adding that MX's 
address into my route over dev ppp1.     Would like to automate it.



