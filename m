From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local machine to another
Date: Sun, 29 Jun 2003 23:55:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030629235525.216360cb.arnt@c2i.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net>
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

On Fri, 27 Jun 2003 20:50:58 -0700, 
Michael <freeware@adsl-209-204-165-151.sonic.net> wrote in message 
<3EFD10A2.6020807@adsl-209-204-165-151.sonic.net>:

> Dear netfilter gods,
> 
> I have a configuration, so:
> 
> /------------\ .0.2     .{0,1}.1 /----------\ 1.2.3.4  (          )
> | Web server |-----+-------------| firewall |---------(  Internet  )
> \------------/     |        eth0 |  Squid   | eth1     (          )
>                     |             \----------/
> /---------\ .1.2   |
> | browser |--------/
> \---------/
> 
> - The 192.168.{0,1}. subnets run on the same wire.

..with what subnet?  /23 oughtta work.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



