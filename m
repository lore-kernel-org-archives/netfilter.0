From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: NAT or Proxy?
Date: Fri, 13 Jun 2003 01:03:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030613050344.GA11340@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E94@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E94@wardrive.citadelcomputer.com.au>
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
Content-Transfer-Encoding: 7bit
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: John Paul <john@pinoylinux.sytes.net>, netfilter@lists.netfilter.org

On Fri, Jun 13, 2003 at 11:31:54AM +1000, George Vieira wrote:

> Change your ACCEPT to MAQUERADE.. ACCEPT will cause your 192.168.0.0 IPs to go out to the internet and guess what the ISP does to them.. yes, drops them...

Actually the ISP's don't bother to check the source and drop if private IP
found. They just route it to their destination. It's the return packets
which would get dropped because of the lack of the routing entry...

I know, they should check the src not only for the private IP's but also
for the spoofed packets but just imagine the load of this process on the
edge routers...

Ramin

> Thanks,

