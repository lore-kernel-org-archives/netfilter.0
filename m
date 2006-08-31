From: Damjan <gdamjan@mail.net.mk>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Thu, 31 Aug 2006 19:30:59 +0200
Message-ID: <20060831173059.GA23640@legolas.on.net.mk>
References: <20060831151130.GA32342@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20060831151130.GA32342@freesources.org>
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
Content-Type: text/plain; charset="utf-8"
To: Netfilter-Users <netfilter@lists.netfilter.org>

> where can i set the ports for ip_conntrack_ftp?
> 
> if i load it as module, i can use
> 'modprobe ip_conntrack_ftp ports=21,31,41'
> 
> but if the module is compiled into the kernel, i have no idea how to set
> the ports. i didn't find anything in either /proc or
> kernel-source/Documentation.
> 
> the server is running linux kernel 2.4.27.

Hmm, I don't know about 2.4.x kernels but in 2.6.x you can always set
parameters to integrated modules on the kernel comand line.

In your case it would be:
 ip_conntrack_ftp.ports=21,31,41


-- 
damjan | дамјан
This is my jabber ID -->         damjan@bagra.net.mk 
 -- not my mail address, it's a Jabber ID --^ :)

