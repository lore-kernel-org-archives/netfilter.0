From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: pop3 and vpn
Date: Fri, 12 Aug 2005 00:34:24 -0500
Message-ID: <42FC34E0.9010800@riverviewtech.net>
References: <9bc7d292050811035453e207c4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9bc7d292050811035453e207c4@mail.gmail.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Vinod H wrote:
> Hi, 
> 
> 
> I am Vinod, I have Redhat Linux 9 as my firewall and mailserver and I 
> want to open pop3(110) port and We have Cisco VPN installed on our UK 
> office and from here we are trying to connect to the VPN server through 
> 
> 
> Cisco VPN Client installed on one of the windows 2000 pro client 
> machine, if I connect through some internet dialup I am able to connect 
> 
> 
> but if I go through our internet gateway that is our firewall I am not 
> able to connect. 
> 
> 
> I don't know if I want to open some port in the firewall so that my vpn 
> 
> 
> works fine, following is my iptables 

<snip>

> I want to know how to open pop3 port for outside access and for the 
> perticular ip and which port should be open for my vpn to work and how 
> to 
> 
> 
> Some one please help me on this issue it is very urgent 
> 
> 
> Thanks in advance 
> 
> 
> Regards 
> 
> 
> Vinod

I would be willing to bet that you need to allow your firewall to pass ESP and possibly GRE traffic through your FORWARD chain.



Grant. . . .

