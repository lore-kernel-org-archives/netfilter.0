From: Fabiano Bonin <fabiano@personalsoft.com.br>
Subject: Re: Redirecting ports on localhost
Date: Tue, 30 Mar 2004 11:15:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406980E5.6080107@personalsoft.com.br>
References: <20040330133505.22298.90925.Mailman@vishnu.netfilter.org>
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

 > On Tuesday 30 March 2004 13:46, Fabiano Bonin wrote:

>> I need to access this service from other hosts through ETH0 interface
>> (ip 192.168.0.254). The other hosts are in the same network.
>> I already enabled "NF_NAT_LOCAL" kernel option (btw, all netfilter
>> options are enabled in my kernel), and the commands i'm using are
>> these:
>  
>
> NF_NAT_LOCAL is for NAT'ing connections that originate on the local 
> machine (ie the netfilter machine).  I don't believe it will do what you 
> want though I may be incorrect.

>> iptables -F
>> iptables -F -t nat
>> iptables -A OUTPUT -t nat -p tcp -o lo -d 192.168.0.254 --dport 5050 -j
>> REDIRECT --to-ports 5050
>> echo "1" > /proc/sys/net/ipv4/ip_forward
>  
>

> I don't think you need anything special to do this however your rule says 
> "any packets going out on loopback to 192.168.0.254".  The only machine 
> on your network that would send packets to 192.168.0.254 on loopback is 
> the machine with that IP itself.

> Can you not make that daemon listen on an interface IP as well as 
> 127.0.0.1?  This way other hosts could connect to 192.168.0.254:5050.  
> Other hosts that try to access port 5050 on your machine will simply come 
> through the INPUT chain, no NAT needed.  If you can't, or don't want to 
> for good reason, I am sure it would be possible with DNAT. 

This daemon is a SSH tunnel to a remote machine. I couldn't enable interfaces other than lo to listen on that port, even enabling the option 'remote ports accept connections from other hosts' in the client program (putty). I'm almos sure this is a SSH protocol limitation due to security reasons, so probably my only choice is through iptables.

> Perhaps I misunderstand what you are trying to accomplish, apologies if 
> so.

Most probably you understood what i am trying to do, and the way i'm trying (as shown in the examples) is entirelly wrong. I used iptables few times before and i'm not skilled with it.

Maybe you can show the command needed to my case (i.e., using DNAT as you told above). Sorry if i'm asking too much...
I just need the hosts on my local network can access this port through server's eth0.

Thanks again.

> David




