From: Zoilo <zoilo@xs4all.nl>
Subject: Re: iptables REDIRECT with patch-o-matic
Date: Fri, 13 Sep 2002 16:27:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02091316272103.05245@Lms>
References: <02091316163300.00916@sanitarium>
Reply-To: zoilo@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <02091316163300.00916@sanitarium>
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
To: Rohan Almeida <arc_of_descent@gmx.net>, netfilter@lists.netfilter.org

On Friday 13 September 2002 12:46, Rohan Almeida wrote:
> Hi List,
>
> Take the following command:
> [rohan@sanitarium rohan]$ iptables -t nat -i eth0 -A PREROUTING \
> 			--protocol tcp -s 10.0.0.0/255.255.255.0 \
> 			-d 10.0.0.1/32 --dport www -j REDIRECT \
> 			--to-port 800
>
> With redhat rpms, kernel-2.4.18-5, iptables-1.2.5-3
> the above command works fine.
>
> Now, i downloaded iptables-1.2.7a, patch-o-matic-20020825
> and using kernel source tree of 2.4.18
> I applied the following patches of patch-o-matic:
> 	base AND extra
>
> Then i compiled the kernel.
> Now with this patched kernel and iptables-1.2.5-3 rpm,
> I am getting the following error when running the above command:
> "iptables: Invalid argument"
>
> What am i doing wrong?
>
> If i just have to upgrade my iptables to 1.2.7a, then
> i'm sorry for posting this :-)

Yes, I think that will fix your problem.

When you compile and install iptables, pay attention that the default 
installation will be in /usr/local/sbin, whereas RH defaults their 
installation to /sbin. 

For this reason, don't forget to uninstall iptables-1.2.5 (rpm -e iptables), 
or you will still be running "/sbin/iptables" (the old version). instead of 
"/usr/local/sbin/iptables" (the new version).

You may also compile iptables-1.2.7a to install in /sbin of course (see 
Makefile).

In case of doubt, run "whereis -b iptables" to get a list of all 
iptables-binaries in your system..


-- 
Z.
----------------------------------------------------------
"If all you have is a hammer, everything looks like a nail."

