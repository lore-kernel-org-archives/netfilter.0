From: Vicky Shrestha <mail@vickysh.wlink.com.np>
Subject: Re: ip_conntrack: table full, dropping packet.
Date: Thu, 31 Oct 2002 12:25:47 +0545
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210311225.47844.mail@vickysh.wlink.com.np>
References: <Pine.LNX.4.44.0210301755110.19280-100000@dns.toxicfilms.tv>
Reply-To: mail@vickysh.wlink.com.np
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210301755110.19280-100000@dns.toxicfilms.tv>
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
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: netfilter@lists.samba.org

Yes I have read the FAQ .

I have 512 Mb of Ram and Hence the Maximum value of 
/proc/sys/net/ipv4/ip_conntrack_max must be 32768, which is what I have set 
already.

But Even this value is not enough for the connection passing through the 
firewall. It gets maxed out with minutes

If I increase the value what negative effect does it have??? Can I increase it 
to say 3276800 ???? Hope It doesnot crash my machine.


On Wednesday 30 October 2002 22:44, Maciej Soltysiak wrote:
> > Now I can see the lines "ip_conntrack : table full, dropping packet" in
> > my kern.log.
>
> Yes, but have you read the FAQ ? :) Guess not.
> You need to increase the /proc/net/ip_conntrack_max value, according to
> the FAQ, it gives some reasonable values depending on the RAM you have.
>
> > Does dropping packets means that it is actually dropping the packets or
> > just truncating the file /proc/net/ip_conntrack , does this affect my
> > client's connections???
>
> Well, it means that the state mechanism has no space to insert a
> conntrack entry, meaning, that the --state ESTABLISHED,RELATED works only
> to a limited number of currently tracked connections.
>
> Depending on your setup, it may do different things, but most probably it
> does whatever your POLICY instructs them to do. DROP ? Most certainly.
>
> In other words, it means that the --state rule will not match on the
> packet. It will not get accepted by this rule.
>
> Regards,
> Maciej Soltysiak

-- 
Best regards,


Vicky Shrestha
System Administrator
WorldLink Communications Pvt.Ltd
Jawalakhel, Kathmandu, Nepal.


