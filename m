From: Carlos Santos <csantos@csantos.net>
Subject: H323 gateway? HELP
Date: Fri, 19 Sep 2003 11:16:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030919105537.00b313d0@mail.network.com.pt>
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
To: netfilter@lists.netfilter.org



Hi,

I'm using a RedHat Psyche (RedHat 8) box as gateway to access the Internet. 
As usual, it has 2 netcards, it's running Iptables (masquerading) and I 
just recompiled/upgraded the kernel to version 2.4.22 (latest stable one 
according to kernel.org). All the netfilter related modules (including 
h323) are built into the kernel so no dynamic loading is necessary in the 
firewall script. Everything is working ok when it comes to all the other 
Internet services (http, ftp...) but I now need to add support to 
audio/video so I can use my webcam to connect to people in the Internet. 
I've been reading and testing everything I could in the past 3 days but I 
can't get the darn thing to work.

- Does anyone have / know about a step by step guide I can read to have 
h323 support in a redhat gateway ? I'd prefer not to have to use h323 
proxies like GateKeeper. I would like to get this done with 
Netfilter/Iptables alone if possible.

- Can anyone tell me how to maje sure the kernel has specific modules built 
in ? I know I selected them to be built in when I recompiled but I really 
can't be sure they're there. Is there a command to find out ?


Thanks,
Carlos.



*****************************************
Carlos Santos
csantos@csantos.net
***************************************** 


