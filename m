From: William Stearns <wstearns@pobox.com>
Subject: Address type module - all unicast?
Date: Sun, 1 Feb 2004 21:57:59 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0402012140520.19607-100000@sparrow>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ML-netfilter <netfilter@lists.netfilter.org>, Patrick McHardy <kaber@trash.net>
Cc: William Stearns <wstearns@pobox.com>

Good day, all,
	I've started using the addrtype module.  Funny thing, though; I 
only seem to be able to get UNICAST source and destination addresses.  
(iptables -L -nxv output appended).
	Is this module legal in the filter table?  I hope so, as I'd like 
to be able to look for INPUT packets with, for example, a LOCAL or 
BROADCAST source address type and drop them.
	If it makes a difference, the kernel is a 2.4.23-rc3 with 
1.2.9-20031122 iptables and patch-o-matic.
	My apologies in advance is this is user error.  :-)
	Cheers,
	- Bill

---------------------------------------------------------------------------
	"I would give up my right arm before I'd give up my netfilter
firewall."
	-- Chris Brenton
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------



Chain INPUT (policy ACCEPT 2901118 packets, 330682572 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
  812686 65801094 inputsrcaddrtype  all  --  !lo    *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy ACCEPT 180198579 packets, 52094581037 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
110944255 32587214853 fwdsrcaddrtype  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
110941554 32586534304 fwddstaddrtype  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 3214113 packets, 449942923 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
  715804 118028709 outputdstaddrtype  all  --  *      !lo     0.0.0.0/0            0.0.0.0/0           

Chain fwddstaddrtype (1 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type UNSPEC 
110941554 32586534304 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type UNICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type LOCAL 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type BROADCAST 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type ANYCAST 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type MULTICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type BLACKHOLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type UNREACHABLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type PROHIBIT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type THROW 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type NAT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type XRESOLVE 

Chain fwdsrcaddrtype (1 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type UNSPEC 
110944255 32587214853 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type UNICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type LOCAL 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type BROADCAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type ANYCAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type MULTICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type BLACKHOLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type UNREACHABLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type PROHIBIT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type THROW 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type NAT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type XRESOLVE 

Chain inputsrcaddrtype (1 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type UNSPEC 
  812686 65801094 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type UNICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type LOCAL 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type BROADCAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type ANYCAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type MULTICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type BLACKHOLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type UNREACHABLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type PROHIBIT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type THROW 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type NAT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match src-type XRESOLVE 

Chain outputdstaddrtype (1 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type UNSPEC 
  715804 118028709 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type UNICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type LOCAL 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type BROADCAST 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type ANYCAST 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type MULTICAST 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type BLACKHOLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type UNREACHABLE 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type PROHIBIT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type THROW 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type NAT 
       0        0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           ADDRTYPE match dst-type XRESOLVE 




