From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help
Date: Thu, 31 Oct 2002 08:50:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021031085040.FRMW9836.mta01-svc.ntlworld.com@there>
References: <F392BE64738A7143B00E86A5634FBF142C85@akun2900.intra.savi.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F392BE64738A7143B00E86A5634FBF142C85@akun2900.intra.savi.ch>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thursday 31 October 2002 8:27 am, Renato Rossi wrote:

> Hi Antony
> I'm sorry for my accademical English!
> I've a lot of problem with DNAT,
> I've web server (192.168.2.1/24) behind a dual homed firewall ($EXT=eth0
> $EXT_IP=A.B.C.D $INT=eth1 $INT_IP= 192.168.2.252)
> I set up DNAT roule and I can see packets with iptables -L -v -t nat, but
> no pakets wolk my internal lan (I use ethereal)
> I modify my rule to view if I can telnet web server in port 80 and all is
> ok SNAT work fine
>
> # SNAT
> $FW -t nat -A POSTROUTING -o $EXT -s $INT_NET -j SNAT --to-source $EXT_IP
>
> # DNAT
> $FW -t nat -A PREROUTING -p tcp -i $EXT --dport 80 -j DNAT --to-destination
> 192.168.2.1
>
> # FORWARD
> $FW -A FORWARD -i $EXT -p tcp --dport 80 -d 192.168.2.1 -j ACCEPT
> $FW -A FORWARD -o $EXT -p tcp --dport 80 -s 192.168.2.1 -j ACCEPT
>
> How can I resolv it??

There's no problem with the rules above.

Are you sure your ISP is allowing incoming connections on TCP port 80 ?

Try putting a LOG rule into your PREROUTING chain to log TCP port 80 packets 
and see if anything seems to be coming in to the firewall at all.

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

