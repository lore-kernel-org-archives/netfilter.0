From: Aurelio Turco <a.turco@bom.gov.au>
Subject: Re: Matching HTTP/FTP packets
Date: Wed, 12 Jun 2002 07:34:46 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D06F996.44F5F89D@bom.gov.au>
References: <001e01c211c1$8f758840$7b0010ac@dynamicaccess.lan>
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
Cc: netfilter@lists.samba.org

I was simply wondering whether it was possible to further restrict
packets, thinking that one of the "ip_conntrack_ftp" etc modules
might be able to do this.

PS: Is there any documentation on theses modules?

Hard__warE wrote:
> 
> so what you require is to actually match Layer 7 Data       (on the OSI
> Layer)
> 
> maybee what you want to do can be Piped through a Squid Transparent Proxy
> 
> which allows you to match by a HTTP/FTP address and Data so then you can
> maybee
> 
> do something with it ..
> 
> help me out here what do you want to do with this data once you have found
> it ???

In response to my queries:
>
> Is it possible, in a rule, to match for HTTP packets?
>
> Is it possible, in a rule, to match for FTP packets?

