From: Alexey Sheshka <pulsar@magister.by>
Subject: Re: FTP Forwarding
Date: Fri, 22 Nov 2002 12:24:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021122122402.064d280c.pulsar@magister.by>
References: <00a801c2920f$1322d5d0$e6353fc1@nexor.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a801c2920f$1322d5d0$e6353fc1@nexor.co.uk>
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

On Fri, 22 Nov 2002 10:08:16 -0000
Bantam <netfilter@end.yorks.com> wrote:

> Hi,
> 
> I've been trying to forward port 21 to an ftp server on another machine, IP
> address  10.0.0.199.
> 
> eth1 - external (connected to the net)
> eth0 - internal
> 
> /sbin/iptables -A FORWARD -p tcp -i eth1 --dport 21 -j ACCEPT
> /sbin/iptables -A PREROUTING -t nat -p tcp -i eth1 --dport 21 -j DNAT --to
> 10.0.0.199:21
> 
> but can't get it to work..
> 
> any ideas ?
> 

FTP is a complex protocol .
http://www.freesoft.org/CIE/Topics/69.htm

> Thanks
> 
> Wasim
> 
> 
> 


-- 
Sheshka Aleksey
Senior Security Administrator

PGP key : http://pgp.dtype.org:11371/pks/lookup?op=get&search=0x0BE90515

