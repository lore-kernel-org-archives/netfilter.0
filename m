From: Evgeni Vachkov <evgeni.vachkov@investis.com>
Subject: Re: ip_conntrack_tcp Errors
Date: 29 Jun 2004 10:30:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088501444.13933.259.camel@spudgun.dhcp.internal>
References: <Pine.LNX.4.33.0406290947300.22926-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406290947300.22926-100000@blackhole.kfki.hu>
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

On Tue, 2004-06-29 at 08:55, Jozsef Kadlecsik wrote:
> Assuming that eth0 faces with the client machine, issue the
> following command before starting the test:
> 
> # tcpdump -i eth0 -w capture.log tcp
> 
I have completed the dump, file is quite big > 63MB. Is there a
possibility to limit the dump to the tested source and destination ip-s
only?

What shall I do with it next?   

> I assume you run Linux on the client machine running ab as well, don't
> you?
>  

Yes. 

> What it the output of
> 
> # cat /proc/sys/net/ipv4/ip_local_port_range

32768   61000

> 
> on that machine?




