From: Qui Le <qle@telogy.com>
Subject: PPTP is working... sortof ... help!!!
Date: Wed, 16 Oct 2002 18:15:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210162215.g9GMFbG01757@b3p9911.telogy.design.ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi All,

    I am able to get PPTP to work (with the lastest patches) when the PPTP 
client is on the LAN side connecting out to the PPTP server on the WAN side.  
All I needed to do for iptables was to set the MASQUERADE rule for 
POSTROUTING.

    However, I can't get a PPTP to work the other way around - with the PPTP 
client on the WAN side trying to connect to the PPTP server on the LAN side.  
The rules that I have are:

	iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1723 -j DNAT --to 
192.168.100.1

	iptables -t nat -A PREROUTING -p 47 -i eth0 -j DNAT --to 192.168.100.1

and

	iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

 - where eth0 is my interface to the WAN and eth1 is my interface to the LAN.

   The problem that I am getting is when I try to connect to the PPTP server 
on the LAN side, it times out when verifying user/password.  Looking at the 
debug statements, it seems like it times out due to the fact there was "no 
full PPTP header, can't track", in which case a session clear request is 
issued.  And looking at the network monitor on the PPTP server side, I see 
that the server and client is hand-shaking fine.

   My question is why is it working one way and not the other.  Is my rules 
wrong for trying to connect to the LAN-side PPTP server?  What would cause 
"no full PPTP header, can't track" statement on this setup and not the other? 
 Has anyone got it to work for a PPTP client on the WAN-side to the PPTP 
server on the LAN side?


Thanks in Advance,
Qui

