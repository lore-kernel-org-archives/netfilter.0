From: "Martin Leduc" <marled3@hotmail.com>
Subject: Re: Problem behind my DMZ
Date: Sat, 10 Jan 2004 13:26:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F98nYrdH1ofVE100016b62@hotmail.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

On Friday 09 January 2004 9:54 am, Martin Leduc wrote:

>The /32 and /28 netmasks operate quite simply:
>On one interface you use a /32 netmask, which means there is only one 
>accessible IP on that network - that of the router leading to the Internet.

>On the other interface you use a /28 netmask, which means there are 16 IP 
>addresses (14 usable) accessible on that network.

>Linux uses its routing table entries from most specific to least specific, 
>so if a packet for the one IP address on the /32 network needs to be 
>routed, it will go in the direction of the Internet.   If a packet for any 
>other address in your public IP range needs to be routed, it won't match 
>the /32 but it will match the /28, so it will go to the internal network.

Ok,  so if I understand correctly, my home internet ISP who provide me the 
route:

67.68.181.1     0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
0.0.0.0         67.68.181.1     0.0.0.0         UG    0      0        0 ppp0

have is 67.68.181.1 on his internet network and we are all connect into a 
master switch behind this router, i'm able to ping 67.68.181.2, .3, .4, .5, 
etc...

It is possible to do something like

                     LAN1                       ---------------
192.168.1.1--------------192.168.1.2 |  BOX 1 |  192.168.1.3
                                                 ---------------             
  |
                                                                             
  |  LAN 2
                                                                             
  |
                                                                 192.168.1.4

I know I can use Ramin solution, but can we? it is possible?

It is possible to create this topology using Linux BOX?  I have already do 
it using CISCO Router with the IGRP protocol.  I know I can use RIP too.

                     LAN                       ---------------
192.168.1.X--------------192.168.1.1 |  BOX 1 |  10.0.0.1 |
                                                 ---------------             
  |
                                                                             
  |
                                                                             
|   NET
                                                                             
  |
                     LAN                       ---------------              
|
192.168.2.X--------------192.168.2.1 |  BOX 2 |  10.0.0.2 |
                                                 ---------------             
  |
                                                                             
  |
                                                                             
  |  10.0.0.3
                                                                        
-------------
                                                                       | BOX 
3  |
                                                                       
--------------
                                                                             
|
                                                                             
|
                                                                   INTERNET 
PUBLIC IP

192.168.1.X PING 192.168.2.X PING INTERNET PUBLIC IP

I guess I need routed deamon to do that, no? RIP is supported by routed.

>The fact that the two network ranges overlap does not matter (despite what 
>you may read in introductory networking books - this is beyond introductory 
>networking).

>Regards,

Best regards, and thanks for your time and help, I appreciate it.

>Antony.

Martin

_________________________________________________________________
MSN Messenger : discutez en direct avec vos amis !  
http://messenger.fr.msn.ca/


