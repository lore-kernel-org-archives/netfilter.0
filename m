From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Is iptables kickin' that much?
Date: Sat, 07 Sep 2002 11:11:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D79C2C3.3040702@fugmann.dhs.org>
References: <3D793DE4.2060504@fugmann.dhs.org> <3D796080.000001.00644@athlon1000>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: wickedsun <wickedsun@phreaker.net>, netfilter@lists.netfilter.org

wickedsun wrote:
> DC++ is a Direct Connect client. You can use either Passive or Active 
> mode. It's just like FTP. In passive you get the search responces from 
> the server where as Active, the users send you the responces directly 
> thru port 1412. I used to have to map the ports, but after flushing my 
> forwards and adding your rules to my IPtables, it worked.
>  

If Active mode spawns a new connection, then I do not understand why it 
works. Try to see if the port is always open by telnetting to it from a 
host on the internet.

Also you should try to use NMAP (from a remote machine) to see what how 
many ports are open on your machine.

Regards
Anders Fugmann


