From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: QOS/TC
Date: Sat, 5 Jul 2003 16:48:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030705164802.27ac28e4.arnt@c2i.net>
References: <BA12368A8F510340A0CD3D5A7D42A37C04739F@mail.zeus.shabazian.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BA12368A8F510340A0CD3D5A7D42A37C04739F@mail.zeus.shabazian.com>
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
To: Chip Shabazian <chip@shabazian.com>
Cc: netfilter@lists.netfilter.org

On Fri, 4 Jul 2003 15:08:23 -0700, 
"Chip Shabazian" <chip@shabazian.com> wrote in message 
<BA12368A8F510340A0CD3D5A7D42A37C04739F@mail.zeus.shabazian.com>:

> I'm hoping to get some help regarding bandwidth restriction. 
> Basically, I have a system that is functioning as a router/firewall at
> a colo site. It's got 10 ethernet interfaces in it so that I could
> give each person their own subnet.  I'm fine with the routing and
> firewalling, but I want to be able to restrict certain people to
> various levels of throughput since I have to pay when we go over our
> 1Mb cap.  From what I've been able to determine, I need to use tc to
> setup qdisc's, but I have not been able to find any good references
> either online or in print that will explain clearly to someone who
> doesn't understand these tools how to setup these queues.  I will
> probably put something together for reference if anyone can help me
> understand these tools.
> 
>  
> 
> What would be really nice, is if someone could give me the commands to
> setup these queues, and explain what each item in the command is.  I
> realize this is a lot of work, but I'll gladly take any help I can
> get, and give back to the community what I am able to come up with.

..try my http://fmb.no/ipcop/setup-cbq-0.0.4.tar.bz2 
and tell me if you can make any sense out of it.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



