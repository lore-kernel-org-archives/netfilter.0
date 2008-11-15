From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: L2 NAT
Date: Fri, 14 Nov 2008 22:02:32 -0600
Message-ID: <491E49D8.8060302@riverviewtech.net>
References: <f4d9d6df0811140834h5e8397b9y1b544c637bb29d78@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f4d9d6df0811140834h5e8397b9y1b544c637bb29d78@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/14/2008 10:34 AM, ivan wrote:
> I need to connect three devices via ethernet, through a switch, to 
> the same tftp server. The problem is that these devices have the same 
> IPs, i.e. 192.168.0.181, and when I address to or get data from one 
> of them, I can't tell which device I'm actually talking to. The 
> devices are three items of the same product, and their IP cannot be 
> changed.

Do the devices ever initiate connections to your server or just respond 
to connections that the server initiates?

If it is your server initiating connections, you might be able to 
statically set arp entries for each device on it's own bogus IP.  By 
doing this you should be able to talk to each bogus IP and have the 
ethernet frames go to the proper device.  If the IP stack / software on 
each device is simple enough, you can probably talk to it with the 
incorrect destination IP.  Though I'm not 100% sure what the returning 
packet would be like.  But it is a direction to look.

> I have implemented a perl script that changes the ARP table in tftp 
> server side, but I need a stronger solution.

*nod*

> I was thinking on developing a sort of L2 NAT which could change the 
> IP source address of a package according to its MAC address, and put 
> it in the middle of the tftp server and the devices.

You might be able to use Bridge NetFilter extensions on a box between 
the three devices and the server to be able to NAT the IPs of the traffic.

You could choose what source IP to SNAT traffic to based on the source 
MAC address.  If you send the new ethernet frame out with the original 
source MAC address your server will have the proper MAC address and a 
spoofed IP to know where the packet came from.

Your server will have to reply to a MAC address, probably the real MAC 
address of the device but with a spoofed IP.  So the bridge will have to 
DNAT the traffic based on the destination MAC address.

This should take care of packets leaving the devices going to the server.

You will need to watch for ARP queries from the network for the spoofed 
IPs of the devices and have the bridge send the ARP reply with the 
correct MAC addresses and the spoofed IPs.

> Using the current iptables command can I set up this?? or  I need to 
> develop my own kernel module???

I think you might be able to pull it off with a combination of IPTables 
and EBTables.

> If you have any idea please let me know.

See what you think of the above ideas.



Grant. . . .
