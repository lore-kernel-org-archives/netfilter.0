From: "David Wynter" <david@roamware.com>
Subject: Required iptables restart each boot?
Date: Thu, 14 Nov 2002 18:16:28 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LPECIAHGIGJJHHELMIDLIEAGDAAA.david@roamware.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>


Hi,

I have an iptables script that works just fine. But when I have to reboot my
Linux box it runs the iptables script (it has chkconfig as 2345 08 92). But
none of my PCs on the LAN can see the Internet until I do "services iptables
restart" then they can. But my Linux box can see the Internet prior to this
iptables restart? Any explanation as to why this is so?

I have another problem too. I am not sure it is related to iptables. I have
iptables on my linux box attached to my LAN. The LAN has 2 PCs a Win98
notebook and a W2K Server PC. The former can ping the gateway IP address,
but the latter cannot. The former is 10.0.0.5 and the latter is 10.0.0.6
both within the range of the lansubnet declared in the iptables script
(10.0.0.0/8). The W2K Server can FTP to the Linux box only via the internet
not directly to the gateway IP (10.0.0.1). I have made sure that packet
filtering on the W2K box id OFF. Any ideas on why the W2K PC cannot access
any service on ports I have allowed on the Linux box with iptables running
when the Win98 notebook can? By the way FORWARD'ed packets are fine for all
PCs on the LAN.


Regards

David Wynter

roamware Ltd.
(+44) (0) 208 922 7539 B.
(+44) (0) 7879 605 706 M.
david@roamware.com


