From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Mon, 9 Sep 2002 13:20:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091220.g89CKkv05345@vulcan.rissington.net>
References: <1406037015A4D511B3E100B0D0DF4DC434BDB3@TELECOMS04>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1406037015A4D511B3E100B0D0DF4DC434BDB3@TELECOMS04>
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

On Monday 09 September 2002 12:47 pm, Eugene Joubert wrote:

> Saki,
>
> Don't understand what you need done?

He wants to spread the source address of his outgoing packets across the 16 
external IPs he has, so instead of masquerading all 50 internal machines 
behind one IP, he wants to masquerade four of them behind IP1, another four 
behind IP2, another four behind IP3....

I must admit I'm not entirely sure why Saki should want to do this - after 
all, masquerading 50 machines behind one IP address is not a problem at all, 
however I have already replied to the post showing how it can be done.

Antony.

> -----Original Message-----
> From: saki [mailto:saki@sunsilk.econet-cyber.com]
> Sent: 20 August 2002 10:56 PM
> To: netfilter@lists.samba.org
> Subject: (no subject)
>
> hello  i have internet cafe with 50 client and 1 server with 16 public
> address
> client1, client2, client3, client4  exit to ip.public.no.1
> client5, client6, client7, client8  exit to ip.public.no.2
> client9, client10, client11, client12  exit to ip.public.no.3
> ........
> ........
> client ip address 192.168.1.1 - 192.168.1.50
> public ip address 202.47.12.30 - 202.47.12.45
>
> any one can help ?
> i have installed redhat7.2 for server

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

