From: Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us>
Subject: Re: iptables + squid
Date: Sun, 26 Sep 2004 13:54:05 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4157104D.5040401@mail.bloomfield.k12.mo.us>
References: <web-453410391@mail01.infosat.net>
	<1096208831.16814.22.camel@wolfpack.ljm.dom>
Reply-To: sgmayo@mail.bloomfield.k12.mo.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096208831.16814.22.camel@wolfpack.ljm.dom>
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
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:
> On Sun, 2004-09-26 at 01:35, it clown wrote:
> 
>>Hi All,
>>
>>I want to run squid on the same box as iptables.I need to
>>setup the client pc's that they have to go through the
>>proxy to get to the internet... port 3128.They must not be
>>able to by pass the proxy to get internet access.What rule
>>do i need to add to iptables to only allow squid to have
>>internet access?
>>
>>I want to give the clients internet access through squid,
>>thanks.
>>
>>Regards
>>_____________________________________________________________________
>>For super low premiums ,click here http://www.dialdirect.co.za/quote
> 
> 
> # allow clients to connect to squid proxy
> iptables -A INPUT -i $INSIDE_IF -p tcp --syn --dport 3128 -j ACCEPT
> 
> # allow squid to fetch web content
> iptables -A OUTPUT -o $OUTSIDE_IF -p tcp --syn --dport 80 -j ACCEPT
> 
> of course--this assumes that you do not allow clients through the
> FORWARD chain on port 80.
> 
> -j

I don't have my printout of the commands here and he might not want to 
do transparent proxying, but could he not also use the REDIRECT to send 
any info coming from the $INSIDE_IF that is destined from for port 80 to 
port 3128?  If transparent proxying is alright, then the admin would not 
have to worry about setting up all of the workstations to direct to port 
3128.  I am very new to IPTABLES, so I might be way off.

-- 
Scott Mayo
Technology Coordinator
Bloomfield Schools
PH: 573-568-4564
FA: 573-568-4565
Pager: 800-264-2535 X2549

WindowS
     LinUX!

Duct tape is like the force, it has a light side and a dark side and it
holds the universe together.

