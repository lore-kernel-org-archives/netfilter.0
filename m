From: "Linux Rulz" <linuxtek2002@hotmail.com>
Subject: Help with understanding MASQ and packet flow through iptables
Date: Sat, 08 Jun 2002 18:05:08 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F556i14bcLMqvsyRbHy0002025d@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I'll make this short.  I'm running RedHat 7.1, kernel 2.4, and iptables with 
MASQ modules.  I'm having trouble understanding the flow of a packet coming 
into my box, so I'm confused as to which chains to use.
Since my packets are MASQed, does that handle the forwarding for me, and all 
I need to use is INPUT/OUTPUT...or do I need to use the FORWARD chain too?  
I'm trying to get POP3 and FTP (on high ports) running...maybe understanding 
the basics will help me understand what rules I need to make.

I've scoured the net and HOWTOs, still don't fully understand the flow.
Thanks everyone!


_________________________________________________________________
Send and receive Hotmail on your mobile device: http://mobile.msn.com


