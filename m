From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: How to load modules needed by iptables?
Date: Mon, 17 Mar 2003 09:28:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c2ecaa$95299140$1001a8c0@s3ac>
References: <20030317120947.67E3F1CBAA261@sm204.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20030317120947.67E3F1CBAA261@sm204.163.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: 'Bobo' <boboaq@163.com>
Cc: netfilter@lists.samba.org

 =20
>  How to load modules needed by iptables?
>   =20
>     While setup iptables firewall,I met a strange question.
>     I learned the following scripts frome the famous Iptables tutorail
>     wirtten by Oscar Andreasson.
>     If I input the following scripts ,and run it in a bash file.
>   ****************************
>     =20
>  /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_mangle
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_state
> ***************************
> and the message on the screen is :


I don=92t think your module names you have listed are correct. If I'm =
not
mistaken these modules load on demand as you make the associated call.
Ie -t nat will automatically load the nat module.
If you insist on loading them manually go look them up. =20
/lib/modules/2.4.18/kernel/net/ipv4/netfilter.  If they are not listed
here then the modules have not been compiled with your kernel. Check the
kernel HOW-TO on how to do this.


