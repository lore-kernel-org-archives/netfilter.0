From: George Georgalis <georgw@galis.org>
Subject: Re: Most stable firewall distro
Date: Thu, 4 Jul 2002 08:02:26 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704080226.A4820@trot>
References: <200FAA488DE0D41194F10010B597610D2BA20C@JUPITER> <1025744168.3d239d282366f@www.solucoesip.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1025744168.3d239d282366f@www.solucoesip.net>; from leolistas@solucoesip.net on Wed, Jul 03, 2002 at 09:56:08PM -0300
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Wed, Jul 03, 2002 at 09:56:08PM -0300, leolistas@solucoesip.net wrote:
>
>
>   Altough I know floppy distro works absolutely well, in general i dont 
>like to use them. As you mentioned, they are 100% limited and nothing can 
>be done, specially if you need disk writings. I just cant imagine a 
>firewall with no logging at all !!! Using a squid proxy would save about 
>15% on your www bandwidth ( depends on each case, but 10-15% is generally 
>ok ).
>
>   And, the most important, IDE disks are as cheap as they are fast .....

If anything is 100% limited, may as well say everything is 100% limited.
I use bering (floppy distro) _because_ there is no IDE drive to generate
heat, use electricity or break. Since I'm throwing the oldest box around
up as a firewall, I'm like the fact that that their is minimal load on
the powersupply. 

I've got ssh, iptables, weblet (an http server for status, logs
etc). You can put everything on a cdrom if you want more. It does log,
you could use weblet to download your logs, I'm using ssh, but could
be using NFS instead. It's easy to add another floppy, I think all the
other packages would fit on it.

I don't see running squid on an LRP, if you need that, put it on a lan host, 
or use a regular distro... :) 

// George

BTW - those new IDE disks are not very fast with older controllers or
cpu.



-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


