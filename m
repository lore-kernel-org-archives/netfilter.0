From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Blocking Windows
Date: Thu, 29 May 2003 20:18:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030529201846.223e6c4c.arnt@c2i.net>
References: <C037E4BA8D79D71196AF00805F777E98028A0C@colosrva.colosseum.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <C037E4BA8D79D71196AF00805F777E98028A0C@colosrva.colosseum.com>
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

On Thu, 29 May 2003 11:27:11 -0400, 
Dominic Irrcher <dirrcher@colosseum.com> wrote in message 
<C037E4BA8D79D71196AF00805F777E98028A0C@colosrva.colosseum.com>:

> what about giving each os a different ip ?
> 
> then when users boot up into windows, block those ips you gave the
> windows hosts.
> 
> ie. 192.168 on linux, and 10.10 on windows, block all 10.10 on the 
> LAN!
> 
> something along those lines

..can also be automated to first block _everything_, then hear dhcp ip
request broadcasts from clients, then first check os with nmap or
nessus before award an ip from dhcp.  Static ip tricksters can be
blocked too.

..yet another option is run a ipv6 gateway, I don't believe 
wintendo can do ipv6, concequently they will be kept nicely 
off Internet, can some wintendoite confirm or refute me here?

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



