From: "Michael K" <micke@klintan.se>
Subject: RE: How to block a range of IPs?
Date: Sun, 27 Apr 2003 09:25:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c30c8e$1d885870$0200a8c0@klintan.local>
References: <Law15-F69D7eX6Djee700022e1a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law15-F69D7eX6Djee700022e1a@hotmail.com>
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
To: 'Afshin Lamei' <linux_st@hotmail.com>, netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Afshin Lamei
> Sent: Sunday, April 27, 2003 8:12 AM
> To: netfilter@lists.netfilter.org
> Subject: How to block a range of IPs?
> 
> 
> Hi,
> How can I write a rule for a custom range of IPs? for 
> example, I want to 
> block every WWW packet incoming from eth1, which source is an 
> IP between 
> 192.168.1.10 and 192.168.1.20.
> please help me writing an example.
> thank you
> afshin
> 
> 

You can't, but if you subnet, the closest will be 192.168.1.1 to
192.168.0.14 using mask 255.255.255.240.
Or 192.168.1.1 to 192.168.0.30 using mask 255.255.255.224.

Example:
iptables -A INPUT -i eth0 -p tcp -s 192.168.1.0/255.255.255.240 --dport
www -j DROP

/Klintan



