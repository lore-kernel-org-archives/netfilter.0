From: Mitsuo HAMADA <mhamada@qwanty.com>
Subject: RE: FTP failed
Date: Fri, 05 Jul 2002 16:08:52 +0900 (JST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1025852932.3d254604721a4@skyblue.qwanty.com>
References: <200FAA488DE0D41194F10010B597610D2BA246@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA246@JUPITER>
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
To: George Vieira <GeorgeV@citadelcomputer.com.au>
Cc: netfilter@lists.samba.org

Hello, George.
Thank you for your reply.

I will try this settings.

> $IPTABLES -A POSTROUTING -o $EXTDEV -t nat -s $INTWK -p tcp --dport 21
> -j
> MASQUERADE # ALL Workstations
> $IPTABLES -A INPUT -i lo -j ACCEPT
> $IPTABLES -A INPUT -i $INTDEV -j ACCEPT
> $IPTABLES -A FORWARD -i eth0 -j ACCEPT
> $IPTABLES -A INPUT -i $EXTDEV -p tcp -m state --state
> ESTABLISHED,RELATED -j
> ACCEPT 


--
Mitsuo HAMADA

