From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: FTP problems on ports other than 21
Date: Tue, 27 Jul 2004 06:55:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040727045526.A427320AB@sterenborg.info>
References: <4915A8E67C498D42BAB5CB1351FD026E23CB60@3webad1.3WebMedia.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4915A8E67C498D42BAB5CB1351FD026E23CB60@3webad1.3WebMedia.int>
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

> I have several customer FTP sites hosted on ports other than 
> 21 (ex: 2001, 2002, 2003 and so on)
>  
>  
> Right now, the only way they can work properly is if I open 
> ports 1024 to 8000 for that machines so the ftp return ports 
> are able to connect.

You would need virtual hosting I suppose, this is not a netfilter thing.

Reading this, you can not use name-based virtual hosting with ftp :
http://www.castaglia.org/proftpd/doc/contrib/ProFTPD-mini-HOWTO-Vhost.ht
ml

It says this :

-------------
The definition of the File Transfer Protocol, unfortunately, does not
(currently) support name-based virtual hosts, as HTTP1.1 supports.
....
The bottom line is that ProFTPD does not support name-based virtual
hosts; not because they are not implemented, but simply because the
protocol itself does not support them. 
-------------

So, the only way to virtual host would be if you have multiple public
IP's on which you run a ftp-site.


Gr,
Rob


