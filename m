From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: need help with ipset
Date: Fri, 15 Sep 2006 09:29:34 -0700
Message-ID: <450AD4EE.3050205@mailinator.com>
References: <4504CC74.3040607@mailinator.com>
	<Pine.LNX.4.58.0609140855340.18386@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0609140855340.18386@blackhole.kfki.hu>
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

Jozsef Kadlecsik wrote:

 > On Sun, 10 Sep 2006, Mike Wright wrote:
 >
 >> Trying to create a set:
 >>    "ipset -N TEST iphash" fails with:
 >>       ipset v2.2.9: Error from kernel: Protocol not available
 >
 >
 >
 > The ipset binary isn't smart enough to autoload the ip_set kernel module,
 > you need to load it manually (or via /etc/modules at system boot time):
 >
 > # modprobe ip_set
 >
Thanks Jozsef.  (Sorry for private reply.  Meant to reply to the list.) 
  That worked.  Also had to modprobe ip_set_iphash.

Still can't get iptables to recognize my set.  Can't find which step 
I've missed.  Here's the ipset -L

  Name: BADIPS
  Type: iphash
  References: 0
  Default binding:
  Header: hashsize: 1024 probes: 8 resize: 50
  Members:
  3.4.5.6
  2.3.4.5
  1.2.3.4
  Bindings:

...and modules
   lsmod |grep ip_set
     ip_set_iphash           8164  1
     ip_set                 20828  2 ip_set_iphash

Now I want to add a rule to iptables.

   "iptables -A INPUT -m set --set BADIPS src -j DROP"

But it errs with

   "iptables: No chain/target/match by that name"

It seems that iptables does not know about BADIPS? <Grasping />

If anyone knows what is missing I would sure appreciate the help :)

Thanks,
Mike Wright

 > Best regards,
 > Jozsef



