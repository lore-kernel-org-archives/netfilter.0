From: "Alexis" <alexis@attla.net.ar>
Subject: Re: Need urgent help on NAT/load sharing
Date: Fri, 6 Feb 2004 09:58:49 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c3ecb0$f6e0c230$0200000a@heretic>
References: <003701c3ec0c$f8cc09f0$6329d9d5@Zamani>
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
To: netfilter <netfilter@lists.netfilter.org>

you need iproute2 to use both providers links.



----- Original Message ----- 
From: "Saeed Zamani" <szamani@concept.ae>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, February 05, 2004 2:24 PM
Subject: Need urgent help on NAT/load sharing


> Hi all,
>    I am new to list and have a basic nat question on Redhat Linux 9. I
> have to translate my local IP ( 192.168.1.0/24 ) to two different public
> IP given by two different ISP ( IPE1 & IPE2 ) at a specified rate. For
> example for every 4 received packet, one have to translate to IPE1 and
> other three to IPE2. I need this for load balacing the internet traffic
> between two isp. At the end, it is excellent if there is an option that
> If one the ISP gateway is dead, all packets have to translate to other
> public IP. Please help me. 
> Thanks, 
> Saeed Zamani, 
> Technical Manager, 
> Concept FZ LLC. 
> 
> 
> 
> 


