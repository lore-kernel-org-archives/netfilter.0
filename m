From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: dhcrelay
Date: Fri, 28 Nov 2003 16:01:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311281601.48229.JALaramie@Loudoun-Fairfax.com>
References: <1070051416.3fc7b058800c7@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070051416.3fc7b058800c7@paris-hme1>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 28 November 2003 15:30, zynkx wrote:
>                                 _______________
>
> 				| gateway 1   |
> 				|192.168.0.253|
> 				|81.84.40.XX  |
>
> 				_______________
> 			_______________|
>
> 		_______________        |
>
> 		|DHCP SERVER  |	       |
> 		|
> 		|192.168.0.1  |        |
> 		|_____________|	       |
>
> 				________________
>
> 				|GATEWAY2      |
> 				|192.168.0.253 |
> 				|192.168.100.254
> 				|______________|
>
> 	_________________________________
>
>
> 		_______________    _______________
> ______________
>
> 		|192.168.100.1 |   |192.168.100.2|
> |
> |192.168.100.3|  _______________    ______________
>
> _______________
>
>
> hi all:
>
>
> i have this lan i am supposed to use dhcrelay on
> gateway 2 so the 192.168.100.0/24 machines can get an
> ip address. 192.168.0.1 is the dhcp serveer.i have the
> input and output chain of the
> gateway 2 to drop.
>
> my question is:
>
> do those request require input and output to accept?

No, but you do need to set the default FORWARD policy to ACCEPT and make sure 
forwarding is enabled in gateway 2.

 i
> don't really think so because those packer are not for
> gateway 2 but are to be routed to 192.168.100.0/24
> machines...
>
> what do you guys think of this??
>
> sorry for the very bad drawing...
>

You draw better than I do!

Jeff

