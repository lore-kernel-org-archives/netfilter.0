From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 3 Jun 2002 00:55:26 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603045526.GE19986@cannon.eng.us.uu.net>
References: <20020603043902.GB19986@cannon.eng.us.uu.net> <GAZVTN6M1YT4WFEXT1WGDBAMIJHKH.3cfaf4cb@ALEXEY>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <GAZVTN6M1YT4WFEXT1WGDBAMIJHKH.3cfaf4cb@ALEXEY>
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
To: Alexey Talikov <alexey_talikov@texlab.com.uz>
Cc: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.samba.org, Art Reisman <astormchaser2002@yahoo.com>

On Mon, Jun 03, 2002 at 09:47:07AM +0500, Alexey Talikov wrote:

> See log 

I understand your reasoning. But he seems to be aware of the hub/switch
situation and he claims that he has a hub between the two interfaces and
still unable to see other traffic... which is weird...

Ramin

> interface realy go to promisc mode
> on my linux box
> root@shake /root]# tcpdump -n -i eth0
> eth0: Promiscuous mode enabled
> tcpdump: listening on eth0
> in /var/log/messages
> Jun  3 08:51:10 shake  -- root[472]: ROOT LOGIN ON tty2
> Jun  3 09:42:07 shake sshd(pam_unix)[597]: session opened for user root by (uid=0)
> Jun  3 09:42:18 shake kernel: eth0: Promiscuous mode enabled.
> Jun  3 09:42:18 shake kernel: device eth0 entered promiscuous mode
> Jun  3 09:42:37 shake kernel: device eth0 left promiscuous mode
> what version of tcpdump you use (I use last 3.7.1 with libpcap 0.7.1)
> I can send you gz archive with compiled version

