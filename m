From: Joel Vosu <joel.vosu@mail.ee>
Subject: Re: Change source address on incoming packets
Date: Thu, 13 May 2004 15:36:20 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A36BC4.6010507@mail.ee>
References: <409EA7A6.8070000@mail.ee> <1084186603.13931.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084186603.13931.14.camel@localhost>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

Thanks for your answes, I got it working with pyproxy-1.6
http://freshmeat.net/projects/pyproxy/
it neatly changed the source address of all the packets and then 
forwarded them to the correct port.

Thanks again

Sincerely,

Joel Vosu
John A. Sullivan III wrote:

>On Sun, 2004-05-09 at 17:50, Joel Vosu wrote:
>  
>
>>I would need to be able to change the source address of incouming 
>>packets. I have 2 different subnets, but I need the server to see the 
>>packes from the 2nd subnet as coming from the 1st.
>>in iptables it would be something like:
>>iptables -A PREROUTING -t nat -s 2nd_subnet -j SNAT --to-source 
>>local_machine
>>but this is not possible because SNAT only works for outgoing packets in 
>>POSTROUTING.
>>Is there a way to get this to work other than adding a second router box 
>>for NAT?
>>I tried to do it like this:
>>Added another IP address eth0:0 to the server,
>>added rules:
>>iptables -A PREROUTING -t nat -d eth0:0_ip -p tcp --dport server-port -j 
>>DNAT --to-destination eth0_ip:server_port
>>iptables -A POSTROUTING -t nat -d eth0_ip -p tcp --dport server_port -j 
>>SNAT --to-source eth0:0_ip
>>but when I check from: iptables -L -t nat -nv then the second rule does 
>>not get used at all. I presume the pacet intended for local machine does 
>>not traverse the outgoing part of the nat table.
>>    
>>
><snip>
>I haven't tried or fully thought through any of these but here are a few
>of the thoughts which came to my mind.
>
>You may see the local packets in the POSTROUTING chain but on interface
>lo instead of eth0.
>
>If that doesn't work, I wonder if you can use iproute2.  It can do
>stateless NAT independent of iptables (i.e., the reply packets will know
>nothing of the original NAT and will need to have rules applied to them,
>too).  I believe that will alter the packet after it leaves the
>PREROUTING chain of the nat table. I'm not sure which address the filter
>table will see.
>
>You may also be able to do it with an iproute2 routing rule.  They can
>be used to tell the server which ip to use for the source.  I haven't
>looked at the details of doing this in a while so I do not recall if it
>will do what you want off the top of my head.
>
>In a recent RedHat distribution, you can find the iproute2 documentation
>in /usr/share/doc/iproute-2.4.7/ip-cref.ps.  There is also a slide show
>about using it in the training section on http://iscs.sourceforge.net.
>
>Good luck - John
>  
>


