From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquerade (Newbie)
Date: Sun, 9 Jun 2002 16:56:16 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206091556.g59FuIA04902@Networker.rockstone.co.uk>
References: <200206091647.32562.richard.downing@bcs.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206091647.32562.richard.downing@bcs.org.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Sunday 09 June 2002 4:47 pm, Richard A Downing wrote:

> If I command: iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to
> 62.255.122.217 then this happens:
>
> iptables -t nat --list
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> SNAT       all  --  anywhere             anywhere           to:192.168.1.0

What is the local address of ppp0 at the time you did this ?


Antony.

