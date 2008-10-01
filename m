From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Something weird
Date: Wed, 01 Oct 2008 09:59:52 -0500
Message-ID: <48E39068.9020908@riverviewtech.net>
References: <200810010834.51705.mveloso@tecnologiaip.com.br> <48E38584.60704@riverviewtech.net> <200810011151.53192.mveloso@tecnologiaip.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200810011151.53192.mveloso@tecnologiaip.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/01/08 09:51, Marcio Veloso Antunes wrote:
> I found out what is happening, it is exactly what you've said.

*nod*

> The reason this occurs is related to conntrack, the specific route is 
> getting up after the first packet leaves the internal network (via 
> VPN interface, without masquerade), then when the specific route 
> enters, the connection has been established already.

That will do it.

> Even when the interface changes from TUN0 to PPP0 the connection 
> persists and the packets keep NOT being re-verified.

'k

> I don't know if it can be considered a Bug, but it seems to me an odd 
> situation as the interface have changed, other networks will be 
> crossed, i think the rules should be re-validated, don't you ?

I don't know if it is a bug per say or not.  I would guess it has to do 
with whether or not the connection tracking code in kernel is aware of 
interface / network / route state changes or not.  If it is unaware of 
state changes then it is not possible for connection tracking to know 
that something is amiss.  If it is aware of state change then I would 
think that it should trap for this and handle it more gracefully than it 
did, thus a possible bug.  But seeing as how I don't get that deep in to 
kernel I can't say one way or the other.

> root@fw:/proc/net# grep 172.18.0.13 ip_conntrack
> udp      17 2809 src=172.18.0.13 dst=200.198.184.204 sport=5060 
> dport=5060 packets=977 bytes=537937 src=200.198.184.204 
> dst=172.18.0.13 sport=5060 dport=5060 packets=30 bytes=16384 
> [ASSURED] mark=0 use=1

Would it be possible to DROP the traffic before the VPN comes up such 
that the connection would never be successfully established and then 
allow the traffic once the VPN is up?  Hopefully this would allow 
connection tracking to track the traffic on the proper interface.  Also, 
make sure you use a DROP not a REJECT as you don't want to return an 
error the the client application(s) thus causing them to give up rather 
than timing out and re-trying like they would if the traffic was just 
DROPed and lost in the ether.

> Thanks for your help,

If you consider a direction to look with out an answer help, you are 
welcome.  ;)



Grant. . . .
