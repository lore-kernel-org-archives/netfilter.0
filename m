From: "Tim" <tim-lists@cimx.com>
Subject: Re: block Kazaa download
Date: Tue, 4 Jun 2002 16:40:19 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <019b01c20c08$0a969e70$5064a8c0@optimus>
References: <Pine.LNX.4.30.0206041107060.9441-100000@atlas.iloilo.fapenet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

----- Original Message ----- 
From: "Allan Parreno" <allan@atlas.iloilo.fapenet.org>
To: "netfilter" <netfilter@lists.samba.org>
Sent: Tuesday, June 04, 2002 11:07 AM
Subject: block Kazaa download


> 
> hello,
> 
> anybody has a sample how to block Kazaa download?
> 
> TIA
> 
> 
> 

generically this should work
iptables -A FORWARD -p TCP --dport 1214 -j REJECT



