From: Askar <askarali@gmail.com>
Subject: Re: Ethernet port redirection
Date: Fri, 7 Jan 2005 16:05:13 +0500
Message-ID: <a0f69e5050107030534f7a516@mail.gmail.com>
References: <000d01c4f33a$5ac1f590$eaab9385@gagan>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000d01c4f33a$5ac1f590$eaab9385@gagan>
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
Content-Type: text/plain; charset="us-ascii"
To: Navneet <navneetkc@gmail.com>
Cc: netfilter@lists.netfilter.org

make user squid is configured for transparent proxying "interception" 
    * httpd_accel_host virtual
    * httpd_accel_port 80
    * httpd_accel_with_proxy on
    * httpd_accel_uses_host_header on

regards



On Wed, 5 Jan 2005 20:52:06 +0530, Navneet <navneetkc@gmail.com> wrote:
> Hi,
> 
> Now, pease check this out :-
> I was trying to run squid in transparent mode(Transparent Proxying) ?
> 
> System details:
> RedHat Linux 9
> eth0 133.147.171.169/8 [Internal NIC]
> eth1 172.21.133/14        [External NIC]
> 
> All http request get REDIRECTED to squid  at eth0(Internal).It should work
> as Gateway by means of eth1(External).
> 
> i've done this:
> 1.Enabled IP forwarding
> #echo "1" >/proc/sys/net/ipv4/ip_forward
> 2.iptables (Netfilter) PORT REDIRECTION:
> #iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 3128
> 
> Port not getting REDIRECTED as per above iptables rule?.
> Why it so?
> 
> Thanks
> 
> Regards,
> Navneet
> 
> "Learning Linux"
> 
> Reference:
> http://www.ibiblio.org/pub/Linux/docs/HOWTO/TransparentProxy
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> http://www.iptablesrocks.org/
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

