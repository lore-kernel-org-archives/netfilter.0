From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: Re: ip_conntrack: table full, dropping packet.
Date: Fri, 1 Nov 2002 10:02:37 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ad01c2814a$c107c4b0$0bc8c80a@dolphin>
References: <Pine.LNX.4.44.0210301755110.19280-100000@dns.toxicfilms.tv> <200210311225.47844.mail@vickysh.wlink.com.np>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: mail@vickysh.wlink.com.np, Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: netfilter@lists.samba.org

No I guess the maximum value is 64K.

Yes. It did crash my machine.
Just FYI, I tried this before on my 64M RAM linux box.
The default is 4K connection max.
But I tried to increase it to 64K.
End up when the number of connections grow to 13K (based on
/proc/net/ip_conntrack),
it first starts killing my other processes including klogd, syslog-ng,
snort.
At this time, you can see the kernel start killing the process from your
syslog (before syslog died)
After a while my linux box hang. And wait for reboot
I guess this is related to OOM (out-of-memory) bug in the kernel (I'm using
2.4.18-xfs).

.//Jet

>
> If I increase the value what negative effect does it have??? Can I
increase it
> to say 3276800 ???? Hope It doesnot crash my machine.
>
>


