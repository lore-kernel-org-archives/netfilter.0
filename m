From: Leonid Veytser <veytser@cs.bu.edu>
Subject: Re: Checksumming Issues
Date: Fri, 21 Nov 2003 15:56:34 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311211552450.16319-100000@csa.bu.edu>
References: <200311212047.hALKljj29632@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311212047.hALKljj29632@agate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

To clarify, all I am doing is recieving packet using libipq and then
modifying destination address of the ip header. Then I recalculate the
ip header's checksum. If I do only that and I send a UDP datagram, I get
the following message from the kernel: udp v4 hw csum failure.

Now, I just found some code online that recalculates udp checksum given
previous and current ip header information and the problem went away. So
it seems like the checksums depend on each other.

I still can not find any code to find the tcp checksum, though. Could you
point me to a function in netfilter source that does that?

Thanks.


On Fri, 21 Nov 2003, Antony Stone wrote:

> On Friday 21 November 2003 8:42 pm, Hildebrand, Brian wrote:
> 
> > I had to check my packet generator source code, because I thought the TCP
> > header was calculated the same way you do. But when I checked the source
> > you have to feed both the TCP and IP headers into the calculation to get a
> > correct checksum. It uses some information from the IP header in the
> > calculation (source and destination IP for example). So you don't actually
> > use the entire IP header, just a part of it.
> 
> It is not possible that the TCP checksum depends on IP information.
> 
> TCP is layer 4 of the OSI model; IP is layer 3.   The IP checksum includes 
> the TCP contents, but not the other way around.
> 
> Antony.
> 
> -- 
> 
> There's no such thing as bad weather - only the wrong clothes.
> 
>  - Billy Connolly
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


