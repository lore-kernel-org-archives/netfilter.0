From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Couldn't load
	match	`stealth':/usr/local/lib/iptables/libipt_stealth.so
Date: Thu, 14 Jul 2005 15:45:27 +0200
Message-ID: <42D66C77.2040709@lopsch.com>
References: <42D627D0.6050503@laukas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D627D0.6050503@laukas.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Siegbert Laukas schrieb:
> My System run's with IPTABLES 1.3.x. I have also installed the newest 
> GRSECURITY-patch which enable the stealth-Kernel Module.
> 
> In the /lib/modules/2.6.11.xx/.. the stealth-ko module ist exists.
> Also with modprobe ipt_stealth the stealts-module is loading.
> 
> With running the command "iptables -A INPUT -p tcp -m stealth -j DROP" i 
> receive the following error-message:
> 
> "iptables v1.3.2: Couldn't load match 
> 'stealth':/usr/local/lib/iptables/libipt_stealth.so: cannot open shared 
> object file: No such file or directory"
> 
> if anyone know some informations ???
> 
> Thanks
> Siegbert Laukas
> 
> 
> 

I think you will need the iptables patch as well. It can be found on the 
grsecurity hp.

