From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT not working
Date: Sun, 29 Feb 2004 10:32:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402291032.50839.Antony@Soft-Solutions.co.uk>
References: <1078047284.4041b234e0530@milliweb.millicom.com.pe>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078047284.4041b234e0530@milliweb.millicom.com.pe>
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

On Sunday 29 February 2004 9:34 am, Felipe wrote:

> I've tried to set up SNAT to match INTERNAL network to a external ip,
>
> /usr/local/sbin/iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/16 -j
> SNAT --to-source 200.110.2.179
>
> But that's working, it only works when i put:
>
> /usr/local/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> eth0= external interface
> eth1= internal interface

Is 200.110.2.179 the address of the external interface eth0?

If it isn't, then reply packets have no interface to come back to, so 
connections won't work.

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


