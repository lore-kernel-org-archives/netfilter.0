From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Nat PROBLEM
Date: Mon, 24 Jun 2002 14:34:17 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206241334.OAA15743@slate.rockstone.co.uk>
References: <13475154937.20020624131156@eb3cef.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <13475154937.20020624131156@eb3cef.net>
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

On Monday 24 June 2002 12:11 pm, lcef wrote:

> Hello netfilter,
>
>   I have 2 machines, with DSL conection.
>   First machine have eth0 (213.23.xxx.xxx) and second machine with a
>   second ethernet named eth1(192.168.2.1).
>   I have a webcam in the second machine(192.168.1.21 eth1)and i want
>   who any people go to first machine (213.23.xxx.xxx)can look the
>   webcam who are installed in de second machine 192.168.2.1:8080.
>   In others words when you type http://213.23.xxx.xxx:8080  go to
>   192.168.2.1:8080.
>   What rules need i to put with IPFILTER?

iptables -A PREROUTING -d 213.23.xxx.xxx -p tcp --dport 8080 -j DNAT --to 
192.168.1.21
iptables -A FORWARD -d 192.168.1.21 -p tcp --dport 8080 -j ACCEPT

 

Antony.

