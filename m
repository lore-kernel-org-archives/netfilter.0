From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Unwanted traffic to be FORWARD-ed is dropped by filter : ARP
 cache	problem?
Date: Mon, 18 Oct 2004 10:14:48 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4173DDE8.1040600@pbl.ca>
References: <20041017075414.78289.qmail@web20021.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041017075414.78289.qmail@web20021.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jordi Warmenhoven <penguinsula@yahoo.com>
Cc: netfilter@lists.netfilter.org

Jordi Warmenhoven wrote:
> After having set up iptables, I notice that the Linux
> box drops all lot of outside traffic (mostly MS
> broadcasts) with DST=[my WinIP] SRC=[some host]. It is
> _always_ the MS-Windows IP address that ends up in
> the FORWARD filter chain. Since I am just a simple
> client on the network, is there maybe some Proxy ARP
> gateway that keeps the two IP addresses mapped against
> my MAC?

Depending on your ISP configuration, you can have more than one computer 
connected over the same link.  I know for sure this is the case with 
ADSL.  Basically, you connect ADSL modem to Ethernet hub, and than 
computers on your network can share it, each of them getting public IP 
address from ISP, however bandwith will be split and not balanced (if 
you have 1M ADSL, and two PCs, each will get 512k allocated to it).  I 
saw this works when ISP I used to work for was introducing ADSL service, 
and we tested all kinds of funny setups and things "smart" users might 
try out once we give them ADSL modems.  If your ISP supports this 
configuration, there's usually no way for ISP to tell if you have dual 
boot box, or you connected ADSL modem into Ethernet hub.  I'm not sure 
if this is possible with cable modems, it might be.  Basically, cable 
modem on the higher levels of the protocol acts preatty much as if your 
ethernet card is connected directly to the Ethernet hub/swtich at the 
ISP end.  I don't know much about internal workings of cable at ISP end, 
but if there's equivalent of Ethernet swith there, it will just think 
that you have two IP addresses on one interface.  Back to the topic, 
they might route traffic for both addresses to you, regardless of which 
OS you are currently booted in.  Although, I'm not sure why there are no 
ARP requests to check if the address is still alive and valid on that 
wire (there should be, I'm seeing a hole lot of those on my cable modem).

The traffic you are seeing dropped is most likely worms trying out 
random IP addresses in search for new systems to infect.  BTW, if your 
box is not acting as an router, you should disable IP forwarding.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

