From: Keith Whyte <keith@media-solutions.ie>
Subject: Re: coming in through the outgoing hole?
Date: Mon, 21 Nov 2005 13:41:31 -0600
Message-ID: <438222EB.6030702@media-solutions.ie>
References: <FAC4E024BF776842876169173CE2F01309A7B3@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01309A7B3@mailbox.vikus.com>
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
To: Derick Anderson <danderson@vikus.com>, netfilter@lists.netfilter.org

Derick Anderson wrote:

>>INPUT
>>0     0 ACCEPT     tcp  --  eth0   any     anywhere
>>anywhere           tcp spt:http dpts:1024:65535
>>OUTPUT
>>0    0 ACCEPT     tcp  --  any    eth0    anywhere
>>anywhere           tcp spts:1024:65535 dpt:http
>>    
>>
>
>You don't need the 1024:65535 bit in either rule once you use connection
>tracking. If you're trying to restrict this particular machine from
>connecting to web servers using a source port below 1024, this is
>already done for you unless the user is root.
>
no, i am trying to prevent a remote root user from making a connection 
to my machine.

> If the user is root, then
>OUTPUT filtering is meaningless (more so than if the user is not, which
>is still quite a bit). Your OUTPUT filtering should really be egress
>filtering in the FORWARD chain of your firewall. Hopefully you aren't
>web surfing with your firewall.
>
>Stick around and I'm sure someone else will mention the general
>pointlessness of OUTPUT filtering.
>
>  
>
I should have made it more clear in my original post. The machine in 
this scenario is neither a firewall, nor a workstation. It's a server, a 
co-located remote machine. As such it is a kind of a workstation, or a 
potential workstation.

 That doesn't take away from your agrument that OUTPUT filtering is 
pointless, but in this case, I decided to implement some OUTPUT 
filtering to be sure and avoid users (non-root of course) from using a 
shell account (or their php-enabled web account) to access certain services.

Thanks very much for the rest of your response, and I think it answers 
more or less my question about using conntrack, but to try and make it 
more clear, the situation I wanted to avoid is the initiation of a 
connection, from source port 80 (by root, of course) to port 7775 on the 
server machine. With the current rules this would pass the firewall.

>iptables -A OUTPUT -p tcp -m state --state NEW --dport 80 -j ACCEPT
>
>What happens is the first packet goes out (in the NEW state, you could
>get even more restrictive and use the '--syn' or '--tcp-flags
>SYN,RST,ACK SYN' to make sure it's a SYN packet) on port 80 and hits the
>remote server. The return packet (now ESTABLISHED) hits the ESTABLISHED
>match at the top of your INPUT ruleset there and goes on its merry way.
>The next packet out from the machine (also ESTABLISHED) hits the
>ESTABLISHED match in the OUTPUT chain and is accepted as well.
>Everything else that happens until the connection is closed goes through
>the RELATED,ESTABLISHED rules and not through the '--dport 80' rule.
>
>  
>
I'm also using the rules for traffic counters, so I don't want to do 
that, but yes, it would simplify things as lot.


>>as a hypothetical example of the problem:
>>let's say i run an admin type webserver for some app, 
>>listening on a port above 1024, for example. if someone 
>>hacked a web client to use port 80 as the source port for 
>>it's connections,  (dunno, would you have to hack the kernel 
>>too, or just be root?) , then they could bypass the firewall 
>>part of the security, right? or with ssh, surely it would be 
>>easy enough to hack an ssh client to use port 80 as it's source port.
>>ok, so you probably shouldn't run an ssh listener on a port 
>>above 1024, but nevertheless, it's a good hole to close.
>>
>>thanks!
>>
>>Keith.
>>    
>>
>
>Once someone has rooted your machine, local firewalls and whatever else
>are meaningless. Let's say though that only the service (Apache for
>example) was compromised: You still have a legitimate service running,
>accepting connections from port 80 (which by the way, is how the exploit
>would have been launched in the first place) and sending information
>back out on unprivileged ports. The result is the same, you can't block
>the bad traffic with a firewall unless it's doing content inspection.
>
>  
>
That's totally understood, I wasn't in anyway trying to use netfilter to 
protect the box from somebody who already has root!
I am trying to protect it from root user on a remote attacker machine, I 
was referring to that remote machine when I mentioned a potential web 
client making connections from port 80.

Keith





