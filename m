From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied to eth1.
Date: Wed, 11 Sep 2002 19:32:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911183220.HHVX13709.mta07-svc.ntlworld.com@there>
References: <87sn0g4p8o.fsf@prium.net> <3D7F8925.7050102@sapience.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7F8925.7050102@sapience.com>
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

On Wednesday 11 September 2002 7:19 pm, Lists wrote:

> Erik:
>
> I dont know if this does exactly what you want, but have you tried
> putting a
>
> HWADDR=xx:xx:xx:xx:xx:xx
>
> line into each /etc/sysconfig/network-scripts/ifcfg-ethx
> This should tie ethx to the specified mac address. Remember to update if
> you change hardware.

Sorry, what does this do ?   This looks specific to some distribution to me 
(and not one that I use) so it would be nice to know what happens to that 
information and how it gets integrated with netfilter rules ?

Antony.

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

