From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_ftp doesn't work
Date: Tue, 25 Jun 2002 12:03:24 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206251200261.4927-100000@blackhole.kfki.hu>
References: <20020625113146.B255@rainbow>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020625113146.B255@rainbow>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giovanni Cardone <g_cardone@libero.it>
Cc: netfilter@lists.samba.org

On Tue, 25 Jun 2002, Giovanni Cardone wrote:

> darkstar\$ /sbin/ifconfig | egrep 'MTU'
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
> 	  UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
>
> So, it looks like 1500. Is it so small? Are you right, then?

No, then I'm wrong and it's not an MTU issue.

But were there any 'partial' FTP requests detected by the module
according to the kernel log?

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


