From: Subhash Gopinath <subhashg@gmail.com>
Subject: Re: problem with hook function for DHCP
Date: Tue, 30 Nov 2004 15:21:28 -0800
Message-ID: <81703d8a0411301521141c99e0@mail.gmail.com>
References: <29F6FAF7F2C0D41190980002A513591E0E93BABB@FSNSAB30>
Reply-To: Subhash Gopinath <subhashg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <29F6FAF7F2C0D41190980002A513591E0E93BABB@FSNSAB30>
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
Content-Type: text/plain; charset="us-ascii"
To: Hudson Delbert J Contr 61 CS/SCBN <delbert.hudson@losangeles.af.mil>
Cc: netfilter@lists.netfilter.org

Hi,

I need the o/p netfilter part for something else and not just for
viewing DHCP packets(which can be done with TCPDump as u said).

Basically, I need to store the transaction ID of outgoing DHCP packets
in a table ...
When the server replies, the reply contains the transaction ID, and I
need to match that with the corresponding entry in the table and then
do some stunts later on....

Unfortunately, I am not able to grab all outgoing DHCP
packets....atleast when I put printk in the ougoing filter, messages
are not printed in the dmesg .

Do u think there's a problem with the printk LOG LEVEL ?

thanks,
~Subhash

On Tue, 30 Nov 2004 13:52:23 -0800, Hudson Delbert J Contr 61 CS/SCBN
<delbert.hudson@losangeles.af.mil> wrote:
> why not try tcpdump or hardware sniffer onm the lan itself.
> 
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
> Opperisano
> Sent: Tuesday, November 30, 2004 12:42 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: problem with hook function for DHCP
> 
> On Mon, Nov 29, 2004 at 11:58:44PM -0800, Subhash Gopinath wrote:
> > Hello all,
> >
> > I am facing problems capturing DHCP packets sent from a client to a
> server....
> > Basically, the hook function (defined below) is not getting called for
> > each packet going out of the system.. Any ideas ?
> 
> my idea:  DHCP packets are generated and processed at the BPF layer
> (which is below netfilter in the stack); and never pass through any
> netfilter hooks.
> 
> -j
> 
> --
> "Default! The two sweetest words in the English language!"
>         --The Simpsons
> 
>

