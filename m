From: "Arif Mahmood" <arif786@rogers.com>
Subject: RE: Upgrade Iptables...
Date: Mon, 16 Sep 2002 15:23:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c25db6$90e19890$3a00a8c0@am>
References: <000901c25d82$4b822ff0$d201a8c0@hornet>
Reply-To: <arif786@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c25d82$4b822ff0$d201a8c0@hornet>
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

Hi Raj, 

How do I do the  patch-o-matic, I mean if you send me the steps to do
patch-o-matic on RedHat 7.3.  I couldn't find the  patch-o-matic
documentations.

I'm new to Linux and trying to learn as much as can with the help of you
guys....

Thanks and Best Regards,
Arif
 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Raj
Wurttemberg
Sent: Monday, September 16, 2002 9:09 AM
To: 'Didier Hung Wan Luk'; 'Netfilter Mailing List'
Subject: RE: Upgrade Iptables...


> I have redhat 7.3 with kernel linux-2.4.18-10 and I want to use 
> iptables 1.2.7a.
> 
> When I compile iptables do I need to recompile my kernel to use the 
> 1.2.7a version of iptables?

Hello Didier,

You will want to apply the patch-o-matic to your kernel and then
recompile your kernel prior to compiling and using the 1.2.7a version of
iptables. I could be wrong, but I do not think that the default RedHat
kernel has all of the necessary iptables modules.

/*Raj*/




